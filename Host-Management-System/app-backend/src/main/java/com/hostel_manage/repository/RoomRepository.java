package com.hostel_manage.repository;

import com.hostel_manage.models.Complain;
import com.hostel_manage.models.Room;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoomRepository extends JpaRepository<Room, Integer> {

}
