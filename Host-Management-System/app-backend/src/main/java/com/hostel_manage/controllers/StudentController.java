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

    @RequestMapping("/regno")
    public String getStudentRegNo(@RequestParam String num){
        return studentService.getStudentRegNo(num);
    }

    @GetMapping("/view/{regno}")
    User getStudentById(@PathVariable String regno){
        return userRepository.findById(regno)
                .orElseThrow(()-> new UserNotFoundException(regno));

    }

    @PutMapping("/update/{regno}")
    User updateStudent(@RequestBody Student newStudent,@PathVariable String regno){
        return studentRepository.findById(regno)
                .map(student -> {
                    student.setFirstname(newUser.getFirstname());
                    student.setEmail(newUser.getEmail());
                    student.setAddress(newUser.getAddress());
                    return  studentRepository.uploadStudent(student);
                }).orElseThrow(()->new UserNotFoundException(regno));
    }

    @DeleteMapping("/delete/{regno}")
    String deleteStudent(@PathVariable String regno){
        if(!userRepository.existsById(regno)){
            throw new UserNotFoundException(regno);
        }
        userRepository.deleteById(regno);
        return "Student with id "+regno+" has been deleted success.";
    }

}

