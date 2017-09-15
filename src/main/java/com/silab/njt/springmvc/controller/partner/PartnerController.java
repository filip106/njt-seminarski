package com.silab.njt.springmvc.controller.partner;

import com.silab.njt.springmvc.service.partner.PartnerCategoryService;
import com.silab.njt.springmvc.service.partner.PartnerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PartnerController {

    @Autowired
    private PartnerService partnerService;
    @Autowired
    private PartnerCategoryService partnerCategoryService;

    @RequestMapping("/backend/partners")
    public String allPartnersPage(ModelMap model) {
        model.addAttribute("allPartner", partnerService.findAllPartners());

        return "backend-partner-page";
    }

    @RequestMapping("/backend/partner/add")
    public String addPartnerPage(ModelMap model) {
        model.addAttribute("partnerCategories", partnerCategoryService.findAllPartnerCategories());

        return "backend-partner-page-add";
    }

    @RequestMapping("/backend/partner/edit/{id}")
    public String editPartnerPage(@PathVariable Integer id, ModelMap model) {
        model.addAttribute("partnerCategories", partnerCategoryService.findAllPartnerCategories());
        model.addAttribute("partner", partnerService.findPartnerById(id));

        return "backend-partner-page-edit";
    }

    @RequestMapping("/backend/partner/manage-categories")
    public String managePartnerCategoriesPage(ModelMap model) {
        model.addAttribute("partnerCategories", partnerCategoryService.findAllPartnerCategories());

        return "backend-partner-manage-categories";
    }
}
