package com.hostel_manage.services;

import com.hostel_manage.models.Login;
import com.hostel_manage.models.User;
import com.hostel_manage.repository.UserRepository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import jakarta.persistence.StoredProcedureQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class UserService {

    @Autowired
    UserRepository userRepository;

    //Declare the Entity Manager
    private final EntityManager entityManager;

    @Autowired
    public UserService(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    //Method for the check the username and password with database username and password through store function
    public String executeCheckLoginFunction(String username, String password) {
        Query query = entityManager.createNamedQuery("checkLogin");
        query.setParameter("username", username); //set username parameter
        query.setParameter("password", password); //set password parameter

        System.out.println("Username in service: "+username);// for debugging purpose



        String result = (String) query.getSingleResult();

        System.out.println(result);// for debugging purpose
        return result; // return the database function output

    }


}
