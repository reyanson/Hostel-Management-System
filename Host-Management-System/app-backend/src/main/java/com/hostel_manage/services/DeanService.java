package com.hostel_manage.services;

import com.hostel_manage.repository.DeanRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DeanService {
    private final DeanRepository deanRepository;

    @Autowired
    public DeanService(DeanRepository userRepository) {
        this.deanRepository = userRepository;
    }

    public String insertUserData(String first_Name, String last_Name, String Email, String nic, String address, int personal_no, int office_no, String position) {
        try {
            String message = deanRepository.insertUserData(first_Name, last_Name, Email, nic, address, personal_no, office_no, position);
            return message;
        } catch (Exception e) {
            // You can log the exception and handle it as needed
            return "Failed to insert user data.";
        }
    }
}
