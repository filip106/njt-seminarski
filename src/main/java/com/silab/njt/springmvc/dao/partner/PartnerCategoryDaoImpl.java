package com.silab.njt.springmvc.dao.partner;

import com.silab.njt.springmvc.dao.AbstractDao;
import com.silab.njt.springmvc.model.partner.PartnerCategory;
import org.hibernate.Criteria;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("partnerCategoryDao")
public class PartnerCategoryDaoImpl extends AbstractDao<Long, PartnerCategory> implements PartnerCategoryDao {

    @Override
    @SuppressWarnings("unchecked")
    public List<PartnerCategory> findAllPartnerCategories() {
        Criteria criteria = createEntityCriteria();

        return (List<PartnerCategory>) criteria.list();
    }

    @Override
    public void saveNewPartnerCategory(PartnerCategory partnerCategory) {
        persist(partnerCategory);
    }

    public void updateMultiple(List<PartnerCategory> categories) {
        for (PartnerCategory partnerCategory : categories) {
            if (partnerCategory.getId() != 0) {
                update(partnerCategory);
            } else {
                persist(partnerCategory);
            }
        }
    }
}
