package com.silab.njt.springmvc.dao.partner;

import com.silab.njt.springmvc.model.partner.Partner;

import java.util.List;

public interface PartnerDao {
    List<Partner> findAllPartners();

    Partner findPartnerById(long id);

    void saveMultiple(List<Partner> allPartnersDb);

    void savePartner(Partner partner);

    void update(Partner partner);

    void deletePartner(Partner partnerDb);
}
