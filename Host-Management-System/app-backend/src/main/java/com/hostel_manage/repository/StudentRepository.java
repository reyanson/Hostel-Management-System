package com.hostel_manage.repository;

import com.hostel_manage.models.Student;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface StudentRepository extends JpaRepository<Student, String> {

    @Query(value = "SELECT getRegNo(?1)",nativeQuery = true)
    public String getStudentRegNo(String num);


//    DELIMITER //
//    CREATE FUNCTION getRegNo(IN num VARCHAR(50))
//    RETURNS VARCHAR(50)
//    DETERMINISTIC --always produces the same output for the same input It helps the database optimize query execution.
//    BEGIN
//    DECLARE regnum VARCHAR(50);
//    SELECT reg_no INTO regnum FROM student WHERE SUBSTRING(reg_no, 9) = SUBSTRING(num, 3);
//    RETURN regnum;
//    END//
//            DELIMITER ;


}

