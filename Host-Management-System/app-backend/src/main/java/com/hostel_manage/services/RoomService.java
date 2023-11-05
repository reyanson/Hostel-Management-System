package com.hostel_manage.services;

import com.hostel_manage.models.Room;
import com.hostel_manage.repository.RoomRepository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.ParameterMode;
import jakarta.persistence.StoredProcedureQuery;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class RoomService {

    @Autowired
    RoomRepository roomRepository;

    //Declare the Entity Manager
    private final EntityManager entityManager;

    @Autowired
    public RoomService(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    //For add room details
    public String saveRoom(Room room) {
        StoredProcedureQuery query = entityManager.createNamedStoredProcedureQuery("insertRoom");
        query.setParameter("d_room_no",room.getRoomNum());
        query.setParameter("d_floor",room.getFloor());
        query.setParameter("d_reg_no",room.getRegNo());

        query.execute();
        String result = (String) query.getSingleResult();
        System.out.println("result is: "+result);

        return result;
    }

    //To get all room datas
    public List<Room> getAllRoomDetails() {
        StoredProcedureQuery storedProcedure = entityManager.createNamedStoredProcedureQuery("get_all_rooms_details");
        storedProcedure.execute();
        List<Room> roomList = storedProcedure.getResultList();
        return roomList;
    }

    //To delete room student data by using regNo
    public String deleteRoomStudent(String regNo) {
        return roomRepository.deleteRoomStudent(regNo);
    }

    @Transactional
    public String updateRoom(int roomId, int newRoomNum, String newFloor, String newRegNo) {
        Optional<Room> existingRoom = roomRepository.findById(roomId);

        if (existingRoom.isPresent()) {
            Room room = existingRoom.get();
            room.setRoomNum(newRoomNum);
            room.setFloor(newFloor);
            room.setRegNo(newRegNo);
            room.setUpdatedAt(new Date());
            roomRepository.save(room);
            return "Success";
        } else {
            return "Room Data not found or not updated.";
        }
    }

}
