package com.silab.njt.springmvc.controller.user;

import java.util.List;

import com.silab.njt.springmvc.service.UserProfileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.silab.njt.springmvc.model.User;
import com.silab.njt.springmvc.service.UserService;

@Controller
public class UserController {

    @Autowired
    UserService service;
    @Autowired
    private UserProfileService userProfileService;

    @RequestMapping("/backend/users")
    public String userPage(ModelMap model) {
        List<User> users = service.findAllUsers();
        model.addAttribute("users", users);

        return "backend-user-page";
    }

    @RequestMapping("/backend/user/add")
    public String addUserPage(ModelMap model) {
        model.addAttribute("allUserProfiles", userProfileService.findAll());

        return "backend-user-page-add";
    }

    @RequestMapping("/backend/user/edit/{id}")
    public String addUserPage(@PathVariable Integer id, ModelMap model) {
        model.addAttribute("user", service.findById(id.longValue()));
        model.addAttribute("allUserProfiles", userProfileService.findAll());

        return "backend-user-page-edit";
    }
}
