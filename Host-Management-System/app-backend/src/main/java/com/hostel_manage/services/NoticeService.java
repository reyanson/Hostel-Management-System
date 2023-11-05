package com.hostel_manage.services;

import com.hostel_manage.models.Notice;
import com.hostel_manage.repository.NoticeRepository;
import jakarta.persistence.*;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Root;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeService {

    @Autowired
    private NoticeRepository noticeRepository;


    @PersistenceContext
    private EntityManager entityManager;



    @Transactional
    public void updateNotice(Notice updatedNotice) {
        entityManager.merge(updatedNotice);

    }


    public void saveNotice(Notice notice) {
        StoredProcedureQuery query = entityManager.createStoredProcedureQuery("InsertNotice");
        query.registerStoredProcedureParameter("p_content", String.class, ParameterMode.IN);
        query.registerStoredProcedureParameter("p_subject", String.class, ParameterMode.IN);

        query.setParameter("p_content", notice.getContent());
        query.setParameter("p_subject", notice.getSubject());

        query.execute();
    }




    @Transactional
    public void deleteNotice(int noticeId) {
        // Make sure you load the entity to be deleted first
        Notice notice = noticeRepository.findById(noticeId).orElse(null);

        if (notice != null) {
            entityManager.remove(notice);
        }
    }

    public List<Notice> getAllNotices() {
        CriteriaBuilder builder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Notice> query = builder.createQuery(Notice.class);
        Root<Notice> root = query.from(Notice.class);

        query.select(root);

        TypedQuery<Notice> typedQuery = entityManager.createQuery(query);
        return typedQuery.getResultList();

    }

    @Transactional
    public List<Notice> getNoticeDetails(Integer noticeId) {
        return noticeRepository.getNoticeDetails(noticeId);
    }

}
