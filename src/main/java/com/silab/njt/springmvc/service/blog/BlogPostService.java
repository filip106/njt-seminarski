package com.silab.njt.springmvc.service.blog;

import com.silab.njt.springmvc.model.blog.BlogPost;

import java.util.List;

public interface BlogPostService {

    BlogPost findById(int id);

    BlogPost findBlogBySlug(String slug);

    void saveCourt(BlogPost blogPost);

    void deleteBlogById(long id);

    List<BlogPost> findAllBlogPosts();
}
