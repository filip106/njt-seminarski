package com.silab.njt.springmvc.service.settings;

import com.silab.njt.springmvc.dao.settings.SettingsDao;
import com.silab.njt.springmvc.model.settings.GeneralSettings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("settingsService")
@Transactional
public class SettingsServiceImpl implements SettingsService {

    @Autowired
    private SettingsDao settingsDao;

    @Override
    @Cacheable("generalSettings")
    public GeneralSettings findCurrentSettings() {
        return settingsDao.findCurrentSettings();
    }

    @Override
    @CacheEvict(value = "generalSettings", allEntries = true)
    public void editCurrentSettings(GeneralSettings dbGeneralSettings, GeneralSettings generalSettings) {
        dbGeneralSettings.setWebSiteName(generalSettings.getWebSiteName());
        dbGeneralSettings.setShortDescription(generalSettings.getShortDescription());
        dbGeneralSettings.setWebSiteEmail(generalSettings.getWebSiteEmail());
        dbGeneralSettings.setFacebookLink(
                (generalSettings.getFacebookLink() != null && generalSettings.getFacebookLink().length() > 3)
                        ? generalSettings.getFacebookLink()
                        : dbGeneralSettings.getFacebookLink());
        dbGeneralSettings.setTwitterLink(
                (generalSettings.getTwitterLink() != null && generalSettings.getTwitterLink().length() > 3)
                        ? generalSettings.getTwitterLink()
                        : dbGeneralSettings.getTwitterLink());
        dbGeneralSettings.setLinkedinLink(
                (generalSettings.getLinkedinLink() != null && generalSettings.getLinkedinLink().length() > 3)
                        ? generalSettings.getLinkedinLink()
                        : dbGeneralSettings.getLinkedinLink());
        dbGeneralSettings.setGooglePlusLink(
                (generalSettings.getGooglePlusLink() != null && generalSettings.getGooglePlusLink().length() > 3)
                        ? generalSettings.getGooglePlusLink()
                        : dbGeneralSettings.getGooglePlusLink());

        dbGeneralSettings.setLocationAddress(generalSettings.getLocationAddress());
        dbGeneralSettings.setWorkingHours(generalSettings.getWorkingHours());
        settingsDao.editCurrentSettings(dbGeneralSettings);
    }
}
