package com.hostel_manage.services;


import com.hostel_manage.repository.SubwardenRepository;
import jakarta.persistence.EntityManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SubwardenService {

    @Autowired
    SubwardenRepository subwardenRepository;

    //Declare the Entity Manager
    private final EntityManager entityManager;


    public SubwardenService(EntityManager entityManager) {
        this.entityManager = entityManager;
    }


    //method for complain action and accept change
    public String updateSubwardenDaetails(int swardenId,String new_first_name,String new_last_name,String new_email,String new_nic,String new_address,int new_personal_no,int new_office_no) {
        return subwardenRepository.updateSubwardenDaetails(swardenId,new_first_name,new_last_name,new_email,new_nic,new_address,new_personal_no,new_office_no);
    }
}
