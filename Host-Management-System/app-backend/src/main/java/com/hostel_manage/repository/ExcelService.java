package com.hostel_manage.repository;

import com.hostel_manage.models.Student;

import java.io.InputStream;
import java.util.List;

public interface ExcelService {
    List<Student> processExcelFile(InputStream fileInputStream) throws Exception;
}

