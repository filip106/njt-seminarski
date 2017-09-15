package com.silab.njt.springmvc.service.partner;

import com.silab.njt.springmvc.model.partner.PartnerCategory;

import java.util.List;

public interface PartnerCategoryService {

    List<PartnerCategory> findAllPartnerCategories();

    void saveNewPartnerCategory(PartnerCategory partnerCategory);

    void updateMultiple(List<PartnerCategory> categories);
}
