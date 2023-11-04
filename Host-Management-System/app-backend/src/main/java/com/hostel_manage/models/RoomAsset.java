package com.hostel_manage.models;


import jakarta.persistence.*;

@Entity
@Table(name = "room_asset")
@IdClass(RoomAssetId.class)
@NamedStoredProcedureQuery(
        name = "generateAssetCode",
        procedureName = "GenerateAssetCode",
        parameters = {
                @StoredProcedureParameter(mode = ParameterMode.IN, type = Integer.class, name = "roomNo")
        }
)
public class RoomAsset {
    @Id
    @Column(name = "asset_id")
    private String assetId;

    @Id
    @Column(name = "room_no")
    private int roomNo;

    private String name;

    public String getAssetId() {
        return assetId;
    }

    public void setAssetId(String assetId) {
        this.assetId = assetId;
    }

    public int getRoomNo() {
        return roomNo;
    }

    public void setRoomNo(int roomNo) {
        this.roomNo = roomNo;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}

