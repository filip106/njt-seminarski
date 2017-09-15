package com.silab.njt.springmvc.dao.settings;

import com.silab.njt.springmvc.dao.AbstractDao;
import com.silab.njt.springmvc.model.settings.GeneralSettings;
import org.hibernate.Criteria;
import org.springframework.stereotype.Repository;

@Repository("settingsDao")
public class SettingsDaoImpl extends AbstractDao<Integer, GeneralSettings> implements SettingsDao {

    @Override
    @SuppressWarnings("unchecked")
    public GeneralSettings findCurrentSettings() {
        Criteria criteria = createEntityCriteria();

        return (GeneralSettings) criteria.uniqueResult();
    }

    @Override
    public void editCurrentSettings(GeneralSettings generalSettings) {
        update(generalSettings);
    }
}
