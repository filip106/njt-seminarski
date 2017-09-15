package com.silab.njt.springmvc.service.court;

import com.silab.njt.springmvc.model.court.Court;

import java.util.List;

public interface CourtService {

    Court findById(long id);

    List<Court> findAllCourts();

    List<Court> findAllCourts(int page, int offset);

    Court findCourtBySlug(String slug);

    void saveCourt(Court court);

    void updateCourt(Court court);

    void deleteCourtById(long id);
}
