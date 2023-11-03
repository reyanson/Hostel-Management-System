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
@CrossOrigin("http://localhost:3000")
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

    //method for update the complaint
    @PutMapping("/update")
    public ResponseEntity<String> updateComplaint(@RequestBody Complain complain) {
        String result;
        result = complainService.updateComplaint(complain);

        if (result.equals("Success")){
            return new ResponseEntity(complain,HttpStatus.OK);
        } else {//else http status is unauthorized
            return new ResponseEntity(result, HttpStatus.UNAUTHORIZED);
        }
    }

    //method for delete complain using id
    @DeleteMapping("/delete/{complainId}")
    public String deleteComplaint(@PathVariable int complainId) {
        return complainService.deleteComplaint(complainId);
    }

    //method for find details by complain id
    @GetMapping("/{c_id}")
    public List<Complain> getComplaintDetails(@PathVariable Integer c_id) {
        return complainService.getComplaintDetails(c_id);
    }
}