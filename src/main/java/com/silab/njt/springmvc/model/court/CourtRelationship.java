package com.silab.njt.springmvc.model.court;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.OnDelete;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "COURT_RELATIONSHIP")
public class CourtRelationship {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "NAME", nullable = false)
    private String name;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MAIN_COURT_ID")
    private Court mainCourt;

    @OneToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "COURT_RELATIONSHIP_COURT",
            joinColumns = {@JoinColumn(name = "COURT_RELATIONSHIP_ID")},
            inverseJoinColumns = {@JoinColumn(name = "COURT_ID")})
    @Cascade(org.hibernate.annotations.CascadeType.DELETE)
    private Set<Court> allRelationshipCourts;

    public long getId() {
        return id;
    }

    public CourtRelationship setId(long id) {
        this.id = id;
        return this;
    }

    public String getName() {
        return name;
    }

    public CourtRelationship setName(String name) {
        this.name = name;
        return this;
    }

    public Court getMainCourt() {
        return mainCourt;
    }

    public CourtRelationship setMainCourt(Court mainCourt) {
        this.mainCourt = mainCourt;
        return this;
    }

    public Set<Court> getAllRelationshipCourts() {
        return allRelationshipCourts;
    }

    public CourtRelationship setAllRelationshipCourts(Set<Court> allRelationshipCourts) {
        this.allRelationshipCourts = allRelationshipCourts;
        return this;
    }
}
