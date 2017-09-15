package com.silab.njt.springmvc.dao.partner;

import com.silab.njt.springmvc.model.partner.PartnerCategory;

import java.util.List;

public interface PartnerCategoryDao {


    List<PartnerCategory> findAllPartnerCategories();

    void saveNewPartnerCategory(PartnerCategory partnerCategory);

    void updateMultiple(List<PartnerCategory> categories);
}
