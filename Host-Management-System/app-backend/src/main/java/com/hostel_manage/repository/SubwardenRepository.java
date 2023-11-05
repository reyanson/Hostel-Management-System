package com.hostel_manage.repository;

import com.hostel_manage.models.Subwarden;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SubwardenRepository  extends JpaRepository<Subwarden,Integer> {
    @Query(value = "SELECT UpdateSubwarden(:swardenId, :new_first_name,:new_last_name,:new_email,:new_nic,:new_address,:new_personal_no,:new_office_no)", nativeQuery = true)
    String updateSubwardenDaetails(@Param("swardenId") int swardenId,
                                   @Param("new_first_name") String new_first_name,
                                   @Param("new_last_name") String new_last_name,
                                   @Param("new_email") String new_email,
                                   @Param("new_nic") String new_nic,
                                   @Param("new_address") String new_address,
                                   @Param("new_personal_no") int new_personal_no,
                                   @Param("new_office_no") int new_office_no
                                   );

    //for find subwarden details by id
    @Procedure("FindSubwardenDetailsById")
    List<Subwarden> findSubwardenDetailsById(Integer id);
}
