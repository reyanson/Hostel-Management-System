package com.hostel_manage.services;

import com.hostel_manage.models.RoomAsset;
import com.hostel_manage.repository.RoomAssetRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoomAssetService {
    private final RoomAssetRepository roomAssetRepository;

    @Autowired
    public RoomAssetService(RoomAssetRepository roomAssetRepository) {
        this.roomAssetRepository = roomAssetRepository;
    }

    @Transactional
    public List<Object[]> getAllAssetInfo() {
        return roomAssetRepository.getAllAssetInfo();
    }

    @Transactional
    public List<RoomAsset> getAssetDetails(String assetId, int roomNo) {
        return roomAssetRepository.findByAssetIdAndRoomNo(assetId, roomNo);
    }
}
