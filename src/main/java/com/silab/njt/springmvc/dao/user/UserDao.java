package com.silab.njt.springmvc.dao.user;

import java.util.List;

import com.silab.njt.springmvc.model.User;

public interface UserDao {

	User findById(long id);

	void saveUser(User user);

	void update(User user);

	void deleteUserById(long id);

	List<User> findAllUsers();

	User findUserByName(String name);

}
