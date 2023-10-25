package com.hostel_manage.services;

import com.hostel_manage.models.Student;
import com.hostel_manage.repository.ExcelService;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

@Service
public class ExcelServiceImpl implements ExcelService {

    @Override
    public List<Student> processExcelFile(InputStream fileInputStream) throws Exception {
        List<Student> students = new ArrayList<>();

        try (Workbook workbook = new XSSFWorkbook(fileInputStream)) {
            Sheet sheet = workbook.getSheetAt(0); // Assuming the data is in the first sheet

            for (Row row : sheet) {
                if (row.getRowNum() == 0) {
                    // Skip the header row
                    continue;
                }

                Student student = new Student();
                student.setRegNo(row.getCell(0).getStringCellValue());
                student.setFirstName(row.getCell(1).getStringCellValue());
                student.setLastName(row.getCell(2).getStringCellValue());
                student.setEmail(row.getCell(3).getStringCellValue());
                student.setNic(row.getCell(4).getStringCellValue());
                student.setAddress(row.getCell(5).getStringCellValue());
                student.setPhoneNo((int) row.getCell(6).getNumericCellValue());

                students.add(student);
            }
        } catch (IOException e) {
            throw new Exception("Error processing Excel file.", e);
        }

        return students;
    }
}

