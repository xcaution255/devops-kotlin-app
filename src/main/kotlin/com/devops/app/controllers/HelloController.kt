package com.devops.app.controllers

import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/api")
class HelloController {
    @GetMapping("/hello")
    fun hello(): String {
        return "Hello Devops!!"
    }

    @GetMapping("/users")
    fun getUsers(): String {
        return "User : Augustino"
    }

    @GetMapping("/health")
    fun apiHealth(): String {
        return "Api is active!!"
    }
}