package com.silab.njt.springmvc.service;

import java.util.List;

import com.silab.njt.springmvc.model.User;

public interface UserService {

	User findById(long id);
	List<User> findAllUsers();

	User findByUsername(String username);

	void saveUser(User user);
	void updateUser(User dbUser, User user);
	void deleteUserById(long id);
	void deleteAllUsers();

	public boolean isUserExist(User user);
}
