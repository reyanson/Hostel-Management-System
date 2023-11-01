package com.hostel_manage.controllers;

import com.hostel_manage.models.Complain;
import com.hostel_manage.models.Login;
import com.hostel_manage.models.LoginResponse;
import com.hostel_manage.services.ComplainService;
import com.hostel_manage.services.LoginService;
import com.hostel_manage.services.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/complains")
public class ComplainController {

    private final ComplainService complainService;

    @Autowired
    public ComplainController(ComplainService complainService) {
        this.complainService = complainService;
    }


    @PostMapping("/add")
    public ResponseEntity<String> addComplain(@RequestBody Complain complain) {
        String result = complainService.saveComplain(complain);
        return ResponseEntity.ok(result);
    }
}
