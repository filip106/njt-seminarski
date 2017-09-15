package com.silab.njt.springmvc.model.court;

import com.silab.njt.springmvc.model.document.Image;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.util.Set;

@Entity
@Table(name = "COURT")
public class Court {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "TITLE", unique = true, nullable = false)
    private String title;

    @Column(name = "DESCRIPTION", nullable = false)
    private String description;

    @Size(max = 255)
    @Column(name = "SHORT_DESCRIPTION", nullable = false)
    private String shortDescription;

    @Column(name = "INFO", nullable = false)
    private String info;

    @Column(name = "BASE_PRICE")
    private int basePrice;

    private String slug;

    @Size(max = 255)
    @Column(name = "BASE_IMAGE")
    private String baseImage;

    @OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "IMAGE_ID")
    private Image image;

//    @ElementCollection
//    private Set<String> images;

    @Column(name = "PHONE_NUMBER")
    private String phoneNumber;

    @Column(name = "ADDRESS")
    private String address;

    @Column(name = "WORKING_HOURS")
    private String workingHours;

    @Column(name = "VIDEO")
    private String video;

    @Column(name = "PART_OF_CITY")
    private String partOfCity;

    @Column(name = "COURT_BASE")
    private String courtBase;

    @Column(name = "NUMBER_OF_PLAYERS")
    private String numberOfPlayers;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "mainCourt", cascade = CascadeType.ALL)
    private Set<CourtRelationship> allCourtRelationship;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public String getBaseImage() {
        return baseImage;
    }

    public Court setBaseImage(String baseImage) {
        this.baseImage = baseImage;
        return this;
    }

    //    public Set<String> getImages() {
//        return images;
//    }
//
//    public void setImages(Set<String> images) {
//        this.images = images;
//    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getWorkingHours() {
        return workingHours;
    }

    public void setWorkingHours(String workingHours) {
        this.workingHours = workingHours;
    }

    public String getVideo() {
        return video;
    }

    public void setVideo(String video) {
        this.video = video;
    }

    public String getShortDescription() {
        return shortDescription;
    }

    public Court setShortDescription(String shortDescription) {
        this.shortDescription = shortDescription;
        return this;
    }

    public int getBasePrice() {
        return basePrice;
    }

    public Court setBasePrice(int basePrice) {
        this.basePrice = basePrice;
        return this;
    }

    public String getSlug() {
        return slug;
    }

    public Court setSlug(String slug) {
        this.slug = slug;
        return this;
    }

    public String getPartOfCity() {
        return partOfCity;
    }

    public Court setPartOfCity(String partOfCity) {
        this.partOfCity = partOfCity;
        return this;
    }

    public String getCourtBase() {
        return courtBase;
    }

    public Court setCourtBase(String courtBase) {
        this.courtBase = courtBase;
        return this;
    }

    public String getNumberOfPlayers() {
        return numberOfPlayers;
    }

    public Court setNumberOfPlayers(String numberOfPlayers) {
        this.numberOfPlayers = numberOfPlayers;
        return this;
    }

    public Set<CourtRelationship> getAllCourtRelationship() {
        return allCourtRelationship;
    }

    public Court setAllCourtRelationship(Set<CourtRelationship> allCourtRelationship) {
        this.allCourtRelationship = allCourtRelationship;
        return this;
    }

    public Image getImage() {
        return image;
    }

    public Court setImage(Image image) {
        this.image = image;
        return this;
    }
}
