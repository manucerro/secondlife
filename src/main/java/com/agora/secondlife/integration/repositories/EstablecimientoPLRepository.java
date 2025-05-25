package com.agora.secondlife.integration.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.agora.secondlife.business.model.dtos.EstablecimientoDTO1;
import com.agora.secondlife.integration.model.EstablecimientoPL;

public interface EstablecimientoPLRepository extends JpaRepository<EstablecimientoPL, String>{

	List<EstablecimientoPL> findByDireccionProvinciaIgnoreCase(String provincia);
	
	@Query("SELECT   new com.agora.secondlife.business.model.dtos.EstablecimientoDTO1( "
		 + "             e.nombre,                                                              "
		 + "             e.direccion.poblacion,                                                 "
		 + "             e.datosContacto.telefono)                                              "
		 + "FROM     EstablecimientoPL e                                                          "
		 + "ORDER BY e.direccion.poblacion                                                      ")
	List<EstablecimientoDTO1> findDTO1();
}
