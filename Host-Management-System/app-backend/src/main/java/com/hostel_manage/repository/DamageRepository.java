package com.hostel_manage.repository;


import com.hostel_manage.models.Damage;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DamageRepository extends JpaRepository<Damage, String> {

    @Procedure("GetDamageDetails")
    List<Damage> getDamageDetails(String d_id);

    @Query(value = "SELECT deleteDamage(:damageId)", nativeQuery = true)
    String deleteDamage(@Param("damageId") String damageId);


}
