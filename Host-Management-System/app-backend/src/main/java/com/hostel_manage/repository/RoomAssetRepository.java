package com.hostel_manage.repository;

import com.hostel_manage.models.RoomAsset;
import com.hostel_manage.models.RoomAssetId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RoomAssetRepository extends JpaRepository<RoomAsset, RoomAssetId> {
    // You can add custom query methods if needed

    @Procedure(name = "GetAllAssetInfo")
    List<Object[]> getAllAssetInfo();

    List<RoomAsset> findByAssetIdAndRoomNo(String assetId, int roomNo);
}

