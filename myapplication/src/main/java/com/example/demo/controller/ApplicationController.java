package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.model.User;
import com.example.demo.service.UserService;

@RestController
@CrossOrigin(origins = { "http://localhost:3000"})
@RequestMapping("/entry/board")
public class ApplicationController {
	
	@Autowired
	private UserService userService;
	@RequestMapping("/welcome")
	public String welcome(HttpServletRequest request) {
		request.setAttribute("mode","MODE_HOME");
		return "welcomepage";
	}
	
	@RequestMapping("/register")
	public String registration(HttpServletRequest request) {
		request.setAttribute("mode","MODE_REGISTER");
		return "welcomepage";
	}
	@PostMapping("")
	public ResponseEntity<?> Addboard(@RequestBody User user){
		User add = userService.saveMyUser(user);
		return new ResponseEntity<User>(add,HttpStatus.CREATED);
	}
	/*@PostMapping("/save-user")
	public String registeruser(@ModelAttribute User user,BindingResult bindingResult,HttpServletRequest request) {
		userService.saveMyUser(user);
		request.setAttribute("mode","MODE_HOME");
		return "welcomepage";
	}*/
	
	/*@GetMapping("/show-users")
	public ResponseEntity<?> showAllusers(@RequestBody User user) {
		User show=userService.showAllusers();
		//request.setAttribute("mode","ALL_USERS");
		return "welcomepage";
	}*/
	@GetMapping("/all")
    public Iterable<User> getAlldata(){
        return userService.findAll();
    }
	
	@GetMapping("/show-users")
	public String showAllusers(HttpServletRequest request) {
		request.setAttribute("users",userService.showAllusers());
		//request.setAttribute("mode","ALL_USERS");
		return "welcomepage";
	}
	@DeleteMapping("/{id}")
	public ResponseEntity<?> deleteCourse(@PathVariable int id) 
	{
		userService.deleteMyuser(id);
		return new ResponseEntity<String>("User Deleted",HttpStatus.OK);
		
	}
	@GetMapping("/update/{id}")
	public ResponseEntity<?> getdata(@PathVariable int id){
		User user = userService.updateuser(id);
		return new ResponseEntity<User>(user,HttpStatus.OK);
	}
	
	/*@GetMapping("/{pt_id}")
    public ResponseEntity<?> getPTById(@PathVariable Long pt_id){
        User user = userService.findById(pt_id);
        return new ResponseEntity<User>(user, HttpStatus.OK);
    }*/
	
	/*@RequestMapping("/delete-user")
	public String deleteuser(@RequestParam int id,HttpServletRequest request)
	{
		userService.deleteMyuser(id);
		request.setAttribute("users",userService.showAllusers());
		request.setAttribute("mode","ALL_USERS");
		return "welcomepage";
		
	}
	@RequestMapping("/edit-user")
	public String updateuser(@RequestParam int id,HttpServletRequest request) {
		request.setAttribute("user", userService.updateuser(id));
		request.setAttribute("mode", "UPDATE");
		return "welcomepage";
	}*/
	@RequestMapping("/login")
	public String login(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_LOGIN");
		return "welcomepage";
	}
	
	@RequestMapping ("/login-user")
	public String loginUser(@ModelAttribute User user, HttpServletRequest request) {
		if(userService.findByUsernameAndPassword(user.getUsername(), user.getPassword())!=null) {
			return "home";
		}
		else {
			request.setAttribute("error", "Invalid Username or Password");
			request.setAttribute("mode", "MODE_LOGIN");
			return "welcomepage";
			
		}
	}
	@RequestMapping ("/card")
	public String card(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_CARD");
		return "welcomepage";
	}
}
