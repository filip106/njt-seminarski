package com.silab.njt.springmvc.controller.settings;

import com.silab.njt.springmvc.service.partner.PartnerService;
import com.silab.njt.springmvc.service.settings.SettingsService;
import com.silab.njt.springmvc.service.start_page_layout_service.StartPageLayoutService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SettingsController {

    @Autowired
    private SettingsService settingsService;

    @Autowired
    private StartPageLayoutService startPageLayoutService;

    @Autowired
    private PartnerService partnerService;


    @RequestMapping("/backend/general-settings")
    public String generalSettingsAction(ModelMap model) {
        model.addAttribute("generalSettings", settingsService.findCurrentSettings());

        return "backend-general-settings-page";
    }

    @RequestMapping("/backend/start-page-layout")
    public String startPageLayout(ModelMap model) {
        model.addAttribute("startPageLayout", startPageLayoutService.findStartPageLayout());
        model.addAttribute("allPartners", partnerService.findAllPartners());

        return "backend-start-page-layout";
    }

}
