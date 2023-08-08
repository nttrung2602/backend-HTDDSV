package com.example.service.imp

import com.example.dao.DatabaseFactory
import com.example.service.LopTinChiService
import java.sql.Date

class LopTinChiServiceImp : LopTinChiService {
    override suspend fun xuatLopTinChiTheoMaGV(magv: Int): List<Map<String, Any?>> {
        return DatabaseFactory.dbQuery("CALL sp_xuatLopTinChiTheoMaGV (${magv})")
    }

    override suspend fun xuatThongTinTatCaSinhVienCuaLTC(
        maltc: Int,
        filterByMSSV: String,
        filterByTrangThaiTheDiemDanh: Boolean
    ): List<Map<String, Any?>> {
        return DatabaseFactory.dbQuery("CALL sp_xuatThongTinTatCaSinhVienCuaLopTinChi (${maltc}, '${filterByMSSV}', $filterByTrangThaiTheDiemDanh)")
    }

    override suspend fun danhSachQuaTrinhDiemDanhCuaMotSinhVienLTC(maltc: Int, masv: String): List<Map<String, Any?>> {
        val getAll = -1
        return DatabaseFactory.dbQuery("CALL sp_quaTrinhDiemDanhCuaMotSinhVienTheoLTC (${maltc}, '$masv', $getAll);")
    }

    override suspend fun layDanhSachDiemDanhSinhVienTheoTKB_LTC(
        maltc: Int,
        ngayhoc: Date,
        tiethoc: String,
        filterbyname: String?,
        filterbyvang: Int?
    ): List<Map<String, Any?>> {
        return DatabaseFactory.dbQuery("CALL sp_layDanhSachDiemDanhSinhVienTheoTKB_LTC ($maltc, '$ngayhoc', '$tiethoc', '${filterbyname ?: ""}', ${filterbyvang ?: -1})")
    }

    override suspend fun xuatNgayHocCuaMotLTC(maltc: Int, chotDiemDanh: Boolean?): List<Map<String, Any?>> {
        return DatabaseFactory.dbQuery("CALL sp_xuatNgayHocCuaMotLTC ($maltc, ${chotDiemDanh ?: false}) ")
    }

    override suspend fun locTopSoLuongSinhVienVangNhieu(maltc: Int, soLuong: Int): List<Map<String, Any?>> {
        return DatabaseFactory.dbQuery("CALL sp_locTopSoLuongSinhVienVangNhieu ($maltc, $soLuong)")
    }

    override suspend fun quaTrinhDiemDanhCuaMotSinhVienTheoLTC(maltc: Int, masv: String): List<Map<String, Any?>> {
        return DatabaseFactory.dbQuery("CALL sp_quaTrinhDiemDanhCuaMotSinhVienTheoLTC ($maltc, '$masv')")
    }

    override suspend fun xuatTietHocCuaMotLTC(maltc: Int, chotDiemDanh: Boolean?): List<Map<String, Any?>> {
        return DatabaseFactory.dbQuery("CALL sp_xuatTietHocCuaMotLTC ($maltc, ${chotDiemDanh ?: false})")
    }

    override suspend fun xuatDanhSachLTCCuaMotSV(masv: String): List<Map<String, Any?>> {
        return DatabaseFactory.dbQuery("CALL sp_layDanhSachLTCCuaSV ('$masv')")
    }

    override suspend fun chotDiemDanhBuoiHoc(
        maLTC: Int,
        ngayHoc: Date,
        tietHoc: String,
        confirmAll: Boolean?,
        ghiChu: String
    ): Map<String, Any?> {
        return DatabaseFactory.dbUpdate("CALL sp_chotDiemDanhBuoiHoc ( $maLTC, '$ngayHoc', '$tietHoc', ${confirmAll ?: false}, '$ghiChu')")
    }

    override suspend fun layGhiChuBuoiHocCuaLTC(maLTC: Int, ngayHoc: Date, tietHoc: String): Map<String, Any?> {
        return DatabaseFactory.dbUpdate("CALL sp_layGhiChuCuaBuoiHoc($maLTC,'$ngayHoc','$tietHoc')")
    }

    override suspend fun layChiTietBuoiHocVangCuaMotSinhVien(maLTC: Int, maSV: String): List<Map<String, Any?>> {
        return DatabaseFactory.dbQuery("CALL sp_quaTrinhDiemDanhCuaMotSinhVienTheoLTC ($maLTC,'$maSV', 0)")
    }
}