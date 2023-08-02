package com.example.service

import java.sql.Date

interface DangKyService {
    suspend fun capNhatTheDiemDanh(maTheDiemDanh: String, maSV: String, maLTC: Int, ngayHoc: Date, tietHoc: String): Map<String, Any?>
    suspend fun huyTheDiemDanh(maSV: String, maLTC: Int): Map<String, Any?>
    suspend fun capNhatDiemDanhBangThe(
        thediemdanh: String,
        maLTC: Int,
        ngayHoc: Date,
        tietHoc: String
    ): Map<String, Any?>

    suspend fun capNhatDiemDanhThuCong(
        maSV: String,
        maLTC: Int,
        ngayHoc: Date,
        tietHoc: String,
        vang: Int
    ): Map<String, Any?>

    suspend fun baoCaoDiemChuyenCan(
        maLTC: Int,
        heSoTruDiemVangCoPhep: Float,
        soBuoiCamThiQuyDinh: Int
    ): List<Map<String, Any?>>
}