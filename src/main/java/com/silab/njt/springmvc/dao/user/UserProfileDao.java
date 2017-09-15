package com.silab.njt.springmvc.dao.user;

import java.util.List;

import com.silab.njt.springmvc.model.UserProfile;

public interface UserProfileDao {

	UserProfile findById(int id);

	UserProfile findByType(String type);

	public List<UserProfile> findAll();
}
