package com.silab.njt.springmvc.service.partner;

import com.silab.njt.springmvc.dao.partner.PartnerCategoryDao;
import com.silab.njt.springmvc.model.partner.PartnerCategory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("partnerCategoryService")
@Transactional
public class PartnerCategoryServiceImpl implements PartnerCategoryService {

    @Autowired
    private PartnerCategoryDao partnerCategoryDao;

    @Override
    public List<PartnerCategory> findAllPartnerCategories() {
        return partnerCategoryDao.findAllPartnerCategories();
    }

    @Override
    public void saveNewPartnerCategory(PartnerCategory partnerCategory) {
        partnerCategoryDao.saveNewPartnerCategory(partnerCategory);
    }

    public void updateMultiple(List<PartnerCategory> categories) {
        partnerCategoryDao.updateMultiple(categories);
    }
}
