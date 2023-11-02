package com.hostel_manage.services;

import com.hostel_manage.repository.SecurityRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SecurityService {

    @Autowired
    private SecurityRepository securityRepository;

    public String toggleRoomStatus(String num){
        return securityRepository.toggleRoomStatus(num);
    }
}
