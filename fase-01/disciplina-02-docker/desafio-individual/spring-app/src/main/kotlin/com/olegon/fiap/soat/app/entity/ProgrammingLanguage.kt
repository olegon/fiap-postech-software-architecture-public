package com.olegon.fiap.soat.app.entity

import jakarta.persistence.*

@Entity(name = "programming_languages")
class ProgrammingLanguage(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    val Id: Long?,
    @Column(name = "name")
    val Name: String
)
