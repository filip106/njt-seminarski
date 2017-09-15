package com.silab.njt.springmvc.service.partner;

import com.silab.njt.springmvc.model.partner.Partner;

import java.util.List;

public interface PartnerService {


    List<Partner> findAllPartners();

    Partner findPartnerById(long id);

    void savePartnersOrder(List<Partner> allPartnersDb, List<Partner> allPartners);

    void    savePartner(Partner partner);

    void editPartner(Partner partnerDb, Partner partner);

    void deletePartner(Partner partnerDb);
}
