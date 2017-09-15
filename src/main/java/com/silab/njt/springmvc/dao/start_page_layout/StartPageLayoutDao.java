package com.silab.njt.springmvc.dao.start_page_layout;

import com.silab.njt.springmvc.model.start_page_layout.StartPageLayout;

public interface StartPageLayoutDao {

    StartPageLayout findStartPageLayout();

    void editStartPageLayout(StartPageLayout startPageLayout);
}
