package com.silab.njt.springmvc.service.start_page_layout_service;

import com.silab.njt.springmvc.model.start_page_layout.StartPageLayout;

public interface StartPageLayoutService {

    StartPageLayout findStartPageLayout();

    void editStartPageLayout(StartPageLayout dbStartPageLayout, StartPageLayout startPageLayout);

    void editStartPageLayoutSlideOptions(StartPageLayout dbStartPageLayout, StartPageLayout startPageLayout);

    void editStartPageLayoutFeatureOptions(StartPageLayout dbStartPageLayout, StartPageLayout startPageLayout);

    void editStartPageLayoutReviewOptions(StartPageLayout dbStartPageLayout, StartPageLayout startPageLayout);
}
