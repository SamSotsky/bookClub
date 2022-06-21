package com.sam.bookclub.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.sam.bookclub.models.Book;
import com.sam.bookclub.models.User;
import com.sam.bookclub.services.BookService;
import com.sam.bookclub.services.UserService;

@Controller
public class BookController {

	
	@Autowired
	private BookService bookServ;
	
	@Autowired
	private UserService userServ;
	
	

//	 Display 
	
	@GetMapping("/new")
	public String newBook(Model model) {
		model.addAttribute("newBook", new Book());
		return "newBook.jsp";
	}
	
	@GetMapping("/books/{id}")
	public String oneBook(@PathVariable("id")Long id, Model model) {
		Book book = bookServ.getBook(id);
		if(book == null) {
			return "redirect:/dashboard";
		}
		model.addAttribute("book", book);
		
		if(book.getUser() != null) {
			User user = userServ.findUser(book.getUser().getId());
			model.addAttribute("user", user);
		}
		return "oneBook.jsp";
	}	
	
	
	
//	 Action 
	@PostMapping("/createNewBook")
	public String createBook(@Valid @ModelAttribute("newBook") 
		Book book, 
		BindingResult result, 
		HttpSession sesh) {
			if(result.hasErrors()) {
				return "/newBook.jsp";
		}
		User user = userServ.findUser((Long) sesh.getAttribute("uuid"));
		book.setUser(user);
		bookServ.createBook(book);
		return "redirect:/home";
	}
	
	
	@DeleteMapping("/{id}")
	public String delete(@PathVariable("id") Long id) {		
		bookServ.deleteBook(id);
		return "redirect:/home";
	}

}
