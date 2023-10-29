package com.hostel_manage.repository;

import com.hostel_manage.models.Security;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface SecurityRepository extends JpaRepository<Security,Integer> {

}

