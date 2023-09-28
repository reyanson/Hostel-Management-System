package com.hostel_manage.controllers;

import com.hostel_manage.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/api/v1")
public class RegisterApiController {
    @Autowired
    UserService userService;

    @PostMapping("/user/register")
    public ResponseEntity registerNewUser(@RequestParam("first_name")String first_name,
                                          @RequestParam("last_name")String last_name,
                                          @RequestParam("email")String email,
                                          @RequestParam("password")String password){


        if(first_name.isEmpty() || last_name.isEmpty() || email.isEmpty() || password.isEmpty()){
            return new ResponseEntity<>("Please complete all fields", HttpStatus.BAD_REQUEST);
        }
        //Encrypt hash password;
        String hashed_password = BCrypt.hashpw(password,BCrypt.gensalt());

        //Register New user:
        int result = userService.registerNewUserServiceMethod(first_name,last_name,email,hashed_password);
        if(result != 1){
            return new ResponseEntity<>("Failed to Register user", HttpStatus.BAD_REQUEST);
        }

        return new ResponseEntity<>("User Registered Successfully",HttpStatus.OK);
    }
}
