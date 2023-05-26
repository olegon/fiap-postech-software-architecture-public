package com.olegon.fiap.soat.app.controller

import com.olegon.fiap.soat.app.repository.ProgrammingLanguangeRepository
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController

@RestController
class ProgrammingLanguageController(
    private val programmingLanguangeRepository: ProgrammingLanguangeRepository
) {
    @GetMapping("/v1/programming-languages")
    fun listProgrammingLanguages() = programmingLanguangeRepository.findAll().map {
        it.Name
    }
}
