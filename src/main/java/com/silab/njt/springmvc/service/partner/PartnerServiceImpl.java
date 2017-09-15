package com.silab.njt.springmvc.service.partner;

import com.silab.njt.springmvc.dao.partner.PartnerDao;
import com.silab.njt.springmvc.model.partner.Partner;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("partnerService")
@Transactional
public class PartnerServiceImpl implements PartnerService {

    @Autowired
    private PartnerDao partnerDao;

    @Override
    @Cacheable("allPartners")
    public List<Partner> findAllPartners() {
        return partnerDao.findAllPartners();
    }

    @Override
    public Partner findPartnerById(long id) {
        return partnerDao.findPartnerById(id);
    }

    @Override
    @CacheEvict(value = "allPartners", allEntries = true)
    public void savePartnersOrder(List<Partner> allPartnersDb, List<Partner> allPartners) {
        for (Partner partner : allPartners) {
            for (Partner dbPartner : allPartnersDb) {
                if (partner.getId() == dbPartner.getId()) {
                    dbPartner.setPriority(partner.getPriority());
                    break;
                }
            }
        }

        partnerDao.saveMultiple(allPartnersDb);
    }

    @Override
    @CacheEvict(value = "allPartners", allEntries = true)
    public void savePartner(Partner partner) {
        partnerDao.savePartner(partner);
    }

    @Override
    @CacheEvict(value = "allPartners", allEntries = true)
    public void editPartner(Partner partnerDb, Partner partner) {
        partnerDb.setCaption(partner.getCaption());
        partnerDb.setPartnerCategory(partner.getPartnerCategory());
        partnerDb.setPartnerWebSite(partner.getPartnerWebSite());
        partnerDb.setFacebookLink(partner.getFacebookLink());
        partnerDb.setTwitterLink(partner.getTwitterLink());

        partnerDao.update(partnerDb);
    }

    @Override
    @CacheEvict(value = "allPartners", allEntries = true)
    public void deletePartner(Partner partnerDb) {
        partnerDao.deletePartner(partnerDb);
    }
}
