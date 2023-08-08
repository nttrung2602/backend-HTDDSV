package com.example.service

import java.sql.Date

interface LopTinChiService {
    suspend fun xuatLopTinChiTheoMaGV(magv: Int) : List<Map<String, Any?>>
    suspend fun xuatThongTinTatCaSinhVienCuaLTC(maltc:Int,filterByMSSV:String,filterByTrangThaiTheDiemDanh:Boolean) : List<Map<String, Any?>>
    suspend fun danhSachQuaTrinhDiemDanhCuaMotSinhVienLTC(maltc:Int, masv:String) : List<Map<String, Any?>>
    suspend fun layDanhSachDiemDanhSinhVienTheoTKB_LTC(maltc:Int, ngayhoc: Date, tiethoc:String, filterbyname:String?, filterbyvang:Int?) : List<Map<String, Any?>>
    suspend fun xuatNgayHocCuaMotLTC(maltc:Int, chotDiemDanh:Boolean?) : List<Map<String, Any?>>
    suspend fun locTopSoLuongSinhVienVangNhieu(maltc:Int, soLuong:Int) : List<Map<String, Any?>>
    suspend fun quaTrinhDiemDanhCuaMotSinhVienTheoLTC(maltc: Int,masv: String) : List<Map<String, Any?>>
    suspend fun xuatTietHocCuaMotLTC(maltc:Int, chotDiemDanh:Boolean?) : List<Map<String, Any?>>
    suspend fun xuatDanhSachLTCCuaMotSV(masv: String) : List<Map<String, Any?>>
    suspend fun chotDiemDanhBuoiHoc(maLTC: Int, ngayHoc: Date, tietHoc: String, confirmAll: Boolean?,ghiChu:String=""): Map<String, Any?>
    suspend fun layGhiChuBuoiHocCuaLTC(maLTC:Int, ngayHoc:Date,tietHoc:String):Map<String,Any?>

    suspend fun layChiTietBuoiHocVangCuaMotSinhVien(maLTC: Int,maSV:String):List<Map<String,Any?>>
}