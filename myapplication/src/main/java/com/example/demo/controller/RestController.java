package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.model.User;
import com.example.demo.service.UserService;

@org.springframework.web.bind.annotation.RestController
public class RestController {
	@Autowired
	private UserService userService;
	
	@GetMapping("/")
	public String hello() {
		return "This is home page";
	}
	
	@GetMapping("saveuser")
	public String saveUser(@RequestParam int age,@RequestParam String firstname,@RequestParam String lastname,@RequestParam String password,@RequestParam String username) {
		User user =new User(username, firstname, lastname, age, password);
		userService.saveMyUser(user);
		return "User Saved";
	}
}
