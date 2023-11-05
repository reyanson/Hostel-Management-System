package com.hostel_manage.controllers;

import com.hostel_manage.models.Notice;
import com.hostel_manage.models.RoomAsset;
import com.hostel_manage.models.Student;
import com.hostel_manage.services.RoomAssetService;
import jakarta.persistence.EntityManager;
import jakarta.persistence.ParameterMode;
import jakarta.persistence.StoredProcedureQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/room-assets")
@CrossOrigin("http://localhost:3000")
public class RoomAssetController {

    @Autowired
    private EntityManager entityManager;
//    @GetMapping("/viewall")
//    public List<RoomAsset> getRoomAssetByRoomId(@RequestBody RoomAsset roomAsset) {
//        int roomnum = roomAsset.getRoomNo();
//        StoredProcedureQuery storedProcedure = entityManager.createNamedStoredProcedureQuery("generateAssetCode");
//
//        storedProcedure.registerStoredProcedureParameter("roomNo", Integer.class, ParameterMode.IN);
//        storedProcedure.setParameter("roomNo", roomnum);
//
//        storedProcedure.execute();
//        List<RoomAsset> roomAssets = storedProcedure.getResultList();
//        return roomAssets;
//    }



    @GetMapping("/viewall/{roomAsset}")
    public ResponseEntity<List<RoomAsset>> getAllStudents(@PathVariable int roomAsset) {

        StoredProcedureQuery storedProcedure = entityManager.createNamedStoredProcedureQuery("generateAssetCode");
        storedProcedure.setParameter("roomNo", roomAsset);
        storedProcedure.execute();
        List<RoomAsset> resultSet = storedProcedure.getResultList();

        if(!resultSet.isEmpty()){
            return ResponseEntity.ok(resultSet);
        }else{
            return ResponseEntity.notFound().build();
        }


    }

    private final RoomAssetService roomAssetService;

    @Autowired
    public RoomAssetController(RoomAssetService roomAssetService) {
        this.roomAssetService = roomAssetService;
    }

    @GetMapping("/get-all-asset-info")
    public List<Object[]> getAllAssetInfo() {
        return roomAssetService.getAllAssetInfo();
    }


}
