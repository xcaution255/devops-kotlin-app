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
    fun getUsers(): Map<String, String> {
         val users = mapOf<String, String>(
            "1" to "AUGUSTINO",
            "2" to "EMMANUEL",
            "3" to "WINFRIDA",
            "4" to "PASKALIA",
            "5" to "ANNASTAZIA"
        )
     return users
    }
}