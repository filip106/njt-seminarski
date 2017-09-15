package com.silab.njt.springmvc.controller;

import com.silab.njt.springmvc.service.UserService;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import com.silab.njt.springmvc.model.court.Court;
import com.silab.njt.springmvc.model.start_page_layout.StartPageLayout;
import com.silab.njt.springmvc.service.blog.BlogPostService;
import com.silab.njt.springmvc.service.court.CourtService;
import com.silab.njt.springmvc.service.order.OrderService;
import com.silab.njt.springmvc.service.partner.PartnerService;
import com.silab.njt.springmvc.service.start_page_layout_service.StartPageLayoutService;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class FrontendController {

    @Autowired
    private CourtService courtService;
    @Autowired
    private StartPageLayoutService startPageLayoutService;
    @Autowired
    private PartnerService partnerService;
    @Autowired
    private BlogPostService blogPostService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private UserService userService;

    @RequestMapping(value = {"/", "/home"})
    public String indexPage(ModelMap model) {
        model.addAttribute("layout", startPageLayoutService.findStartPageLayout());
        model.addAttribute("allPartner", partnerService.findAllPartners());

        return "index";
    }

    @RequestMapping(value = {"/all-courts"})
    public String allCourtsPage(ModelMap model) {
        List<Court> allCourts = courtService.findAllCourts();

        model.addAttribute("allCourts", allCourts);

        return "all-courts-frontend";
    }

    @RequestMapping(value = {"/court-details/{slug}"})
    public String courtDetailsPage(@PathVariable(value = "slug") String slug, ModelMap model) {
        Court court = courtService.findCourtBySlug(slug);
        model.addAttribute("court", court);
        model.addAttribute("allReservations", orderService.findAllReservationsForCourt((int) court.getId()));

        return "court-details-frontend";
    }

    @RequestMapping(value = {"/all-blogs"})
    public String allBlogsPage(ModelMap model) {
        model.addAttribute("allBlogPosts", blogPostService.findAllBlogPosts());

        return "all-blogs-frontend";
    }

    @RequestMapping(value = {"/blog-details/{slug}"})
    public String blogDetailsPage(@PathVariable(value = "slug") String slug, ModelMap model) {
        model.addAttribute("blogPost", blogPostService.findBlogBySlug(slug));

        return "blog-details-frontend";
    }

    @RequestMapping("/user/user-profile")
    public String userProfilePage(ModelMap model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();
        model.addAttribute("user", userService.findByUsername(name));

        return "user-profile-frontend";
    }
}
