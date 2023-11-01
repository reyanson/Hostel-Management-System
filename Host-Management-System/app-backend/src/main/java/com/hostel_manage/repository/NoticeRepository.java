package com.hostel_manage.repository;

import com.hostel_manage.models.Notice;
import org.springframework.data.jpa.repository.JpaRepository;

public interface NoticeRepository extends JpaRepository<Notice, Integer> {

}

