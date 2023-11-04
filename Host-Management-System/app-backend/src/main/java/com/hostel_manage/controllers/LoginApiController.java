package com.hostel_manage.controllers;

import com.hostel_manage.models.Login;
import com.hostel_manage.models.LoginResponse;
import com.hostel_manage.services.LoginService;

import com.hostel_manage.services.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1")
@CrossOrigin("http://localhost:3000")
public class LoginApiController {

    @Autowired
    private StudentService studentService;
    //declare the userService variable
    private final LoginService loginService;




    //Constructor
    public LoginApiController(LoginService userService) {
        this.loginService = userService;
    }

    @PostMapping("/login") //login end point
    // Method for the Login Response display
    public ResponseEntity login(@RequestBody Login login) {
        String username = login.getUsername();
        String password = login.getPassword();
        String loginMsg = null;
        String session = null;
        String occasion = null;

        System.out.println(username + password); // for testing purpose

        //Get the value from userService.executeCheckLoginFunction
        //The mysql function provided msg . Then I used this msg for display for the acknowledgment
        loginMsg = loginService.executeCheckLoginFunction(username, password);
        System.out.println("LoginMsg "+loginMsg);

        occasion = loginService.getUserOccasiono(username);
        if(occasion.equals("student")){
            session = studentService.getStudentRegNo(username);
        } else if (occasion.equals("security")) {
            session = username;
        }else if(occasion.equals("dean")){
            session = username;
        }
        LoginResponse loginResponse = new LoginResponse();
        loginResponse.setUsername(session);
        loginResponse.setOccasion(occasion);
        loginResponse.setMessage(loginMsg);


        if (loginMsg.equalsIgnoreCase("Login Successful")) { //check the loginMsg and that msg equal to "Login Successful" then Http status is ok
            return new ResponseEntity(loginResponse,HttpStatus.OK);
        } else {//else http status is unauthorized
            return new ResponseEntity(loginMsg, HttpStatus.UNAUTHORIZED);
        }
    }


}

