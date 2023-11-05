package com.hostel_manage.repository;

import com.hostel_manage.models.Notice;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.query.Procedure;

import java.util.List;


public interface NoticeRepository extends JpaRepository<Notice, Integer>{
    @Procedure("GetNoticeDetails")
    List<Notice> getNoticeDetails(Integer p_notice_id);
}
