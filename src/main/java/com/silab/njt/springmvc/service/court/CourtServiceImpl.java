package com.silab.njt.springmvc.service.court;

import com.silab.njt.springmvc.dao.court.CourtDao;
import com.silab.njt.springmvc.model.court.Court;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("courtService")
@Transactional
public class CourtServiceImpl implements CourtService {

    @Autowired
    private CourtDao courtDao;

    @Override
    public Court findById(long id) {
        return courtDao.findById((int) id);
    }

    @Override
    public List<Court> findAllCourts() {
        return courtDao.findAllCourts();
    }

    @Override
    public List<Court> findAllCourts(int page, int offset) {
        return courtDao.findAllCourts(page, offset);
    }

    @Override
    public Court findCourtBySlug(String slug) {
        return courtDao.findCourtBySlug(slug);
    }

    @Override
    public void saveCourt(Court court) {
        court.setSlug(court.getTitle().toLowerCase().replace(' ', '-'));
        courtDao.saveCourt(court);
    }

    @Override
    public void updateCourt(Court court) {
        courtDao.update(court);
    }

    @Override
    public void deleteCourtById(long id) {
        courtDao.deleteCourtById(id);
    }
}
