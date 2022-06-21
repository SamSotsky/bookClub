package com.sam.bookclub.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.sam.bookclub.models.Book;
import com.sam.bookclub.models.LoginUser;
import com.sam.bookclub.models.User;
import com.sam.bookclub.services.BookService;
import com.sam.bookclub.services.UserService;

@Controller
public class LoginController {
	
	@Autowired
	private UserService userServ;
	
	@Autowired
	private BookService bookServ;
	
	
	
	
//	DISPLAY
	@GetMapping("/")
	public String index(Model model, HttpSession sesh) {
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		if(sesh.getAttribute("uuid") !=null) {
			return "redirect:/home";
		}
		return "loginPage.jsp";
	}
	
	
	@GetMapping("/home")
	public String dashboard(Model model, HttpSession sesh) {
		if(sesh.getAttribute("uuid") == null) {
			return "redirect:/";
		}
		User user = userServ.findUser((Long) sesh.getAttribute("uuid"));
		model.addAttribute("user", user);
		List<Book> books = bookServ.allBooks();
		model.addAttribute("books", books);
		return "home.jsp";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession sesh) {
		sesh.removeAttribute("uuid");
		return "redirect:/";
	}
	
	
	
	
//	ACTION ROUTES
	
	@PostMapping("/reg")
	public String register(@Valid @ModelAttribute("newUser") 
	User newUser, 
		BindingResult result, 
		Model model, 
		HttpSession sesh) {
		
		User user = userServ.register(newUser, result);
		if(result.hasErrors()) {
			model.addAttribute("loginUser", new LoginUser());
			return "/loginPage.jsp";
		}
		sesh.setAttribute("uuid", user.getId());
		return "redirect:/home";
	}
	
	
	
	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin") 
	LoginUser newLogin, 
		BindingResult result, 
		Model model, 
		HttpSession sesh) {
		
		User user = userServ.login(newLogin, result);
		
		if(result.hasErrors()) {
			model.addAttribute("newUser", new User());
			return "loginPage.jsp";
		}
		sesh.setAttribute("uuid", user.getId());
		return "redirect:/home";
	}		
	
}
