package com.example.service.imp

import com.example.dao.DatabaseFactory
import com.example.service.AuthService

class AuthServiewImp :AuthService {
    override suspend fun xacThucMaGV(maGV: Int): Map<String, Any?> {
        return DatabaseFactory.dbUpdate("CALL sp_xacThucGiangVien($maGV)")
    }
}