package com.silab.njt.springmvc.model.start_page_layout;

import javax.persistence.*;

@Entity
@Table(name = "CELEBRITY_REVIEW")
public class CelebrityReview {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "REVIEW_IMAGE")
    private String reviewImage;

    @Column(name = "REVIEW_TITLE")
    private String reviewTitle;

    @Column(name = "REVIEW_LINK_TITLE")
    private String reviewLinkTitle;

    @Column(name = "REVIEW_LINK")
    private String reviewLink;

    @Column(name = "REVIEW_TEXT")
    private String reviewText;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "START_PAGE_LAYOUT_ID")
    private StartPageLayout startPageLayout;

    public long getId() {
        return id;
    }

    public CelebrityReview setId(long id) {
        this.id = id;
        return this;
    }

    public String getReviewImage() {
        return reviewImage;
    }

    public CelebrityReview setReviewImage(String reviewImage) {
        this.reviewImage = reviewImage;
        return this;
    }

    public String getReviewTitle() {
        return reviewTitle;
    }

    public CelebrityReview setReviewTitle(String reviewTitle) {
        this.reviewTitle = reviewTitle;
        return this;
    }

    public String getReviewLinkTitle() {
        return reviewLinkTitle;
    }

    public CelebrityReview setReviewLinkTitle(String reviewLinkTitle) {
        this.reviewLinkTitle = reviewLinkTitle;
        return this;
    }

    public String getReviewLink() {
        return reviewLink;
    }

    public CelebrityReview setReviewLink(String reviewLink) {
        this.reviewLink = reviewLink;
        return this;
    }

    public String getReviewText() {
        return reviewText;
    }

    public CelebrityReview setReviewText(String reviewText) {
        this.reviewText = reviewText;
        return this;
    }

    public StartPageLayout getStartPageLayout() {
        return startPageLayout;
    }

    public CelebrityReview setStartPageLayout(StartPageLayout startPageLayout) {
        this.startPageLayout = startPageLayout;
        return this;
    }
}
