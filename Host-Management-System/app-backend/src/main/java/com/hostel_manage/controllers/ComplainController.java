package com.hostel_manage.controllers;

import com.hostel_manage.models.Complain;
import com.hostel_manage.services.ComplainService;
import jakarta.persistence.EntityManager;
import jakarta.persistence.StoredProcedureQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/complains")
@CrossOrigin("http://localhost:3000")
public class ComplainController {

    private final ComplainService complainService;

    @Autowired
    private EntityManager entityManager;

    @Autowired
    public ComplainController(ComplainService complainService) {
        this.complainService = complainService;
    }


    @PostMapping("/add")
    public ResponseEntity<String> addComplain(@RequestBody Complain complain) {
        String result = complainService.saveComplain(complain);
        return ResponseEntity.ok(result);
    }

    @GetMapping("/viewall")
    public List<Complain> getAllComplaints() {
        StoredProcedureQuery storedProcedure = entityManager.createNamedStoredProcedureQuery("get_all_complaints");
        storedProcedure.execute();
        List<Complain> complainList = storedProcedure.getResultList();
        return complainList;
    }

    //method for update the complaint
    @PutMapping("/update")
    public ResponseEntity<String> updateComplaint(@RequestBody Complain complain) {
        String result;
        result = complainService.updateComplaint(complain);

        if (result.equals("Success")){
            return new ResponseEntity(complain,HttpStatus.OK);
        } else {//else http status is unauthorized
            return new ResponseEntity(result, HttpStatus.UNAUTHORIZED);
        }
    }

    //method for delete complain using id
    @DeleteMapping("/delete/{complainId}")
    public String deleteComplaint(@PathVariable int complainId) {
        return complainService.deleteComplaint(complainId);
    }

    //method for find details by complain id
    @GetMapping("/{c_id}")
    public List<Complain> getComplaintDetails(@PathVariable Integer c_id) {
        return complainService.getComplaintDetails(c_id);
    }

}
