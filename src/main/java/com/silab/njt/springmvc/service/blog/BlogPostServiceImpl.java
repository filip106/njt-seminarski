package com.silab.njt.springmvc.service.blog;

import com.silab.njt.springmvc.dao.blog.BlogDao;
import com.silab.njt.springmvc.model.blog.BlogPost;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("blogPostService")
@Transactional
public class BlogPostServiceImpl implements BlogPostService {

    @Autowired
    private BlogDao blogDao;

    @Override
    public BlogPost findById(int id) {
        return blogDao.findById(id);
    }

    @Override
    public BlogPost findBlogBySlug(String slug) {
        return blogDao.findCourtBySlug(slug);
    }

    @Override
    public void saveCourt(BlogPost blogPost) {
        blogDao.saveCourt(blogPost);
    }

    @Override
    public void deleteBlogById(long id) {

    }

    @Override
    public List<BlogPost> findAllBlogPosts() {
        return blogDao.findAllCourts();
    }
}
