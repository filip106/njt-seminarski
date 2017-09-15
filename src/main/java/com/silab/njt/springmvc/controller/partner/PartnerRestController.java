package com.silab.njt.springmvc.controller.partner;

import com.silab.njt.springmvc.model.document.Image;
import com.silab.njt.springmvc.model.partner.Partner;
import com.silab.njt.springmvc.model.partner.PartnerCategory;
import com.silab.njt.springmvc.service.partner.PartnerCategoryService;
import com.silab.njt.springmvc.service.partner.PartnerService;
import org.omg.CORBA.NO_IMPLEMENT;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.xml.bind.DatatypeConverter;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

@RestController
@RequestMapping("/private/json")
public class PartnerRestController {

    @Autowired
    private PartnerService partnerService;
    @Autowired
    private PartnerCategoryService partnerCategoryService;

    private final static String partnerImageRootDir = Image.imageUploadDir + "partner\\";

    @RequestMapping(value = "/partner/save-list", method = RequestMethod.PUT, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<Partner>> savePartnersOrder(@RequestBody List<Partner> allPartners) {
        partnerService.savePartnersOrder(partnerService.findAllPartners(), allPartners);

        return new ResponseEntity<>(allPartners, HttpStatus.OK);
    }

    @RequestMapping(value = "/partner/", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Partner> saveNewPartner(@RequestBody Partner partner) {
        String imageName = System.currentTimeMillis() + ".png";
        String imagePath = partnerImageRootDir + imageName;

        String base64Content = partner.getBaseImage();
        byte[] data = DatatypeConverter.parseBase64Binary(base64Content);
        try (OutputStream stream = new FileOutputStream(imagePath)) {
            stream.write(data);
        } catch (IOException ex) {
            return new ResponseEntity<>(HttpStatus.FAILED_DEPENDENCY);
        }

        partner.setBaseImage("http://localhost:8080/resources/image/uploads/partner/" + imageName);
        partner.getImage().setImagePath("http://localhost:8080/resources/image/uploads/partner/" + imageName);
        partnerService.savePartner(partner);

        return new ResponseEntity<>(partner, HttpStatus.CREATED);
    }

    @RequestMapping(value = "/partner/{id}", method = RequestMethod.PUT, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Partner> saveNewPartner(@PathVariable long id, @RequestBody Partner partner) {
        Partner partnerDb = partnerService.findPartnerById(id);
        if (partnerDb == null) {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }

        if (partner.getImage().getId() == 0) {
            String imageName = System.currentTimeMillis() + ".png";
            String imagePath = partnerImageRootDir + imageName;
            String base64Content = partner.getBaseImage();
            byte[] data = DatatypeConverter.parseBase64Binary(base64Content);
            try (OutputStream stream = new FileOutputStream(imagePath)) {
                stream.write(data);
            } catch (IOException ex) {
                return new ResponseEntity<>(HttpStatus.FAILED_DEPENDENCY);
            }
            partnerDb.setBaseImage("http://localhost:8080/resources/image/uploads/partner/" + imageName);
            partnerDb.getImage().setImagePath("http://localhost:8080/resources/image/uploads/partner/" + imageName);
        }

        partnerService.editPartner(partnerDb, partner);

        return new ResponseEntity<>(partner, HttpStatus.CREATED);
    }

    @RequestMapping(value = "/partner/{id}", method = RequestMethod.DELETE, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Partner> deletePartner(@PathVariable long id) {
        Partner partnerDb = partnerService.findPartnerById(id);
        if (partnerDb == null) {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }

        partnerService.deletePartner(partnerDb);

        return new ResponseEntity<>(partnerDb, HttpStatus.OK);
    }

    @RequestMapping(value = "/partner-category/", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<PartnerCategory>> saveMultiplePartnerCategories(@RequestBody List<PartnerCategory> categories) {
        partnerCategoryService.updateMultiple(categories);

        return new ResponseEntity<>(categories, HttpStatus.OK);
    }

}
