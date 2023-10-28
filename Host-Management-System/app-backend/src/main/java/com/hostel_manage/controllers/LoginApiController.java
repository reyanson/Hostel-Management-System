package com.hostel_manage.controllers;

import com.hostel_manage.models.Login;
import com.hostel_manage.services.UserService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1")
@CrossOrigin("http://localhost:3000")
public class LoginApiController {

    //declare the userService variable
    private final UserService userService;


    //Constructor
    public LoginApiController(UserService userService) {
        this.userService = userService;
    }

    @PostMapping("/login") //login end point
    // Method for the Login Response display
    public ResponseEntity<String> login(@RequestBody Login loginRequest) {
        String username = loginRequest.getUsername();
        String password = loginRequest.getPassword();

        System.out.println(username + password); // for testing purpose

        //Get the value from userService.executeCheckLoginFunction
        //The mysql function provided msg . Then i used this msg for display for the acknowledgment
        String loginMsg = userService.executeCheckLoginFunction(username, password);


        if (loginMsg.equalsIgnoreCase("Login Successful")) { //check the loginMsg and that msg equal to "Login Successful" then Http status is ok
            return new ResponseEntity<>(loginMsg, HttpStatus.OK);
        } else {//else http status is unauthorized
            return new ResponseEntity<>(loginMsg, HttpStatus.UNAUTHORIZED);
        }
    }


}


