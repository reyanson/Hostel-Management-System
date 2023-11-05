package com.hostel_manage.repository;

import com.hostel_manage.models.Subwarden;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface SubwardenRepository  extends JpaRepository<Subwarden,Integer> {
    @Query(value = "SELECT UpdateSubwarden(:swardenId, :new_first_name,:new_last_name,:new_email,:new_nic,:new_address,:new_personal_no,:new_office_no)", nativeQuery = true)
    String updateSubwardenDaetails(@Param("swardenId") int cId, @Param("new_first_name") String occation),@Param("new_last_name");
}
