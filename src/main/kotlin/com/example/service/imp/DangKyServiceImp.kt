package com.example.service.imp

import com.example.dao.DatabaseFactory
import com.example.service.DangKyService
import java.sql.Date

class DangKyServiceImp : DangKyService {
    override suspend fun capNhatTheDiemDanh(maTheDiemDanh: String, maSV: String, maLTC: Int, ngayHoc: Date, tietHoc: String): Map<String, Any?> {
        return DatabaseFactory.dbUpdate("CALL sp_capNhatTheDiemDanh ('${maTheDiemDanh}','$maSV', $maLTC, '${ngayHoc}','${tietHoc}' )")
    }

    override suspend fun huyTheDiemDanh(maSV: String, maLTC: Int): Map<String, Any?> {
        return DatabaseFactory.dbUpdate("CALL sp_HuyTheDiemDanh ('$maSV', $maLTC)")
    }



    override suspend fun capNhatDiemDanhBangThe(
        thediemdanh: String,
        maLTC: Int,
        ngayHoc: Date,
        tietHoc: String
    ): Map<String, Any?> {
        return DatabaseFactory.dbUpdate("CALL sp_CapNhatDiemDanhBangThe ('$thediemdanh', $maLTC, '$ngayHoc', '$tietHoc')")
    }

    override suspend fun capNhatDiemDanhThuCong(
        maSV: String,
        maLTC: Int,
        ngayHoc: Date,
        tietHoc: String,
        vang: Int
    ): Map<String, Any?> {
        return DatabaseFactory.dbUpdate("CALL sp_CapNhatDiemDanhThuCong ('$maSV', $maLTC, '$ngayHoc', '$tietHoc', $vang)")
    }

    override suspend fun baoCaoDiemChuyenCan(
        maLTC: Int,
        heSoTruDiemVangCoPhep: Float,
        soBuoiCamThiQuyDinh: Int
    ): List<Map<String, Any?>> {
        return DatabaseFactory.dbQuery("CALL sp_baoCaoDiemChuyenCan ($maLTC, $heSoTruDiemVangCoPhep, $soBuoiCamThiQuyDinh)")
    }


}