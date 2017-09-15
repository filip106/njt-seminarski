package com.silab.njt.springmvc.controller.settings;

import com.silab.njt.springmvc.model.document.Image;
import com.silab.njt.springmvc.model.start_page_layout.StartPageLayout;
import com.silab.njt.springmvc.service.settings.SettingsService;
import com.silab.njt.springmvc.service.start_page_layout_service.StartPageLayoutService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.silab.njt.springmvc.model.settings.GeneralSettings;

import javax.xml.bind.DatatypeConverter;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

@RestController
@RequestMapping("/private/json")
public class SettingsRestController {

    @Autowired
    private SettingsService settingsService;
    @Autowired
    private StartPageLayoutService startPageLayoutService;

    @RequestMapping(value = "/general-settings/edit", method = RequestMethod.PUT, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<GeneralSettings> generalSettingsEditAction(@RequestBody GeneralSettings generalSettings) {
        if (generalSettings.getImage().getId() == 0) {
            String imageName = "site-logo.png";
            String imagePath = Image.imageUploadDir + imageName;
            String base64Content = generalSettings.getLogoImage();
            byte[] data = DatatypeConverter.parseBase64Binary(base64Content);
            try (OutputStream stream = new FileOutputStream(imagePath)) {
                stream.write(data);
            } catch (IOException ex) {
                return new ResponseEntity<>(HttpStatus.FAILED_DEPENDENCY);
            }
            generalSettings.setLogoImage("http://localhost:8080/resources/image/uploads/" + imageName);
            generalSettings.getImage().setImagePath("http://localhost:8080/resources/image/uploads/" + imageName);
        }

        settingsService.editCurrentSettings(settingsService.findCurrentSettings(), generalSettings);

        return new ResponseEntity<>(generalSettings, HttpStatus.OK);
    }

    @RequestMapping(value = "/start-page-layout/edit", method = RequestMethod.PUT, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<StartPageLayout> generalSettingsEditAction(@RequestBody StartPageLayout startPageLayout) {
        startPageLayoutService.editStartPageLayout(startPageLayoutService.findStartPageLayout(), startPageLayout);

        return new ResponseEntity<>(startPageLayout, HttpStatus.OK);
    }

    @RequestMapping(value = "/start-page-layout/save-slides-options", method = RequestMethod.PUT, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<StartPageLayout> generalSettingsEditSlideSettingsAction(@RequestBody StartPageLayout startPageLayout) {
        startPageLayoutService.editStartPageLayoutSlideOptions(startPageLayoutService.findStartPageLayout(), startPageLayout);

        return new ResponseEntity<>(startPageLayout, HttpStatus.OK);
    }

    @RequestMapping(value = "/start-page-layout/save-feature-options", method = RequestMethod.PUT, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<StartPageLayout> generalSettingsEditFeatureSettingsAction(@RequestBody StartPageLayout startPageLayout) {
        startPageLayoutService.editStartPageLayoutFeatureOptions(startPageLayoutService.findStartPageLayout(), startPageLayout);

        return new ResponseEntity<>(startPageLayout, HttpStatus.OK);
    }

    @RequestMapping(value = "/start-page-layout/save-review-options", method = RequestMethod.PUT, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<StartPageLayout> generalSettingsEditReviewsSettingsAction(@RequestBody StartPageLayout startPageLayout) {
        startPageLayoutService.editStartPageLayoutReviewOptions(startPageLayoutService.findStartPageLayout(), startPageLayout);

        return new ResponseEntity<>(startPageLayout, HttpStatus.OK);
    }
}
