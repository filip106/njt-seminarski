package com.silab.njt.springmvc.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@RestController
public class TestRestController {

    private ArrayList<Test> tests = new ArrayList<>(Arrays.asList(new Test(1, "Fiki"), new Test(2, "Testic")));

    @RequestMapping(value = "/test/list", method = RequestMethod.GET)
    public ResponseEntity<List<Test>> listAllTests() {
        return new ResponseEntity<>(tests, HttpStatus.OK);
    }

    @RequestMapping(value = "/test/list/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Test> getRestTest(@PathVariable int id) {
        return new ResponseEntity<>(tests.stream().filter(test -> test.getId() == id).findFirst().get(), HttpStatus.OK);
    }

    @RequestMapping(value = "/test/create", method = RequestMethod.POST)
    public ResponseEntity<List<Test>> createTest(@RequestBody Test test) {
        tests.add(test);
        return new ResponseEntity<>(tests, HttpStatus.OK);
    }

    @RequestMapping(value = "/test/delete/{id}", method = RequestMethod.DELETE, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Test> deleteTest(@PathVariable int id) {
        Test test = tests.stream().filter(t -> t.getId() == id).findFirst().get();
        tests.remove(test);
        return new ResponseEntity<>(test, HttpStatus.OK);
    }

    public static class Test {
        private int id;
        private String name;

        public Test() {
        }

        public Test(int id, String name) {
            this.id = id;
            this.name = name;
        }

        @Override
        public String toString() {
            return "Test{" +
                    "id=" + id +
                    ", name='" + name + '\'' +
                    '}';
        }

        @Override
        public boolean equals(Object o) {
            if (this == o) return true;
            if (o == null || getClass() != o.getClass()) return false;

            Test test = (Test) o;

            if (id != test.id) return false;
            return name != null ? name.equals(test.name) : test.name == null;
        }

        @Override
        public int hashCode() {
            int result = id;
            result = 31 * result + (name != null ? name.hashCode() : 0);
            return result;
        }

        public int getId() {

            return id;
        }

        public Test setId(int id) {
            this.id = id;
            return this;
        }

        public String getName() {
            return name;
        }

        public Test setName(String name) {
            this.name = name;
            return this;
        }
    }
}
