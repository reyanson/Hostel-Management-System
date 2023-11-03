package com.hostel_manage.services;

import com.hostel_manage.models.Student;
import com.hostel_manage.repository.StudentRepository;
import jakarta.persistence.EntityManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentService {

    @Autowired
    private StudentRepository studentRepository;

    public List<Student> registerUsers(List<Student> students) {
        // Save the list of students to the database
        return studentRepository.saveAll(students);
    }

    public String getStudentRegNo(String num){
        return studentRepository.getStudentRegNo(num);
    }

    //method for delete student using regNo
    public String deleteStudent(String regNo) {
        return studentRepository.deleteStudent(regNo);
    }

}

