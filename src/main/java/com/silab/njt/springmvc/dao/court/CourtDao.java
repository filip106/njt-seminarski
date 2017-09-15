package com.silab.njt.springmvc.dao.court;

import com.silab.njt.springmvc.model.court.Court;

import java.util.List;

public interface CourtDao {

    Court findById(long id);

    Court findCourtBySlug(String slug);

    void saveCourt(Court court);

    void deleteCourtById(long id);

    List<Court> findAllCourts();

    List<Court> findAllCourts(int page, int offset);

    void update(Court court);
}
