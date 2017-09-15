package com.silab.njt.springmvc.controller.blog;

import com.silab.njt.springmvc.service.blog.BlogPostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BlogController {

    @Autowired
    private BlogPostService blogPostService;

    @RequestMapping("/backend/blog-posts")
    public String blogPage(ModelMap model) {
        model.addAttribute("allBlogPosts", blogPostService.findAllBlogPosts());

        return "backend-blog-page";
    }

    @RequestMapping("/backend/blog-post/add")
    public String addBlogPage(ModelMap model) {
        return "backend-blog-page-add";
    }
}
