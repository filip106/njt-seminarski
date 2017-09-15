package com.silab.njt.springmvc.interceptor;

import com.silab.njt.springmvc.model.settings.GeneralSettings;
import com.silab.njt.springmvc.service.settings.SettingsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FrontendCustomInterceptor extends HandlerInterceptorAdapter {

    @Autowired
    private SettingsService settingsService;

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        GeneralSettings currentSettings = settingsService.findCurrentSettings();

        if (modelAndView != null && modelAndView.getModelMap() != null) {
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            modelAndView.getModelMap().addAttribute("logedInUser", auth == null || (auth instanceof AnonymousAuthenticationToken) ? "annon." : auth.getName());
            modelAndView.getModelMap().addAttribute("generalSettings", currentSettings);
        }
    }
}
