package com.agora.secondlife.auditoria.integration.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.agora.secondlife.auditoria.integration.model.RequestLogPL;

public interface RequestLogPLRepository extends JpaRepository<RequestLogPL, Long> {

}
