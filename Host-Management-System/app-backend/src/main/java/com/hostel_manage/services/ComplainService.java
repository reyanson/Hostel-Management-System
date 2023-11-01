package com.hostel_manage.services;

import com.hostel_manage.models.Complain;
import com.hostel_manage.models.Notice;
import com.hostel_manage.repository.ComplainRepository;
import com.hostel_manage.repository.LoginRepository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.ParameterMode;
import jakarta.persistence.StoredProcedureParameter;
import jakarta.persistence.StoredProcedureQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ComplainService {

    @Autowired
    ComplainRepository complainRepository;

    //Declare the Entity Manager
    private final EntityManager entityManager;

    @Autowired
    public ComplainService(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    //Method for the check the username and password with database username and password through store function

    public void saveNotice(Notice notice) {
        StoredProcedureQuery query = entityManager.createStoredProcedureQuery("InsertNotice");
        query.registerStoredProcedureParameter("p_content", String.class, ParameterMode.IN);
        query.registerStoredProcedureParameter("p_subject", String.class, ParameterMode.IN);

        query.setParameter("p_content", notice.getContent());
        query.setParameter("p_subject", notice.getSubject());

        query.execute();
    }




    public String saveComplain(Complain complain) {
        StoredProcedureQuery query = entityManager.createNamedStoredProcedureQuery("insertComplain");
        query.setParameter("p_reg_no",complain.getRegNo());
        query.setParameter("p_category",complain.getCategory());
        query.setParameter("p_subject",complain.getSubject());
        query.setParameter("p_description",complain.getDescription());



        // Execute the stored procedure
        query.execute();
        String result = (String) query.getSingleResult();
        System.out.println("result is: "+result);

        return result;
    }
}

