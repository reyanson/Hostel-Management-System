package com.hostel_manage.services;


import com.hostel_manage.models.Damage;
import com.hostel_manage.repository.DamageRepository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.StoredProcedureQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DamageService {

    @Autowired
    DamageRepository damageRepository;

    //Declare the Entity Manager
    private final EntityManager entityManager;

    @Autowired
    public DamageService(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    //To get all damage details
    public List<Damage> getAllDamageDetails() {
        StoredProcedureQuery storedProcedure = entityManager.createNamedStoredProcedureQuery("get_all_damage_details");
        storedProcedure.execute();
        List<Damage> damageList = storedProcedure.getResultList();
        return damageList;
    }

}
