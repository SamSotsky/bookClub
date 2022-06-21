package com.sam.bookclub.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sam.bookclub.models.Book;
import com.sam.bookclub.repo.BookRepo;


@Service
public class BookService {
	
//	CRUD
	@Autowired
	private BookRepo bookRepo;
	
	
	
//	READ ALL
	public List<Book> allBooks() {
		return bookRepo.findAll();
	}
	
	
//	Creates book
	public Book createBook(Book b) {
		return bookRepo.save(b);
	}
	
	
	
//	get book by ID
	public Book getBook(Long id) {
		Optional<Book> optionalBook = bookRepo.findById(id);
		if(optionalBook.isPresent()) {
			return optionalBook.get();
		} else {
			return null;
		}
	}

	public void deleteBook(Long id) {
		bookRepo.deleteById(id);
	}
	
}
