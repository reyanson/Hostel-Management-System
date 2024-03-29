package com.hostel_manage.models;

import jakarta.persistence.*;

@Entity
@NamedStoredProcedureQuery(
        name = "get_all_damage_details",
        procedureName = "get_all_damage_details",
        resultClasses = Damage.class
)

@Table(name = "damage")
public class Damage {

    @Id
    @Column(name = "damage_id")
    private String damageId;

    @Column(name = "asset_id")
    private String assetId;

    @Column(name = "room_no")
    private Integer roomNo;

    @Column(name= "floor")
    private String floor;

    @Column(name = "description")
    private String description;

    public String getFloor() {
        return floor;
    }

    public void setFloor(String floor) {
        this.floor = floor;
    }

    public String getDamageId() {
        return damageId;
    }

    public void setDamageId(String damageId) {
        this.damageId = damageId;
    }

    public String getAssetId() {
        return assetId;
    }

    public void setAssetId(String assetId) {
        this.assetId = assetId;
    }

    public Integer getRoomNo() {
        return roomNo;
    }

    public void setRoomNo(Integer roomNo) {
        this.roomNo = roomNo;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
