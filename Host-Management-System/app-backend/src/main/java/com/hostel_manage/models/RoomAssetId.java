package com.hostel_manage.models;

import java.io.Serializable;
import java.util.Objects;

public class RoomAssetId implements Serializable {
    private String assetId;
    private int roomNo;

    public RoomAssetId() {
    }

    public RoomAssetId(String assetId, int roomNo) {
        this.assetId = assetId;
        this.roomNo = roomNo;
    }

    // Implement equals and hashCode methods
    // Getters and setters for assetId and roomNo
}

