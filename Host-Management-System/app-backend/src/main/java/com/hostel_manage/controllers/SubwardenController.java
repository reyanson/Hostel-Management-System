package com.hostel_manage.controllers;

import com.hostel_manage.models.Complain;
import com.hostel_manage.models.Subwarden;
import com.hostel_manage.services.SubwardenService;
import jakarta.persistence.EntityManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin("http://localhost:3000")
@RequestMapping("subwarden")
public class SubwardenController {
    private final SubwardenService subwardenService;

    @Autowired
    private EntityManager entityManager;

    public SubwardenController(SubwardenService subwardenService) {
        this.subwardenService = subwardenService;
    }

    @PutMapping("/update")
    public ResponseEntity<String> updateSubwardenDaetails(@RequestParam int swardenId,
                                                          @RequestParam String new_first_name,
                                                          @RequestParam String new_last_name,
                                                          @RequestParam String new_email,
                                                          @RequestParam String new_nic,
                                                          @RequestParam String new_address,
                                                          @RequestParam int new_personal_no,
                                                          @RequestParam int new_office_no

                                                          ) {
        String result = subwardenService.updateSubwardenDaetails(swardenId,new_first_name,new_last_name,new_email,new_nic,new_address,new_personal_no,new_office_no);
        return ResponseEntity.ok(result);
    }

    //method for find subwawrden details by id
    @GetMapping("/{id}")
    public List<Subwarden> findSubwardenDetailsById(@PathVariable Integer id) {
        return subwardenService.findSubwardenDetailsById(id);
    }
}
