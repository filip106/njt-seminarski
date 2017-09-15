package com.silab.njt.springmvc.dao.court;

import com.silab.njt.springmvc.dao.AbstractDao;
import com.silab.njt.springmvc.model.court.Court;
import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("courtDao")
public class CourtDaoImpl extends AbstractDao<Long, Court> implements CourtDao {

    @Override
    public Court findById(long id) {
        return getByKey(id);
    }

    @Override
    public Court findCourtBySlug(String slug) {
        Criteria criteria = createEntityCriteria();
        criteria.add(Restrictions.eq("slug", slug));
        Court court = (Court) criteria.uniqueResult();

        if (!court.getAllCourtRelationship().isEmpty()) {
            court.getAllCourtRelationship().forEach(Hibernate::initialize);
        }

        return court;
    }

    @Override
    public void saveCourt(Court court) {
        persist(court);
    }

    @Override
    @SuppressWarnings("deprecation")
    public void deleteCourtById(long id) {
        Query query = getSession().createSQLQuery("DELETE from COURT where id = :court_id");
        query.setInteger("court_id", (int) id);
        query.executeUpdate();
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Court> findAllCourts() {
        Criteria criteria = createEntityCriteria();

        return (List<Court>) criteria.list();
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Court> findAllCourts(int page, int offset) {
        Criteria criteria = createEntityCriteria();

        return (List<Court>) criteria.list();
    }
}
