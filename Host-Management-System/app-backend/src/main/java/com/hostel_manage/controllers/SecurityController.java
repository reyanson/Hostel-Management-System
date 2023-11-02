package com.hostel_manage.controllers;

import com.hostel_manage.models.InOut;
import com.hostel_manage.services.SecurityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/security")
@CrossOrigin("http://localhost:3000")
public class SecurityController {

    @Autowired
    private SecurityService securityService;

    @PutMapping("/inOut")
    public ResponseEntity toggleRoomStatus(@RequestBody  InOut inOut){
        String num = inOut.getRegnum();
        System.out.println("Num "+num);
        //return securityService.toggleRoomStatus(num);

        inOut.setMsg(securityService.toggleRoomStatus(num));
        if (!num.isEmpty()) { //check the loginMsg and that msg equal to "Login Successful" then Http status is ok
            return new ResponseEntity(inOut, HttpStatus.OK);
        } else {//else http status is unauthorized
            return new ResponseEntity(inOut, HttpStatus.UNAUTHORIZED);
        }

    }
}
