package com.sam.bookclub.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.sam.bookclub.models.LoginUser;
import com.sam.bookclub.models.User;
import com.sam.bookclub.repo.UserRepo;


@Service
public class UserService {
	
	@Autowired
	private UserRepo userRepo;
	
//	REGISTER =========================================================================================
	
	public User register(User newUser, BindingResult result) {
		if(userRepo.findByEmail(newUser.getEmail()).isPresent()) {
			result.rejectValue("email", "unique", "Email is already in use");
		}
		if(!newUser.getPassword().equals(newUser.getConfirmPassword())) {
			result.rejectValue("confirmPassword", "Matched", "Confirmed Password does not match");
		}
		if(result.hasErrors()) {
			return null;
		}
//		Hash and set password, save user to the DB
		String hash = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
		newUser.setPassword(hash);
//		SAVE USER TO DB
		return userRepo.save(newUser);
	}
	
	
//	LOG IN ========================================================================================
	public User login(LoginUser loginUser, BindingResult result) {
		Optional<User> optionalUser = userRepo.findByEmail(loginUser.getEmail());
		if(optionalUser.isPresent()) {
			
			User user = optionalUser.get();
			if(BCrypt.checkpw(loginUser.getPassword(), user.getPassword())) {
				return user;
			}
		}
		result.rejectValue("email", "loginError", "Invalid Email");
		result.rejectValue("password", "loginError", "Invalid Password");
		return null;
	}
	
//	FIND USER BY ID
	 public User findUser(Long id) {
	        Optional<User> optionalUser = userRepo.findById(id);
	        if(optionalUser.isPresent()) {
	            return optionalUser.get();
	        } else {
	            return null;
	        }
	    }
}
