package com.hostel_manage.repository;

import com.hostel_manage.models.Security;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface SecurityRepository extends JpaRepository<Security,Integer> {
    @Query(value = "SELECT ToggleRoomStatus(?1)",nativeQuery = true)
    public String toggleRoomStatus(String num);


}

