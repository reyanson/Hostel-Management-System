package com.hostel_manage.repository;

import com.hostel_manage.models.Dean;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface DeanRepository extends JpaRepository<Dean, Integer> {
    @Query(value = "SELECT InsertUserData(:p_first_Name, :p_last_Name, :p_Email, :p_nic, :p_address, :p_personal_no, :p_office_no, :p_position)", nativeQuery = true)
    String insertUserData(
            String p_first_Name, String p_last_Name, String p_Email, String p_nic, String p_address, int p_personal_no, int p_office_no, String p_position
    );
}
