package com.example.service

interface AuthService {
    suspend fun xacThucMaGV(maGV:Int,password:String):Map<String,Any?>
    suspend fun xacThucMaSV(maSV:String,password: String):Map<String,Any?>
}