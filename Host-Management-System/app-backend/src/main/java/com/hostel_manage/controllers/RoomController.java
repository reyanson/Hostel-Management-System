package com.hostel_manage.controllers;


import com.hostel_manage.models.Room;
import com.hostel_manage.services.RoomService;
import jakarta.persistence.EntityManager;
import jakarta.persistence.StoredProcedureQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/rooms")
@CrossOrigin("http://localhost:3000")
public class RoomController {

    private final RoomService roomService;

    @Autowired
    private EntityManager entityManager;

    @Autowired
    public RoomController(RoomService roomService) {
        this.roomService = roomService;
    }

    @PostMapping("/add")
    public ResponseEntity<String> addRoom(@RequestBody Room room) {
        String result = roomService.saveRoom(room);
        return ResponseEntity.ok(result);
    }

    @GetMapping("/viewall")
    public List<Room> getAllRoomDetails() {
        StoredProcedureQuery storedProcedure = entityManager.createNamedStoredProcedureQuery("get_all_rooms_details");
        storedProcedure.execute();
        List<Room> roomList = storedProcedure.getResultList();
        return roomList;
    }

//    @PutMapping("/update")
//    public ResponseEntity<String> updateComplaint(@RequestBody Complain complain) {
//        String result;
//        result = complainService.updateComplaint(complain);
//
//        if (result.equals("Success")){
//            return new ResponseEntity(complain, HttpStatus.OK);
//        } else {//else http status is unauthorized
//            return new ResponseEntity(result, HttpStatus.UNAUTHORIZED);
//        }
//    }

    @DeleteMapping("/delete/{regNo}")
    public String deleteRoomStudent(@PathVariable String regNo) {

        return roomService.deleteRoomStudent(regNo);
    }


}
