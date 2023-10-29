package com.hostel_manage.controllers;

import com.hostel_manage.models.Student;
import com.hostel_manage.repository.ExcelService;
import com.hostel_manage.services.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RestController
@RequestMapping("/student")
@CrossOrigin("http://localhost:3000")
public class StudentController {

    @Autowired
    private StudentService studentService;

    @Autowired
    private ExcelService excelService;

    @PostMapping("/uploadStudent")
    public ResponseEntity<String> uploadUsers(@RequestParam("file") MultipartFile file) {
        try {
            List<Student> students = excelService.processExcelFile(file.getInputStream());
            List<Student> registeredStudents = studentService.registerUsers(students);
            return new ResponseEntity<>("Registered " + registeredStudents.size() + " students", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("Error processing the file", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}

