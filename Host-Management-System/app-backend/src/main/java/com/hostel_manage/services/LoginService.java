package com.hostel_manage.services;

import com.hostel_manage.repository.LoginRepository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.StoredProcedureQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Service;

@Service
public class LoginService {

    @Autowired
    LoginRepository loginRepository;

    //Declare the Entity Manager
    private final EntityManager entityManager;

    @Autowired
    public LoginService(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    //Method for the check the username and password with database username and password through store function
    public String executeCheckLoginFunction(String username, String password) {
        StoredProcedureQuery query = entityManager.createNamedStoredProcedureQuery("checkLogin");
        query.setParameter("username", username);
        query.setParameter("password", password);
        System.out.println("user: "+username+"\n"+"Pass: "+password);

        // Execute the stored procedure
        query.execute();
        String result = (String) query.getSingleResult();
        System.out.println("result is: "+result);

        return result;
    }


    public String getUserOccasiono(String username){
        return loginRepository.getUserOccasiono(username);
    }


}