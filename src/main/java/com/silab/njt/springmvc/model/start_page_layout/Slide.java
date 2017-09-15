package com.silab.njt.springmvc.model.start_page_layout;

import javax.persistence.*;

@Entity
@Table(name = "SLIDE")
public class Slide {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "DETAILS_LINK")
    private String detailsLink;

    @Column(name = "EXTERNAL_LINK")
    private String externalLink;

    @Column(name = "TITLE")
    private String title;

    @Column(name = "MAIN_CONTENT")
    private String mainContent;

    @Column(name = "LEADING_TEXT")
    private String leadingText;

    @Column(name = "PRIORITY")
    private String priority;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "START_PAGE_LAYOUT_ID")
    private StartPageLayout startPageLayout;

    public long getId() {
        return id;
    }

    public Slide setId(long id) {
        this.id = id;
        return this;
    }

    public String getDetailsLink() {
        return detailsLink;
    }

    public Slide setDetailsLink(String detailsLink) {
        this.detailsLink = detailsLink;
        return this;
    }

    public String getExternalLink() {
        return externalLink;
    }

    public Slide setExternalLink(String externalLink) {
        this.externalLink = externalLink;
        return this;
    }

    public String getTitle() {
        return title;
    }

    public Slide setTitle(String title) {
        this.title = title;
        return this;
    }

    public String getMainContent() {
        return mainContent;
    }

    public Slide setMainContent(String mainContent) {
        this.mainContent = mainContent;
        return this;
    }

    public String getLeadingText() {
        return leadingText;
    }

    public Slide setLeadingText(String leadingText) {
        this.leadingText = leadingText;
        return this;
    }

    public StartPageLayout getStartPageLayout() {
        return startPageLayout;
    }

    public Slide setStartPageLayout(StartPageLayout startPageLayout) {
        this.startPageLayout = startPageLayout;
        return this;
    }
}
