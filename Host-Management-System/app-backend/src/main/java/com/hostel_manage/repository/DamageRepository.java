package com.hostel_manage.repository;

import com.hostel_manage.models.Damage;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DamageRepository extends JpaRepository<Damage, String> {

}
