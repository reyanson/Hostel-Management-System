package com.hostel_manage.repository;

import com.hostel_manage.models.Complain;
import com.hostel_manage.models.Subwarden;
import jakarta.persistence.criteria.CriteriaBuilder;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ComplainRepository extends JpaRepository<Complain, Integer> {

    // Delete complain stored function
    @Query(value = "SELECT DeleteComplain(:complainId)", nativeQuery = true)
    String deleteComplain(@Param("complainId") int complainId);

    @Query(value = "SELECT complainAccept(:complainId, :occation)", nativeQuery = true)
    String complainAccept(@Param("complainId") int cId, @Param("occation") String occation);


    @Procedure("GetComplaintDetails")
    List<Complain> getComplaintDetails(Integer p_c_id);




}
