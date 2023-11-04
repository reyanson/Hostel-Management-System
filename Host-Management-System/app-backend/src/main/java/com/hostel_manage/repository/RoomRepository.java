package com.hostel_manage.repository;


import com.hostel_manage.models.Room;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface RoomRepository extends JpaRepository<Room, Integer> {

    // Delete room stored function
    @Query(value = "SELECT deleteRoomStudentData(:regNo)", nativeQuery = true)
    String deleteRoomStudent(@Param("regNo") String regNo);

}
