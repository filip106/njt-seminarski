package com.silab.njt.springmvc.dao.settings;

import com.silab.njt.springmvc.model.settings.GeneralSettings;

public interface SettingsDao {

    GeneralSettings findCurrentSettings();

    void editCurrentSettings(GeneralSettings generalSettings);
}
