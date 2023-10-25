package com.hostel_manage.repository;

import com.hostel_manage.models.Student;
import org.springframework.data.jpa.repository.JpaRepository;

public interface StudentRepository extends JpaRepository<Student, String> {

}

