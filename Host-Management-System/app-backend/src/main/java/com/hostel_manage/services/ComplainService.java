package com.hostel_manage.services;

import com.hostel_manage.models.Complain;
import com.hostel_manage.models.Notice;
import com.hostel_manage.repository.ComplainRepository;
import com.hostel_manage.repository.LoginRepository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.ParameterMode;
import jakarta.persistence.StoredProcedureParameter;
import jakarta.persistence.StoredProcedureQuery;
import jakarta.transaction.Transactional;
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

    //method for delete complain using id
    public String deleteComplaint(int complainId) {
        return complainRepository.deleteComplain(complainId);
    }



    public String updateComplaint(Complain complain) {
        StoredProcedureQuery query = entityManager.createStoredProcedureQuery("updateComplaint");
        query.registerStoredProcedureParameter("complaint_id", Integer.class, ParameterMode.IN);
        query.registerStoredProcedureParameter("new_category", String.class, ParameterMode.IN);
        query.registerStoredProcedureParameter("new_subject", String.class, ParameterMode.IN);
        query.registerStoredProcedureParameter("new_description", String.class, ParameterMode.IN);
        query.registerStoredProcedureParameter("result_message", String.class, ParameterMode.OUT);

        query.setParameter("complaint_id",complain.getcId());
        query.setParameter("new_category",complain.getCategory());
        query.setParameter("new_subject",complain.getSubject());
        query.setParameter("new_description",complain.getDescription());

        query.execute();

        String resultMessage = (String) query.getOutputParameterValue("result_message");
        System.out.println("Result: " + resultMessage);
        return resultMessage;
    }

    @Transactional
    public List<Complain> getComplaintDetails(Integer c_id) {
        return complainRepository.getComplaintDetails(c_id);
    }
}

