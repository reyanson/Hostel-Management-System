package com.hostel_manage.controllers;


import com.hostel_manage.models.Damage;
import com.hostel_manage.services.DamageService;
import jakarta.persistence.EntityManager;
import jakarta.persistence.StoredProcedureQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/damages")
@CrossOrigin("http://localhost:3000")
public class DamageController {

    private final DamageService damageService;

    @Autowired
    private EntityManager entityManager;

    @Autowired
    public DamageController(DamageService damageService) {
        this.damageService = damageService;
    }

    @GetMapping("/viewall")
    public List<Damage> getAllDamageDetails() {
        StoredProcedureQuery storedProcedure = entityManager.createNamedStoredProcedureQuery("get_all_damage_details");
        storedProcedure.execute();
        List<Damage> damageList = storedProcedure.getResultList();
        return damageList;
    }


}
