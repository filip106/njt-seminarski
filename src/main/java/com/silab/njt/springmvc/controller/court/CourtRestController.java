package com.silab.njt.springmvc.controller.court;

import com.silab.njt.springmvc.model.User;
import com.silab.njt.springmvc.model.court.Court;
import com.silab.njt.springmvc.model.document.Image;
import com.silab.njt.springmvc.service.court.CourtService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.xml.bind.DatatypeConverter;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

@RestController
@RequestMapping("/private/json")
public class CourtRestController {

    @Autowired
    private CourtService courtService;

    private final static String courtImageRootDir = Image.imageUploadDir + "court\\";

    @RequestMapping(value = "/court/", method = RequestMethod.POST)
    public ResponseEntity<Court> saveCourt(@RequestBody Court court) {
        String imageName = System.currentTimeMillis() + ".png";
        String imagePath = courtImageRootDir + imageName;

        String base64Content = court.getBaseImage();
        byte[] data = DatatypeConverter.parseBase64Binary(base64Content);
        try (OutputStream stream = new FileOutputStream(imagePath)) {
            stream.write(data);
        } catch (IOException ex) {
            return new ResponseEntity<>(HttpStatus.FAILED_DEPENDENCY);
        }

        court.setBaseImage("http://localhost:8080/resources/image/uploads/court/" + imageName);
        court.getImage().setImagePath("http://localhost:8080/resources/image/uploads/court/" + imageName);

        courtService.saveCourt(court);

        return new ResponseEntity<>(court, HttpStatus.OK);
    }

    @RequestMapping(value = "/court/{id}", method = RequestMethod.PUT)
    public ResponseEntity<Court> updateCourt(@PathVariable long id, @RequestBody Court court) {
        Court courtDB = courtService.findById(id);

        if (courtDB == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }

        courtService.updateCourt(courtDB);

        return new ResponseEntity<>(court, HttpStatus.OK);
    }

    @RequestMapping(value = "/court/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Court> deleteCourt(@PathVariable long id) {
        Court court = courtService.findById(id);
        if (court == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }

        courtService.deleteCourtById(id);
        return new ResponseEntity<>(court, HttpStatus.NO_CONTENT);
    }
}
