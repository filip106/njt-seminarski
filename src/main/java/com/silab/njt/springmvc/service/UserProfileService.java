package com.silab.njt.springmvc.service;

import java.util.List;

import com.silab.njt.springmvc.model.UserProfile;

public interface UserProfileService {

	UserProfile findById(int id);

	UserProfile findByType(String type);

	public List<UserProfile> findAll();
}
