package com.silab.njt.springmvc.model.start_page_layout;

import javax.persistence.*;

@Entity
@Table(name = "MAIN_FEATURE")
public class MainFeature {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "FEATURED_ICON")
    private String featureIcon;

    @Column(name = "FEATURED_TITLE")
    private String featuredTitle;

    @Column(name = "FEATURED_CONTENT")
    private String featuredContent;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "START_PAGE_LAYOUT_ID")
    private StartPageLayout startPageLayout;

    @Column(name = "PRIORITY")
    private String priority;

    public long getId() {
        return id;
    }

    public MainFeature setId(long id) {
        this.id = id;
        return this;
    }

    public String getFeatureIcon() {
        return featureIcon;
    }

    public MainFeature setFeatureIcon(String featureIcon) {
        this.featureIcon = featureIcon;
        return this;
    }

    public String getFeaturedTitle() {
        return featuredTitle;
    }

    public MainFeature setFeaturedTitle(String featuredTitle) {
        this.featuredTitle = featuredTitle;
        return this;
    }

    public String getFeaturedContent() {
        return featuredContent;
    }

    public MainFeature setFeaturedContent(String featuredContent) {
        this.featuredContent = featuredContent;
        return this;
    }

    public StartPageLayout getStartPageLayout() {
        return startPageLayout;
    }

    public MainFeature setStartPageLayout(StartPageLayout startPageLayout) {
        this.startPageLayout = startPageLayout;
        return this;
    }

    public String getPriority() {
        return priority;
    }

    public MainFeature setPriority(String priority) {
        this.priority = priority;
        return this;
    }
}
