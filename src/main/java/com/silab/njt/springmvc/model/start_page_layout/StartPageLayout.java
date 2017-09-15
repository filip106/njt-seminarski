package com.silab.njt.springmvc.model.start_page_layout;

import com.silab.njt.springmvc.model.court.Court;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "START_PAGE_LAYOUT")
public class StartPageLayout {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Embedded
    private StartPageModal startPageModal;

    @OneToMany(mappedBy = "startPageLayout", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private Set<Slide> allSlides;


    @OneToMany(mappedBy = "startPageLayout", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private Set<CelebrityReview> celebrityReviews;

    @OneToMany(mappedBy = "startPageLayout", cascade = CascadeType.ALL, fetch = FetchType.EAGER, orphanRemoval = true)
    private Set<MainFeature> allFeatures;

    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "COURT_ID")
    private Court featuredCourt;

//
//    @Embedded
//    private CelebrityReview mainTest;


    public long getId() {
        return id;
    }

    public StartPageLayout setId(long id) {
        this.id = id;
        return this;
    }

    public StartPageLayout setAllSlides(Set<Slide> allSlides) {
        this.allSlides = allSlides;
        return this;
    }

    public Set<Slide> getAllSlides() {
        return allSlides;
    }

    public void addNewSlide(Slide slide) {
        allSlides.add(slide);
        slide.setStartPageLayout(this);
    }

    public void removeSlide(Slide slide) {
        allSlides.remove(slide);
        slide.setStartPageLayout(null);
    }

    public StartPageModal getStartPageModal() {
        return startPageModal;
    }

    public StartPageLayout setStartPageModal(StartPageModal startPageModal) {
        this.startPageModal = startPageModal;
        return this;
    }

    public StartPageLayout setCelebrityReviews(Set<CelebrityReview> celebrityReviews) {
        this.celebrityReviews = celebrityReviews;
        return this;
    }

    public Set<CelebrityReview> getCelebrityReviews() {
        return celebrityReviews;
    }

    public void addCelebrityReview(CelebrityReview celebrityReview) {
        celebrityReviews.add(celebrityReview);
        celebrityReview.setStartPageLayout(this);
    }

    public void removeCelebrityReview(CelebrityReview celebrityReview) {
        celebrityReviews.remove(celebrityReview);
        celebrityReview.setStartPageLayout(null);
    }

    public StartPageLayout setAllFeatures(Set<MainFeature> allFeatures) {
        this.allFeatures = allFeatures;
        return this;
    }

    public Set<MainFeature> getAllFeatures() {
        return allFeatures;
    }

    public void addFeature(MainFeature mainFeature) {
        allFeatures.add(mainFeature);
        mainFeature.setStartPageLayout(this);
    }

    public void removeFeature(MainFeature mainFeature) {
        allFeatures.remove(mainFeature);
        mainFeature.setStartPageLayout(null);
    }

    public Court getFeaturedCourt() {
        return featuredCourt;
    }

    public StartPageLayout setFeaturedCourt(Court featuredCourt) {
        this.featuredCourt = featuredCourt;
        return this;
    }
}
