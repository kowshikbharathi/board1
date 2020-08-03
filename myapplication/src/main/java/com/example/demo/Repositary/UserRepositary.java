package com.example.demo.Repositary;

import org.springframework.data.repository.CrudRepository;

import com.example.demo.model.User;

public interface UserRepositary extends CrudRepository<User, Integer> {
	public User findById(int id);
	public User findByUsernameAndPassword(String username,String password);
}
