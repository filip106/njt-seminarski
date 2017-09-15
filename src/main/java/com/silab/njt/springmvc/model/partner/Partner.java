package com.silab.njt.springmvc.model.partner;

import com.silab.njt.springmvc.model.document.Image;

import javax.persistence.*;
import javax.validation.constraints.Size;

@Entity
@Table(name = "PARTNER")
public class Partner {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Size(min = 3, max = 64)
    @Column(name = "CAPTION", unique = true, nullable = false)
    private String caption;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "PARTNER_CATEGORY")
    private PartnerCategory partnerCategory;

    @Size(max = 255)
    @Column(name = "BASE_IMAGE", nullable = false)
    private String baseImage;

    @Column(name = "PARTNER_WEB_SITE")
    private String partnerWebSite;

    @Column(name = "FACEBOOK_LINK")
    private String facebookLink;

    @Column(name = "TWITTER_LINK")
    private String twitterLink;

    @Column(name = "PRIORITY")
    private int priority;

    @OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "IMAGE_ID")
    private Image image;

    public long getId() {
        return id;
    }

    public Partner setId(long id) {
        this.id = id;
        return this;
    }

    public String getCaption() {
        return caption;
    }

    public Partner setCaption(String caption) {
        this.caption = caption;
        return this;
    }

    public PartnerCategory getPartnerCategory() {
        return partnerCategory;
    }

    public Partner setPartnerCategory(PartnerCategory partnerCategory) {
        this.partnerCategory = partnerCategory;
        return this;
    }

    public String getBaseImage() {
        return baseImage;
    }

    public Partner setBaseImage(String baseImage) {
        this.baseImage = baseImage;
        return this;
    }

    public String getPartnerWebSite() {
        return partnerWebSite;
    }

    public Partner setPartnerWebSite(String partnerWebSite) {
        this.partnerWebSite = partnerWebSite;
        return this;
    }

    public String getFacebookLink() {
        return facebookLink;
    }

    public Partner setFacebookLink(String facebookLink) {
        this.facebookLink = facebookLink;
        return this;
    }

    public String getTwitterLink() {
        return twitterLink;
    }

    public Partner setTwitterLink(String twitterLink) {
        this.twitterLink = twitterLink;
        return this;
    }

    public int getPriority() {
        return priority;
    }

    public Partner setPriority(int priority) {
        this.priority = priority;
        return this;
    }

    public Image getImage() {
        return image;
    }

    public Partner setImage(Image image) {
        this.image = image;
        return this;
    }

    @Override
    public String toString() {
        return "Partner{" +
                "id=" + id +
                ", caption='" + caption + '\'' +
                ", partnerCategory=" + partnerCategory +
                ", baseImage='" + baseImage + '\'' +
                ", partnerWebSite='" + partnerWebSite + '\'' +
                ", facebookLink='" + facebookLink + '\'' +
                ", twitterLink='" + twitterLink + '\'' +
                ", priority=" + priority +
                '}';
    }
}
