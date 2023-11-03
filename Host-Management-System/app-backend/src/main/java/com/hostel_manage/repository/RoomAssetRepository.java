package com.hostel_manage.repository;

import com.hostel_manage.models.RoomAsset;
import com.hostel_manage.models.RoomAssetId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RoomAssetRepository extends JpaRepository<RoomAsset, RoomAssetId> {
    // You can add custom query methods if needed
}

