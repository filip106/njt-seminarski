package com.silab.njt.springmvc.model.partner;

import javax.persistence.*;

@Entity
@Table(name = "PARTNER_CATEGORY")
public class PartnerCategory {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "TITLE", unique = true, nullable = false)
    private String title;


    public long getId() {
        return id;
    }

    public PartnerCategory setId(long id) {
        this.id = id;
        return this;
    }

    public String getTitle() {
        return title;
    }

    public PartnerCategory setTitle(String title) {
        this.title = title;
        return this;
    }

    @Override
    public String toString() {
        return "PartnerCategory{" +
                "id=" + id +
                ", title='" + title + '\'' +
                '}';
    }
}
