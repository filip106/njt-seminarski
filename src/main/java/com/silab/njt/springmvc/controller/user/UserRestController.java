package com.silab.njt.springmvc.controller.user;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import com.silab.njt.springmvc.model.document.Image;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

import com.silab.njt.springmvc.model.User;
import com.silab.njt.springmvc.service.UserService;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.xml.bind.DatatypeConverter;

@RestController
@RequestMapping("/private/json")
public class UserRestController {

    @Autowired
    UserService userService;

    private final static String userImageRootDir = Image.imageUploadDir + "users\\";

    @RequestMapping(value = "/user/", method = RequestMethod.GET)
    public ResponseEntity<List<User>> listAllUsers() {
        List<User> users = userService.findAllUsers();

        if (users.isEmpty()) {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }

        return new ResponseEntity<>(users, HttpStatus.OK);
    }

    @RequestMapping(value = "/user/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<User> getUser(@PathVariable("id") long id) {
        User user = userService.findById(id);

        if (user == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }

        return new ResponseEntity<>(user, HttpStatus.OK);
    }

    @RequestMapping(value = "/user/", method = RequestMethod.POST)
    public ResponseEntity<User> createUser(@RequestBody User user, HttpServletRequest request) {
        if (userService.isUserExist(user)) {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }
        String imageName = System.currentTimeMillis() + ".png";
        String imagePath = userImageRootDir + imageName;

        String base64Content = user.getImagePath();
        byte[] data = DatatypeConverter.parseBase64Binary(base64Content);
        try (OutputStream stream = new FileOutputStream(imagePath)) {
            stream.write(data);
        } catch (IOException ex) {
            return new ResponseEntity<>(HttpStatus.FAILED_DEPENDENCY);
        }

        user.setImagePath("http://localhost:8080/resources/image/uploads/users/" + imageName);
        user.getImage().setImagePath("http://localhost:8080/resources/image/uploads/users/" + imageName);
        userService.saveUser(user);

        return new ResponseEntity<>(user, HttpStatus.CREATED);
    }

    /** TODO Delete old images from disk */
    @RequestMapping(value = "/user/{id}", method = RequestMethod.PUT)
    public ResponseEntity<User> updateUser(@PathVariable long id, @RequestBody User user) {
        User currentUser = userService.findById(id);
        if (currentUser == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }

        if (user.getImage().getId() == 0) {
            String imageName = System.currentTimeMillis() + ".png";
            String imagePath = userImageRootDir + imageName;
            String base64Content = user.getImagePath();
            byte[] data = DatatypeConverter.parseBase64Binary(base64Content);
            try (OutputStream stream = new FileOutputStream(imagePath)) {
                stream.write(data);
            } catch (IOException ex) {
                return new ResponseEntity<>(HttpStatus.FAILED_DEPENDENCY);
            }
            currentUser.setImagePath("http://localhost:8080/resources/image/uploads/users/" + imageName);
            currentUser.getImage().setImagePath("http://localhost:8080/resources/image/uploads/users/" + imageName);
        }

        userService.updateUser(currentUser, user);

        return new ResponseEntity<>(currentUser, HttpStatus.OK);
    }

    @RequestMapping(value = "/user/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<User> deleteUser(@PathVariable long id) {
        User user = userService.findById(id);

        if (user == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }

        userService.deleteUserById(id);
        return new ResponseEntity<>(user, HttpStatus.NO_CONTENT);
    }
}
