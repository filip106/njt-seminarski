package com.silab.njt.springmvc.model.blog;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.util.Set;

@Entity
@Table(name = "BLOG_POST")
public class BlogPost {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Size(min = 3, max = 128)
    @Column(name = "TITLE", unique = true, nullable = false)
    private String title;

    @Column(name = "CONTENT", nullable = false)
    private String content;

    @Column(name = "SLUG")
    private String slug;

    @Size(max = 255)
    @Column(name = "BASE_IMAGE", nullable = false)
    private String baseImage;

    @Column(name = "BLOG_RATING")
    private double rating;

    @ElementCollection(targetClass = String.class, fetch = FetchType.EAGER)
    @CollectionTable(name = "SET_OF_BLOG_POST_TAGS")
    private Set<String> tags;

    public long getId() {
        return id;
    }

    public BlogPost setId(long id) {
        this.id = id;
        return this;
    }

    public String getTitle() {
        return title;
    }

    public BlogPost setTitle(String title) {
        this.title = title;
        return this;
    }

    public String getContent() {
        return content;
    }

    public BlogPost setContent(String content) {
        this.content = content;
        return this;
    }

    public String getSlug() {
        return slug;
    }

    public BlogPost setSlug(String slug) {
        this.slug = slug;
        return this;
    }

    public String getBaseImage() {
        return baseImage;
    }

    public BlogPost setBaseImage(String baseImage) {
        this.baseImage = baseImage;
        return this;
    }

    public double getRating() {
        return rating;
    }

    public BlogPost setRating(double rating) {
        this.rating = rating;
        return this;
    }

    public Set<String> getTags() {
        return tags;
    }

    public BlogPost setTags(Set<String> tags) {
        this.tags = tags;
        return this;
    }

    public BlogPost addTag(String tag) {
        this.tags.add(tag);

        return this;
    }

    public BlogPost removeTag(String tag) {
        this.tags.remove(tag);

        return this;
    }
}
