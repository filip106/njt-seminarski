package com.silab.njt.springmvc.dao.blog;

import com.silab.njt.springmvc.model.blog.BlogPost;

import java.util.List;

public interface BlogDao {

    BlogPost findById(int id);

    BlogPost findCourtBySlug(String slug);

    void saveCourt(BlogPost court);

    void deleteCourtById(long id);

    List<BlogPost> findAllCourts();
}
