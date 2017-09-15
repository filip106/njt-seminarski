package com.silab.njt.springmvc.model.document;

import javax.persistence.*;


@Entity
@Table(name = "IMAGE")
public class Image {

    /** Root dir for all uploads files */
    public final static String imageUploadDir = "C:\\Users\\Filip\\Desktop\\nsj sajt\\SpringMVC\\src\\main\\webapp\\resources\\image\\uploads\\";

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "IMAGE_PATH")
    private String imagePath;

    @Transient
    private String base64Content;


    public long getId() {
        return id;
    }

    public Image setId(long id) {
        this.id = id;
        return this;
    }

    public String getImagePath() {
        return imagePath;
    }

    public Image setImagePath(String imagePath) {
        this.imagePath = imagePath;
        return this;
    }

    public String getBase64Content() {
        return base64Content;
    }

    public Image setBase64Content(String base64Content) {
        this.base64Content = base64Content;
        return this;
    }
}
