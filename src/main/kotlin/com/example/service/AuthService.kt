package com.example.service

interface AuthService {
    suspend fun xacThucMaGV(maGV:Int):Map<String,Any?>
}