package com.example.plugins

import com.example.dto.request.*
import com.example.service.AuthService
import com.example.service.LopTinChiService
import com.example.service.imp.AuthServiewImp
import com.example.service.imp.DangKyServiceImp
import com.example.service.imp.LopTinChiServiceImp
import io.ktor.http.*
import io.ktor.server.application.*
import io.ktor.server.plugins.statuspages.*
import io.ktor.server.request.*
import io.ktor.server.response.*
import io.ktor.server.routing.*
import java.sql.Date
import java.sql.SQLException

fun Application.configureRouting() {
    install(StatusPages) {
        exception<Throwable> { call, cause ->
            call.respondText(text = "500: $cause", status = HttpStatusCode.InternalServerError)
        }
    }
    routing {
        auth()

        lopTinChi()
        dangKy()

        // example
        get("/") {
            call.respondText("Hello World!")
        }

    }
}

fun Routing.auth() {
    route("/auth") {
        val authService: AuthService = AuthServiewImp()
        post("/giangvien") {

            try {
//                val maGV = call.request.queryParameters["magv"]?.let { it.toIntOrNull()}
                val loginRequest=call.receive<LoginGiangVienRequest>()
//                if (maGV != null) {
                    try {
                        val message = authService.xacThucMaGV(loginRequest.username,loginRequest.password)

                        call.respond(HttpStatusCode.OK, message)
                    } catch (e: SQLException) {
                        if (e.errorCode == 500) {
                            call.respond(
                                HttpStatusCode.InternalServerError,
                                mapOf("message" to (e.message?.substringAfter(' ') ?: "Lỗi chưa được xác định!"))
                            )
                        }
                    }
//                } else {
//                    call.respond(HttpStatusCode.BadRequest, mapOf("message" to "Mã giảng viên không hợp lệ!"))
//                }
            } catch (e: Exception) {
                call.respond(HttpStatusCode.InternalServerError, mapOf("message" to "Mã giảng viên không tồn tại!"))
            }




        }

        post("/sinhvien") {
            val loginRequest=call.receive<LoginSinhVienRequest>()
//            val maSV = call.request.queryParameters["masv"] ?: ""

            try {
                val rs = authService.xacThucMaSV(loginRequest.username,loginRequest.password)
                call.respond(HttpStatusCode.OK, rs)
            } catch (e: SQLException) {
                if (e.errorCode == 500) {
                    call.respond(
                        HttpStatusCode.InternalServerError,
                        mapOf("message" to (e.message?.substringAfter(' ') ?: "Lỗi chưa xác định!"))
                    )
                }
            }
        }
    }
}


