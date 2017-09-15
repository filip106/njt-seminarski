package com.silab.njt.springmvc.controller.court;

import com.silab.njt.springmvc.service.court.CourtService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CourtController {

    @Autowired
    private CourtService courtService;

    @RequestMapping("/backend/courts")
    public String courtPage(ModelMap model) {
        model.addAttribute("allCourts", courtService.findAllCourts());

        return "backend-court-page";
    }

    @RequestMapping("/backend/court/add")
    public String addCourtPage(ModelMap model) {
        return "backend-court-page-add";
    }

    @RequestMapping("/backend/court/edit/{id}")
    public String editCourtPage(@PathVariable Integer id, ModelMap model) {
        model.addAttribute("editedCourt", courtService.findById(id.longValue()));

        return "backend-court-page-edit";
    }

    @RequestMapping("/backend/court/manage-categories")
    public String mangeCourtCategoriesPage(ModelMap model) {
        return "backend-court-manage-categories";
    }
}
