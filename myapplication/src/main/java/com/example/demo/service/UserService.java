package com.example.demo.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.example.demo.Repositary.UserRepositary;
import com.example.demo.model.User;

@Service
@Transactional
public class UserService {
	
	private final UserRepositary userRepositary;
	
	public UserService(UserRepositary userRepositary) {
		this.userRepositary=userRepositary;
	}
	public User saveMyUser(User user){
		return userRepositary.save(user);
	}
	public List<User>showAllusers(){
		List<User>users = new ArrayList<User>();
		for(User user:userRepositary.findAll()) {
			users.add(user);
		}
		return users;
	}
	
	 public Iterable<User> findAll(){
	        return userRepositary.findAll();
	    }
	public void deleteMyuser(int id) {
		userRepositary.deleteById(id);
	}
	public User updateuser(int id) {
		return userRepositary.findById(id);
	}
	public User findByUsernameAndPassword(String username, String password) {
		return userRepositary.findByUsernameAndPassword(username, password);
	}
}