fun Routing.dangKy() {
    route("/dangky") {
        val dangKyService = DangKyServiceImp()
        post("/thediemdanh") {
            val maLTC = call.request.queryParameters["maltc"]?.let { it.toInt() }
            val ngayHoc = call.request.queryParameters["ngayhoc"]?.let { Date.valueOf(it) }
            val tietHoc = call.request.queryParameters["tiethoc"]?.let { it }
            val request = call.receive<DangKyTheDiemDanh>()

            if (maLTC != null && ngayHoc != null && tietHoc != null) {
                try {
                    val message =
                        dangKyService.capNhatTheDiemDanh(request.thediemdanh, request.masv, maLTC, ngayHoc, tietHoc)
                    call.respond(HttpStatusCode.OK, message)
                } catch (e: SQLException) {

                    if (e.errorCode == 500) {
                        call.respond(
                            HttpStatusCode.InternalServerError,
                            mapOf("message" to (e.message?.substringAfter(' ') ?: "Lỗi chưa được xác định!"))
                        )
                    }
//                call.respond(HttpStatusCode.InternalServerError, mapOf("message" to "Lỗi thao tác dữ liệu từ máy chủ"))
                }
            }else{
                call.respond(HttpStatusCode.BadRequest, mapOf("message" to "Yêu cầu nhập đủ thông tin lớp học!"))

            }
        }

        post("/thediemdanh/huy") {
            val maLTC = call.request.queryParameters["maltc"]?.let { it.toInt() }

            val masv = call.request.queryParameters["masv"]

            if (masv != null && maLTC != null) {
                try {
                    val message = dangKyService.huyTheDiemDanh(masv, maLTC)
                    call.respond(HttpStatusCode.OK, message)

                } catch (e: SQLException) {
                    if (e.errorCode == 500) {
                        call.respond(
                            HttpStatusCode.InternalServerError,
                            mapOf("message" to (e.message?.substringAfter(' ') ?: "Lỗi chưa được xác định!"))
                        )
                    }
                }

            } else {
                call.respond(HttpStatusCode.BadRequest, mapOf("message" to "Yêu cầu nhập đủ thông tin!"))
            }
        }

        post("/diemdanh/the") {
            val maLTC = call.request.queryParameters["maltc"]?.let { it.toInt() }
            val ngayHoc = call.request.queryParameters["ngayhoc"]?.let { Date.valueOf(it) }
            val tietHoc = call.request.queryParameters["tiethoc"]
            val infoDiemDanh = call.receive<InfoDiemDanh>()

            if (maLTC != null && ngayHoc != null && tietHoc != null) {
                try {
                    val message =
                        dangKyService.capNhatDiemDanhBangThe(infoDiemDanh.thediemdanh, maLTC, ngayHoc, tietHoc)

                    call.respond(HttpStatusCode.OK, message)
                } catch (e: SQLException) {
                    if (e.errorCode == 500) {
                        call.respond(
                            HttpStatusCode.InternalServerError,
                            mapOf("message" to (e.message?.substringAfter(' ') ?: "Lỗi chưa được xác định!"))
                        )
                    }
//                   call.respond(HttpStatusCode.InternalServerError, mapOf("message" to "Lỗi thao tác dữ liệu từ máy chủ"))
                }
            } else {
                call.respond(HttpStatusCode.BadRequest, mapOf("message" to "Yêu cầu nhập đủ thông tin!"))

            }
        }

        post("/diemdanh/thucong") {
            val maLTC = call.request.queryParameters["maltc"]?.let { it.toInt() }
            val ngayHoc = call.request.queryParameters["ngayhoc"]?.let { Date.valueOf(it) }
            val tietHoc = call.request.queryParameters["tiethoc"]
            val maSV = call.request.queryParameters["masv"]
            val vang = call.request.queryParameters["vang"]?.let { it.toInt() } ?: 1
            println(maLTC)
            println(ngayHoc)
            println(tietHoc)
            println(maSV)
            println(vang)

            if (maSV != null && maLTC != null && ngayHoc != null && tietHoc != null) {
                try {
                    val message = dangKyService.capNhatDiemDanhThuCong(maSV, maLTC, ngayHoc, tietHoc, vang)
                    call.respond(HttpStatusCode.OK, message)
                } catch (e: SQLException) {
//                   call.respond(HttpStatusCode.InternalServerError, mapOf("message" to "Lỗi thao tác dữ liệu từ máy chủ"))
                }
            } else {
                call.respond(HttpStatusCode.BadRequest, mapOf("message" to "Yêu cầu nhập đủ thông tin!"))

            }
        }

        get("/baocaodiem") {
            val maLTC = call.request.queryParameters["maltc"]?.let { it.toInt() }
            val heSoDiemTru = call.request.queryParameters["hesodiemtru"]?.let { it.toFloat() } ?: 0f
            val soBuoiCamThi = call.request.queryParameters["sobuoicamthi"]?.let { it.toInt() } ?: Int.MAX_VALUE

            if (maLTC != null) {
                try {
                    val list = dangKyService.baoCaoDiemChuyenCan(maLTC, heSoDiemTru, soBuoiCamThi)

                    call.respond(HttpStatusCode.OK, mapOf("list" to list))

                } catch (e: SQLException) {
                    if (e.errorCode == 500) {
                        call.respond(
                            HttpStatusCode.InternalServerError,
                            mapOf("message" to (e.message?.substringAfter(' ') ?: "Lỗi chưa được xác định!"))
                        )
                    } else if (e.errorCode == 501) {
                        call.respond(
                            HttpStatusCode.InternalServerError,
                            mapOf("message" to (e.message?.substringAfter(' ') ?: "Lỗi chưa được xác định!"))
                        )
                    }
                    call.respond(
                        HttpStatusCode.InternalServerError,
                        mapOf("message" to "Lỗi thao tác dữ liệu từ máy chủ. Thử lại")
                    )
                }
            } else {
                call.respond(HttpStatusCode.BadRequest, mapOf("message" to "Yêu cầu nhập đủ thông tin!"))
            }
        }
    }


}


