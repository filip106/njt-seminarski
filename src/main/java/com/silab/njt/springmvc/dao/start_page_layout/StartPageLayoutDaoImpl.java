package com.silab.njt.springmvc.dao.start_page_layout;

import com.silab.njt.springmvc.dao.AbstractDao;
import com.silab.njt.springmvc.dao.settings.SettingsDao;
import com.silab.njt.springmvc.model.settings.GeneralSettings;
import com.silab.njt.springmvc.model.start_page_layout.StartPageLayout;
import org.hibernate.Criteria;
import org.springframework.stereotype.Repository;

@Repository("startPageLayoutDao")
public class StartPageLayoutDaoImpl extends AbstractDao<Integer, StartPageLayout> implements StartPageLayoutDao {

    @Override
    public StartPageLayout findStartPageLayout() {
        Criteria criteria = createEntityCriteria();

        return (StartPageLayout) criteria.uniqueResult();
    }

    @Override
    public void editStartPageLayout(StartPageLayout startPageLayout) {
        update(startPageLayout);
    }
}
