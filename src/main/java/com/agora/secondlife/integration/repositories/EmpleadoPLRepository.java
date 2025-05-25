package com.agora.secondlife.integration.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.agora.secondlife.business.model.dtos.EmpleadoDTO1;
import com.agora.secondlife.business.model.dtos.EmpleadoDTO2;
import com.agora.secondlife.integration.model.EmpleadoPL;

public interface EmpleadoPLRepository extends JpaRepository<EmpleadoPL, Long>{

	@Query("SELECT new com.agora.secondlife.business.model.dtos.EmpleadoDTO1(             "
			+ "e.nombre,                                                                           "
			+ "CONCAT(e.apellido1, COALESCE(CONCAT(' ', e.apellido2), '')),                        "
			+ " e.licenciaManipuladorAlimentos)                                                    "
			+ "FROM EmpleadoPL e                                                                   ")
	List<EmpleadoDTO1> findDTO1();
	
	@Query("SELECT new com.agora.secondlife.business.model.dtos.EmpleadoDTO2(              "
			+ " UPPER(CONCAT (e.apellido1, COALESCE(CONCAT(' ', e.apellido2), ''), ', ', e.nombre)),"
			+ " e.datosContacto.telefono,                                                           "
			+ " e.datosContacto.email)                                                              "
			+ "FROM EmpleadoPL e                                                                    ")
	List<EmpleadoDTO2> findDTO2();
	
}
