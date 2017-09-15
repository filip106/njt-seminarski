package com.silab.njt.springmvc.service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.silab.njt.springmvc.model.UserProfile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.silab.njt.springmvc.dao.user.UserDao;
import com.silab.njt.springmvc.model.User;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao dao;
    @Autowired
    private UserProfileService userProfileService;
    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public User findById(long id) {
        return dao.findById((int) id);
    }

    @Override
    public List<User> findAllUsers() {
        return dao.findAllUsers();
    }

    @Override
    public User findByUsername(String name) {
        return dao.findUserByName(name);
    }

    @Override
    public void saveUser(User user) {
        Set<UserProfile> profiles = new HashSet<>();
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        profiles.add(userProfileService.findById(user.getUserProfiles().iterator().next().getId()));
        user.setUserProfiles(profiles);
        dao.saveUser(user);
    }

    @Override
    public void updateUser(User dbUser, User user) {
        dbUser.setFirstName(user.getFirstName());
        dbUser.setLastName(user.getLastName());
        if (dbUser.getUserProfiles().iterator().next().getId().intValue() != user.getUserProfiles().iterator().next().getId().intValue()) {
            dbUser.removeAllUserProfiles();
            dbUser.addUserProfile(userProfileService.findById(user.getUserProfiles().iterator().next().getId()));
        }

        dao.update(dbUser);
    }

    @Override
    public void deleteUserById(long id) {
        dao.deleteUserById(id);
    }

    @Override
    public void deleteAllUsers() {
        // TODO Auto-generated method stub

    }

    @Override
    public boolean isUserExist(User user) {
        return findByUsername(user.getUsername()) != null;
    }

}
