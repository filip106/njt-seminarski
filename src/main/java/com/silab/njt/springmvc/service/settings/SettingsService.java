package com.silab.njt.springmvc.service.settings;

import com.silab.njt.springmvc.model.settings.GeneralSettings;

public interface SettingsService {

    GeneralSettings findCurrentSettings();

    void editCurrentSettings(GeneralSettings dbGeneralSettings, GeneralSettings generalSettings);
}
