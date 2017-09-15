package com.silab.njt.springmvc.model.start_page_layout;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class StartPageModal {

    @Column(name = "START_PAGE_MODAL_ACTIVE")
    private boolean modalActive;

    @Column(name = "START_PAGE_MODAL_CONTENT")
    private String content;

    public boolean isModalActive() {
        return modalActive;
    }

    public StartPageModal setModalActive(boolean modalActive) {
        this.modalActive = modalActive;
        return this;
    }

    public String getContent() {
        return content;
    }

    public StartPageModal setContent(String content) {
        this.content = content;
        return this;
    }
}
