package com.devops.app.controllers

import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController

@RestController
//@RequestMapping("/")
class HelloController {
    @GetMapping("/hello")
    fun hello(): String {
        return "Hello Devops!!"
    }

    @GetMapping("/users")
    fun getUsers(): String {
        return "User : Augustino"
    }
}