package com.hostel_manage.controllers;

import com.hostel_manage.models.Dean;
import com.hostel_manage.repository.DeanRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;


@RestController
@CrossOrigin("http://localhost:3000")
@RequestMapping("/api/user")
public class DeanController {
    @Autowired
    private DeanRepository userRepository;

    @PostMapping("/insert/{position}")
    public String insertUserData(@PathVariable String position,@RequestBody Dean dean) {
        String first_Name = dean.getFirst_Name();
        String last_Name = dean.getLast_Name();
        String Email = dean.getEmail();
        String nic = dean.getNic();
        String address = dean.getAddress();
        int personal_no = dean.getPersonal_no();
        int office_no = dean.getOffice_no();
        try {
            String message = userRepository.insertUserData(first_Name, last_Name, Email, nic, address, personal_no, office_no, position);
            return message;
        } catch (Exception e) {
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR, "Failed to insert user data.", e);
        }
    }
}
