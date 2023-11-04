package com.hostel_manage.services;

import com.hostel_manage.models.Room;
import com.hostel_manage.repository.RoomRepository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.StoredProcedureQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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

    //To update room datas
//    public String updateRoom(Room room) {
//        StoredProcedureQuery query = entityManager.createStoredProcedureQuery("updateComplaint");
//        query.registerStoredProcedureParameter("complaint_id", Integer.class, ParameterMode.IN);
//        query.registerStoredProcedureParameter("new_category", String.class, ParameterMode.IN);
//        query.registerStoredProcedureParameter("new_subject", String.class, ParameterMode.IN);
//        query.registerStoredProcedureParameter("new_description", String.class, ParameterMode.IN);
//        query.registerStoredProcedureParameter("result_message", String.class, ParameterMode.OUT);
//
//        query.setParameter("complaint_id",complain.getcId());
//        query.setParameter("new_category",complain.getCategory());
//        query.setParameter("new_subject",complain.getSubject());
//        query.setParameter("new_description",complain.getDescription());
//
//        query.execute();
//
//        String resultMessage = (String) query.getOutputParameterValue("result_message");
//        System.out.println("Result: " + resultMessage);
//        return resultMessage;
//    }

}
