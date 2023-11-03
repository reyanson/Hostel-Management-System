package com.hostel_manage.models;


import jakarta.persistence.*;

import java.util.Date;

@Entity
@NamedStoredProcedureQuery(
        name = "get_all_rooms_details",
        procedureName = "get_all_rooms_details",
        resultClasses = Room.class
)

@Table(name = "room")
@NamedStoredProcedureQuery(
        name = "insertRoom",
        procedureName = "InsertRoom",
        parameters = {
                @StoredProcedureParameter(name = "d_room_no",mode = ParameterMode.IN,type = Integer.class),
                @StoredProcedureParameter(name = "d_floor",mode = ParameterMode.IN,type = String.class),
                @StoredProcedureParameter(name = "d_reg_no",mode = ParameterMode.IN,type = String.class),
        },
        resultClasses = String.class
)

public class Room {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "room_id")
    private int roomId;

    @Column(name = "room_no")
    private int roomNum;

    @Column(name = "floor")
    private String floor;

    @Column(name = "reg_no")
    private String regNo;

    @Column(name = "created_at")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdAt;

    @Column(name = "updated_at")
    @Temporal(TemporalType.TIMESTAMP)
    private Date updatedAt;

    public int getRoomId() {
        return roomId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }

    public int getRoomNum() {
        return roomNum;
    }

    public void setRoomNum(int roomNum) {
        this.roomNum = roomNum;
    }

    public String getFloor() {
        return floor;
    }

    public void setFloor(String  floor) {
        this.floor = floor;
    }

    public String getRegNo() {
        return regNo;
    }

    public void setRegNo(String regNo) {
        this.regNo = regNo;
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
