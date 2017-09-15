package com.silab.njt.springmvc.dao.partner;

import com.silab.njt.springmvc.dao.AbstractDao;
import com.silab.njt.springmvc.dao.court.CourtDao;
import com.silab.njt.springmvc.model.User;
import com.silab.njt.springmvc.model.court.Court;
import com.silab.njt.springmvc.model.partner.Partner;
import com.silab.njt.springmvc.model.partner.PartnerCategory;
import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("partnerDao")
public class PartnerDaoImpl extends AbstractDao<Long, Partner> implements PartnerDao {


    @Override
    @SuppressWarnings("unchecked")
    public List<Partner> findAllPartners() {
        Criteria criteria = createEntityCriteria();
        criteria.addOrder(Order.asc("priority"));

        return (List<Partner>) criteria.list();
    }

    @Override
    public Partner findPartnerById(long id) {
        return getByKey(id);
    }

    @Override
    public void saveMultiple(List<Partner> allPartnersDb) {
        for (Partner partner : allPartnersDb) {
            update(partner);
        }
    }

    @Override
    public void savePartner(Partner partner) {
        partner.setPartnerCategory(getSession().get(PartnerCategory.class, partner.getPartnerCategory().getId()));
        persist(partner);
    }

    @Override
    public void update(Partner entity) {
        entity.setPartnerCategory(getSession().get(PartnerCategory.class, entity.getPartnerCategory().getId()));
        super.update(entity);
    }

    @Override
    public void deletePartner(Partner partnerDb) {
        Query query = getSession().createSQLQuery("DELETE from Partner where id = :partner_id");
        query.setInteger("partner_id", (int) partnerDb.getId());
        query.executeUpdate();
    }
}
