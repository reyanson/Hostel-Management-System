package com.hostel_manage.models;


import jakarta.persistence.*;

import java.util.Date;


@Entity
@NamedStoredProcedureQuery(
        name = "get_all_complaints",
        procedureName = "get_all_complaints",
        resultClasses = Complain.class
)

@Table(name = "complain")
@NamedStoredProcedureQuery(
        name = "insertComplain",
        procedureName = "InsertComplain",
        parameters = {
                @StoredProcedureParameter(name = "p_reg_no",mode = ParameterMode.IN,type = String.class),
                @StoredProcedureParameter(name = "p_category",mode = ParameterMode.IN,type = String.class),
                @StoredProcedureParameter(name = "p_subject",mode = ParameterMode.IN,type = String.class),
                @StoredProcedureParameter(name = "p_description",mode = ParameterMode.IN,type = String.class)
        },
        resultClasses = String.class
)
public class Complain {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "c_id")
    private int cId;

    @Column(name = "reg_no")
    private String regNo;

    @Column(name = "category")
    private String category;

    @Column(name = "action")
    private Integer action;

    @Column(name = "remark")
    private String remark;

    @Column(name = "subject")
    private String subject;

    @Column(name = "description")
    private String description;

    @Column(name = "created_at")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdAt;

    @Column(name = "updated_at")
    @Temporal(TemporalType.TIMESTAMP)
    private Date updatedAt;

    // Constructors, getters, setters, and other methods as needed

    public int getcId() {
        return cId;
    }

    public void setcId(int cId) {
        this.cId = cId;
    }

    public String getRegNo() {
        return regNo;
    }

    public void setRegNo(String regNo) {
        this.regNo = regNo;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public Integer getAction() {
        return action;
    }

    public void setAction(Integer action) {
        this.action = action;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }
}
