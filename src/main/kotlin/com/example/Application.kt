package com.example

import com.example.dao.DatabaseFactory
import com.example.plugins.configureCORSForRequest
import com.example.plugins.configureRouting
import com.example.plugins.configureSerialization
import io.ktor.server.application.*
import io.ktor.server.engine.*
import io.ktor.server.netty.*

fun main() {
    embeddedServer(Netty, port = 8080, host = "localhost", module = Application::module)
        .start(wait = true)
//        embeddedServer(Netty, port = 8080, host = "192.168.111.190", module = Application::module)
//            .start(wait = true)
}

fun Application.module() {
    DatabaseFactory.init()
    configureSerialization()
    configureRouting()
    configureCORSForRequest()
}
