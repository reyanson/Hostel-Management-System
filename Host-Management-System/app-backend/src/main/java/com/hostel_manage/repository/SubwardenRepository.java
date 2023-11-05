package com.hostel_manage.repository;

import com.hostel_manage.models.Subwarden;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SubwardenRepository  extends JpaRepository<Subwarden,Integer> {
}