fun Routing.lopTinChi() {
    route("/ltc/giangvien") {
        val lopTinChiService: LopTinChiService = LopTinChiServiceImp()

        // request body
        post {
            try {
                val giangVien = call.receive<ThongTinGiangVienRequest>()
                val list = lopTinChiService.xuatLopTinChiTheoMaGV(giangVien.maGV);
                call.respond(HttpStatusCode.OK, mapOf("list" to list))
            } catch (e: SQLException) {

                call.respondText("Lỗi máy chủ. Thử lại!", status = HttpStatusCode.InternalServerError)
            }
        }

        post("/chotdiemdanh") {
            val maLTC = call.request.queryParameters["maltc"]?.let { it.toInt() }
            val ngayHoc = call.request.queryParameters["ngayhoc"]?.let { Date.valueOf(it) }
            val tietHoc = call.request.queryParameters["tiethoc"]
            val confirmAllAttendance =
                call.request.queryParameters["confirmAllAttendance"]?.let { it.toBoolean() } ?: false
            val ghiChu = call.request.queryParameters["ghichu"]
            if (maLTC != null && ngayHoc != null && tietHoc != null && ghiChu != null) {
                try {
                    val message =
                        lopTinChiService.chotDiemDanhBuoiHoc(maLTC, ngayHoc, tietHoc, confirmAllAttendance, ghiChu)
                    call.respond(HttpStatusCode.OK, message)
                } catch (e: SQLException) {
                    if (e.errorCode == 500) {
                        call.respond(
                            HttpStatusCode.InternalServerError,
                            mapOf("message" to (e.message?.substringAfter(' ') ?: "Lỗi chưa được xác định!"))
                        )
                    }
                    call.respond(
                        HttpStatusCode.InternalServerError, mapOf("message" to "Lỗi thao tác dữ liệu từ máy chủ")
                    )
                }
            } else {
                call.respond(HttpStatusCode.BadRequest, mapOf("message" to "Yêu cầu nhập đủ thông tin!"))

            }
        }
    } // end route

    route("/ltc") {
        val lopTinChiService: LopTinChiService = LopTinChiServiceImp()

        // query
        get("/thongtinsinhvien") {
            val maltc = call.request.queryParameters["maltc"]?.let {
                it.toInt()
            }

            val filterByMSSV = call.request.queryParameters["filterbymssv"]?.let { it } ?: ""
            val filterByTrangThaiTheDiemDanh =
                call.request.queryParameters["trangthaithediemdanh"]?.let { it.toBoolean() } ?: false

            if (maltc != null) {
                try {
                    val list = lopTinChiService.xuatThongTinTatCaSinhVienCuaLTC(
                        maltc, filterByMSSV, filterByTrangThaiTheDiemDanh
                    )

                    call.respond(HttpStatusCode.OK, mapOf("list" to list))
                } catch (e: SQLException) {

                }
            }

            call.respond(HttpStatusCode.BadRequest, mapOf("message" to "Không tìm thấy dữ liệu của LTC!"))
        }

        get("/thongtinbuoihocltc") {
            val maltc = call.request.queryParameters["maltc"]?.let {
                it.toInt()
            }

            val chotdiemdanh = call.request.queryParameters["chotdiemdanh"]?.let {
                it.toBoolean()
            }

            if (maltc != null) {
                val listNgayHoc = lopTinChiService.xuatNgayHocCuaMotLTC(maltc, chotdiemdanh)
                val listTietHoc = lopTinChiService.xuatTietHocCuaMotLTC(maltc, chotdiemdanh)
                call.respond(HttpStatusCode.OK, mapOf("listngayhoc" to listNgayHoc, "listtiethoc" to listTietHoc))
            } else {
                call.respond(HttpStatusCode.BadRequest, mapOf("message" to "Không tìm thấy dữ liệu của LTC!"))
            }

        }

        get("/nhacnhosinhvien") {
            val maltc = call.request.queryParameters["maltc"]?.let { it.toInt() }
            val soluong = call.request.queryParameters["soluong"]?.let { it.toInt() } ?: 10

            if (maltc != null) {
                val list = lopTinChiService.locTopSoLuongSinhVienVangNhieu(maltc, soluong)

                call.respond(HttpStatusCode.OK, mapOf("list" to list))
            } else {
                call.respond(HttpStatusCode.BadRequest, mapOf("message" to "Vui lòng Nhập mã lớp tín chỉ"))
            }
        }

        get("/nhacnhosinhvien/chitiet"){
            val maltc = call.request.queryParameters["maltc"]?.let {
                it.toInt()
            }
            val masv = call.request.queryParameters["masv"]?.let {
                it
            }
            try {
                if (masv != null && maltc != null) {
                    // Xử lí lấy danh sách lớp tín chỉ của sinh viên
                    val list = lopTinChiService.layChiTietBuoiHocVangCuaMotSinhVien(maltc, masv)
                    call.respond(HttpStatusCode.OK, mapOf("list" to list))
                }
            } catch (e: SQLException) {
                call.respond(
                    HttpStatusCode.InternalServerError, mapOf("message" to "Lỗi hệ thống. Thử lại")
                )
            }
        }

        get("/diemdanh") {
            val maltc = call.request.queryParameters["maltc"]?.let { it.toInt() }
            val tiethoc = call.request.queryParameters["tiethoc"]?.let { it }
            val filterbyname = call.request.queryParameters["filterbyname"]?.let { it }
            val filterbyvang = call.request.queryParameters["filterbyvang"]?.let { it.toInt() }

            val ngayhoc = call.request.queryParameters["ngayhoc"]?.let {
                Date.valueOf(it)
            }

            try {
                if (maltc != null && tiethoc != null && ngayhoc != null) {
                    val list = lopTinChiService.layDanhSachDiemDanhSinhVienTheoTKB_LTC(
                        maltc, ngayhoc, tiethoc, filterbyname, filterbyvang
                    )

                    call.respond(HttpStatusCode.OK, mapOf("list" to list))
                } else {
                    call.respond(HttpStatusCode.BadRequest, mapOf("message" to "Vui lòng chọn đủ thông tin"))
                }
            } catch (e: SQLException) {
                call.respond(HttpStatusCode.InternalServerError, mapOf("message" to "Chưa thể tải danh sách sinh viên"))
            }
        }
        get("/buoihoc/ghichu") {
            val maltc = call.request.queryParameters["maltc"]?.let { it.toInt() }
            val tiethoc = call.request.queryParameters["tiethoc"]?.let { it }
            val ngayhoc = call.request.queryParameters["ngayhoc"]?.let {
                Date.valueOf(it)
            }
            if (maltc != null && tiethoc != null && ngayhoc != null) {
                val ghiChu = lopTinChiService.layGhiChuBuoiHocCuaLTC(
                    maltc, ngayhoc, tiethoc
                )

                call.respond(HttpStatusCode.OK, ghiChu)
            } else {
                call.respond(HttpStatusCode.BadRequest, mapOf("message" to "Vui lòng chọn đủ thông tin"))
            }

        }
    }



    route("/ltc/sinhvien") {
        val lopTinChiService: LopTinChiService = LopTinChiServiceImp()
        get {
            val maltc = call.request.queryParameters["maltc"]?.let {
                it.toInt()
            }
            val masv = call.request.queryParameters["masv"]?.let {
                it
            }
            try {
                if (masv != null && maltc == null) {
                    // Xử lí lấy danh sách lớp tín chỉ của sinh viên
                    val list = lopTinChiService.xuatDanhSachLTCCuaMotSV(masv)

                    call.respond(HttpStatusCode.OK, mapOf("list" to list))
                } else if (maltc == null || masv == null) {
                    call.respond(HttpStatusCode.BadRequest, mapOf("messsage" to "Vui lòng nhập đủ thông tin"))
                } else { // maltc != null && masv != null
                    val list = lopTinChiService.danhSachQuaTrinhDiemDanhCuaMotSinhVienLTC(maltc, masv)
                    call.respond(HttpStatusCode.OK, mapOf("list" to list))
                }
            } catch (e: SQLException) {
                call.respond(
                    HttpStatusCode.InternalServerError, mapOf("message" to "Chưa thể tải danh sách quá trình điểm danh")
                )
            }

        }
    }


}

