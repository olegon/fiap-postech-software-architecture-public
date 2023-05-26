package com.olegon.fiap.soat.app.repository

import com.olegon.fiap.soat.app.entity.ProgrammingLanguage
import org.springframework.data.jpa.repository.JpaRepository

interface ProgrammingLanguangeRepository : JpaRepository<ProgrammingLanguage, Long>
