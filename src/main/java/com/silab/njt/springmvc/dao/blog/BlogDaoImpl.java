package com.silab.njt.springmvc.dao.blog;

import com.silab.njt.springmvc.dao.AbstractDao;
import com.silab.njt.springmvc.model.blog.BlogPost;
import com.silab.njt.springmvc.model.court.Court;
import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("blogDao")
public class BlogDaoImpl extends AbstractDao<Integer, BlogPost> implements BlogDao {

    @Override
    public BlogPost findById(int id) {
        return getByKey(id);
    }

    @Override
    public BlogPost findCourtBySlug(String slug) {
        Criteria criteria = createEntityCriteria();
        criteria.add(Restrictions.eq("slug", slug));

        return (BlogPost) criteria.uniqueResult();
    }

    @Override
    public void saveCourt(BlogPost blogPost) {
        persist(blogPost);
    }

    @Override
    public void deleteCourtById(long id) {

    }

    @Override
    @SuppressWarnings("unchecked")
    public List<BlogPost> findAllCourts() {
        Criteria criteria = createEntityCriteria();

        return (List<BlogPost>) criteria.list();
    }
}
