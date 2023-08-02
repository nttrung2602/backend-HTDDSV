package com.example.plugins

import io.ktor.serialization.gson.*
import io.ktor.server.application.*
import io.ktor.server.plugins.contentnegotiation.*

fun Application.configureSerialization() {
    install(ContentNegotiation) {
//        json()
        gson {
            setPrettyPrinting() // fomart print
            serializeNulls() // click method to know more infomation
            setDateFormat("yyyy-MM-dd")
        }
    }
//    routing {
//        get("/json/kotlinx-serialization") {
//                call.respond(mapOf("hello" to "world"))
//            }
//        get("/json/gson") {
//                call.respond(mapOf("hello" to "world"))
//            }
//    }
}
