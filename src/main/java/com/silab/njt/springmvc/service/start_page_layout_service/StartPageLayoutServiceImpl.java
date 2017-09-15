package com.silab.njt.springmvc.service.start_page_layout_service;

import com.silab.njt.springmvc.dao.start_page_layout.StartPageLayoutDao;
import com.silab.njt.springmvc.model.start_page_layout.CelebrityReview;
import com.silab.njt.springmvc.model.start_page_layout.MainFeature;
import com.silab.njt.springmvc.model.start_page_layout.Slide;
import com.silab.njt.springmvc.model.start_page_layout.StartPageLayout;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Iterator;

@Service("startPageLayoutService")
@Transactional
public class StartPageLayoutServiceImpl implements StartPageLayoutService {


    @Autowired
    private StartPageLayoutDao startPageLayoutDao;

    @Override
    @Cacheable("startPageLayout")
    public StartPageLayout findStartPageLayout() {
        return startPageLayoutDao.findStartPageLayout();
    }

    @Override
    @CacheEvict(value = "startPageLayout", allEntries = true)
    public void editStartPageLayout(StartPageLayout dbStartPageLayout, StartPageLayout startPageLayout) {
        startPageLayoutDao.editStartPageLayout(startPageLayout);
    }

    @Override
    public void editStartPageLayoutSlideOptions(StartPageLayout dbStartPageLayout, StartPageLayout startPageLayout) {
        for (Slide slide : startPageLayout.getAllSlides()) {
            for (Slide slideDB : dbStartPageLayout.getAllSlides()) {
                if (slide.getId() == slideDB.getId()) {
                    slideDB.setTitle(slide.getTitle());
                    slideDB.setMainContent(slide.getMainContent());
                    slideDB.setDetailsLink(slide.getDetailsLink());
                    slideDB.setLeadingText(slide.getLeadingText());
                    slideDB.setExternalLink(slide.getExternalLink());
                    break;
                }
            }
        }

        startPageLayoutDao.editStartPageLayout(dbStartPageLayout);
    }

    @Override
    public void editStartPageLayoutFeatureOptions(StartPageLayout dbStartPageLayout, StartPageLayout startPageLayout) {
        outer:
        for (Iterator<MainFeature> iterator = dbStartPageLayout.getAllFeatures().iterator(); iterator.hasNext(); ) {
            MainFeature mainFeatureDB = iterator.next();
            for (MainFeature mainFeature : startPageLayout.getAllFeatures()) {
                if (mainFeature.getId() == mainFeatureDB.getId()) {
                    continue outer;
                }
            }
            mainFeatureDB.setStartPageLayout(null);
            iterator.remove();
        }

        for (MainFeature mainFeature : startPageLayout.getAllFeatures()) {
            if (mainFeature.getId() != 0) {
                for (MainFeature mainFeatureDB : dbStartPageLayout.getAllFeatures()) {
                    if (mainFeature.getId() == mainFeatureDB.getId()) {
                        mainFeatureDB.setFeaturedTitle(mainFeature.getFeaturedTitle());
                        mainFeatureDB.setFeaturedContent(mainFeature.getFeaturedContent());
                        mainFeatureDB.setPriority(mainFeature.getPriority());
                        break;
                    }
                }
            } else {
                dbStartPageLayout.addFeature(
                        new MainFeature().setFeaturedTitle(mainFeature.getFeaturedTitle()).setFeaturedContent(mainFeature.getFeaturedContent())
                                .setFeatureIcon("fa fa-thumbs-o-up").setStartPageLayout(dbStartPageLayout).setPriority(mainFeature.getPriority())
                );
            }
        }

        startPageLayoutDao.editStartPageLayout(dbStartPageLayout);
    }

    @Override
    public void editStartPageLayoutReviewOptions(StartPageLayout dbStartPageLayout, StartPageLayout startPageLayout) {
        for (CelebrityReview celebrityReview : startPageLayout.getCelebrityReviews()) {
            for (CelebrityReview celebrityReviewDb : dbStartPageLayout.getCelebrityReviews()) {
                if (celebrityReview.getId() == celebrityReviewDb.getId()) {
                    celebrityReviewDb.setReviewTitle(celebrityReview.getReviewTitle());
                    celebrityReviewDb.setReviewText(celebrityReview.getReviewText());
                    celebrityReviewDb.setReviewLinkTitle(celebrityReview.getReviewLinkTitle());
                    celebrityReviewDb.setReviewLink(celebrityReview.getReviewLink());
                    break;
                }
            }
        }

        startPageLayoutDao.editStartPageLayout(dbStartPageLayout);
    }


}
