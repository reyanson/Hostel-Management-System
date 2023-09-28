package com.hostel_manage.services;

import com.hostel_manage.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    @Autowired
    UserRepository userRepository;

    public int registerNewUserServiceMethod(String fname,String lname,String email,String password){
        return userRepository.registerNewUser(fname,lname,email,password);
    }
}
