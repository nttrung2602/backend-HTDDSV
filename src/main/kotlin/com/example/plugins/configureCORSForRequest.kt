package com.example.plugins

import io.ktor.server.application.*
import io.ktor.server.plugins.cors.routing.*
fun Application.configureCORSForRequest() {
    install(CORS){
//        allowMethod(HttpMethod.Options)
//        allowMethod(HttpMethod.Put)
//        allowMethod(HttpMethod.Patch)
//        allowMethod(HttpMethod.Delete)
//        allowHeader("key")
//        allowHeader(HttpHeaders.ContentType)
//        allowHeader(HttpHeaders.Authorization)
//        allowHeadersPrefixed("custom-")
//        exposeHeader("X-My-Custom-Header")
//        exposeHeader("X-Another-Custom-Header")
//        allowNonSimpleContentTypes = true // <-
//
//        allowCredentials = true
        anyHost()
    }
}