package com.hostel_manage.controllers;

import com.hostel_manage.models.Complain;
import com.hostel_manage.models.Notice;
import com.hostel_manage.repository.NoticeRepository;
import com.hostel_manage.services.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/notices")
@CrossOrigin("http://localhost:3000")
public class NoticeController {

    @Autowired
    private NoticeRepository noticeRepository;

    @Autowired
    private NoticeService noticeService;


    @PostMapping("/add")
    public ResponseEntity<String> saveNotice(@RequestBody Notice notice) {
        noticeService.saveNotice(notice);
        return ResponseEntity.ok("Notice saved successfully.");
    }


    @PutMapping("/update/{noticeId}")
    public ResponseEntity<String> updateNotice(@PathVariable int noticeId, @RequestBody Notice updatedNotice) {
        Notice existingNotice = noticeRepository.findById(noticeId).orElse(null);

        if (existingNotice == null) {
            return ResponseEntity.notFound().build();
        }

        existingNotice.setDate(updatedNotice.getDate());
        existingNotice.setContent(updatedNotice.getContent());
        existingNotice.setSubject(updatedNotice.getSubject());

        noticeService.updateNotice(existingNotice);

        return ResponseEntity.ok("Notice updated successfully.");
    }

    @DeleteMapping("/{noticeId}")
    public ResponseEntity<String> deleteNotice(@PathVariable int noticeId) {
        noticeService.deleteNotice(noticeId);
        return ResponseEntity.ok("Notice deleted successfully.");
    }

    @GetMapping("/all")
    public ResponseEntity<List<Notice>> getAllNotices() {
        List<Notice> notices = noticeService.getAllNotices();
        return ResponseEntity.ok(notices);
    }

    @GetMapping("/view/{noticeId}")
    public List<Notice> getNoticeDetails(@PathVariable Integer noticeId) {
        return noticeService.getNoticeDetails(noticeId);
    }

}

