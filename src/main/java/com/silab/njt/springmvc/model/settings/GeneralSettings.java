package com.silab.njt.springmvc.model.settings;

import com.silab.njt.springmvc.model.document.Image;

import java.io.Serializable;

import javax.persistence.*;
import javax.validation.constraints.Size;

@Entity
@Table(name = "GENERAL_SETTINGS")
public class GeneralSettings implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "WEB_SITE_NAME", nullable = false)
    private String webSiteName;

    @Column(name = "SHORT_DESCRIPTION", nullable = false)
    private String shortDescription;

    @Column(name = "LOGO_IMAGE")
    private String logoImage;

    @OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "IMAGE_ID")
    private Image image;

    @Column(name = "ALLOW_ANONYMOUS_RESERVATION")
    private boolean allowAnonymousReservation;

    @Size(min = 3, max = 64)
    @Column(name = "WEB_SITE_EMAIL")
    private String webSiteEmail;

    @Size(min = 3, max = 64)
    @Column(name = "FACEBOOK_LINK")
    private String facebookLink;

    @Size(min = 3, max = 64)
    @Column(name = "TWITTER_LINK")
    private String twitterLink;

    @Size(min = 3, max = 64)
    @Column(name = "LINKEDIN_LINK")
    private String linkedinLink;

    @Size(min = 3, max = 64)
    @Column(name = "GOOGLE_PLUS_LINK")
    private String googlePlusLink;

    @Size(min = 3, max = 64)
    @Column(name = "LOCATION_ADDRESS")
    private String locationAddress;
    @Size(min = 3, max = 64)

    @Column(name = "WORKING_HOURS")
    private String workingHours;


    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getWebSiteName() {
        return webSiteName;
    }

    public GeneralSettings setWebSiteName(String webSiteName) {
        this.webSiteName = webSiteName;
        return this;
    }

    public String getShortDescription() {
        return shortDescription;
    }

    public GeneralSettings setShortDescription(String shortDescription) {
        this.shortDescription = shortDescription;
        return this;
    }

    public String getLogoImage() {
        return logoImage;
    }

    public GeneralSettings setLogoImage(String logoImage) {
        this.logoImage = logoImage;
        return this;
    }

    public boolean isAllowAnonymousReservation() {
        return allowAnonymousReservation;
    }

    public GeneralSettings setAllowAnonymousReservation(boolean allowAnonymousReservation) {
        this.allowAnonymousReservation = allowAnonymousReservation;
        return this;
    }

    public String getWebSiteEmail() {
        return webSiteEmail;
    }

    public GeneralSettings setWebSiteEmail(String webSiteEmail) {
        this.webSiteEmail = webSiteEmail;
        return this;
    }

    public String getFacebookLink() {
        return facebookLink;
    }

    public GeneralSettings setFacebookLink(String facebookLink) {
        this.facebookLink = facebookLink;
        return this;
    }

    public String getTwitterLink() {
        return twitterLink;
    }

    public GeneralSettings setTwitterLink(String twitterLink) {
        this.twitterLink = twitterLink;
        return this;
    }

    public String getLinkedinLink() {
        return linkedinLink;
    }

    public GeneralSettings setLinkedinLink(String linkedinLink) {
        this.linkedinLink = linkedinLink;
        return this;
    }

    public String getGooglePlusLink() {
        return googlePlusLink;
    }

    public GeneralSettings setGooglePlusLink(String googlePlusLink) {
        this.googlePlusLink = googlePlusLink;
        return this;
    }

    public String getLocationAddress() {
        return locationAddress;
    }

    public GeneralSettings setLocationAddress(String locationAddress) {
        this.locationAddress = locationAddress;
        return this;
    }

    public String getWorkingHours() {
        return workingHours;
    }

    public GeneralSettings setWorkingHours(String workingHours) {
        this.workingHours = workingHours;
        return this;
    }

    public Image getImage() {
        return image;
    }

    public GeneralSettings setImage(Image image) {
        this.image = image;
        return this;
    }

    @Override
    public String toString() {
        return "GeneralSettings{" +
                "id=" + id +
                ", webSiteName='" + webSiteName + '\'' +
                ", shortDescription='" + shortDescription + '\'' +
                ", logoImage='" + logoImage + '\'' +
                ", allowAnonymousReservation=" + allowAnonymousReservation +
                ", webSiteEmail='" + webSiteEmail + '\'' +
                ", facebookLink='" + facebookLink + '\'' +
                ", twitterLink='" + twitterLink + '\'' +
                ", linkedinLink='" + linkedinLink + '\'' +
                ", googlePlusLink='" + googlePlusLink + '\'' +
                ", locationAddress='" + locationAddress + '\'' +
                ", workingHours='" + workingHours + '\'' +
                '}';
    }
}
