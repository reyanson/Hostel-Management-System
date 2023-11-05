package com.hostel_manage.controllers;

import com.hostel_manage.models.Student;
import com.hostel_manage.repository.ExcelService;
import com.hostel_manage.services.StudentService;
import jakarta.persistence.EntityManager;
import jakarta.persistence.StoredProcedureQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RestController
@RequestMapping("/student")
@CrossOrigin("http://192.168.8.102:3000")
public class StudentController {

    @Autowired
    private StudentService studentService;
    @Autowired
    private EntityManager entityManager;
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


    @GetMapping("/viewall")
    public List<Student> getAllStudents() {
        StoredProcedureQuery storedProcedure = entityManager.createNamedStoredProcedureQuery("get_all_students");
        storedProcedure.execute();
        List<Student> students = storedProcedure.getResultList();
        return students;
    }


//    @PutMapping("/update/{regno}")
//    User updateStudent(@RequestBody Student newStudent,@PathVariable String regno){
//        return studentRepository.findById(regno)
//                .map(student -> {
//                    student.setFirstname(newUser.getFirstname());
//                    student.setEmail(newUser.getEmail());
//                    student.setAddress(newUser.getAddress());
//                    return  studentRepository.uploadStudent(student);
//                }).orElseThrow(()->new UserNotFoundException(regno));
//    }
//

    @DeleteMapping("/delete/{regNo}")
    public String deleteStudent(@PathVariable String regNo) {
        return studentService.deleteStudent(regNo);
    }

}

