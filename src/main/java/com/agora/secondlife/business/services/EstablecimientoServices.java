package com.agora.secondlife.business.services;

import java.util.List;
import java.util.Optional;

import com.agora.secondlife.business.model.Establecimiento;
import com.agora.secondlife.business.model.dtos.EstablecimientoDTO1;

public interface EstablecimientoServices {

	/**
	 * Si el NIF es null o ya existe lanza IllegalStateException
	 * 
	 * 
	 */
	void create(Establecimiento establecimiento);
	
	Optional<Establecimiento> read(String NIF);
	
	/**
	 * Si el NIF es null o no existe lanza IllegalStateException
	 * 
	 */
	void update(Establecimiento establecimiento);
	
	List<Establecimiento> getAll();
	
	List<Establecimiento> getByProvincia(String provincia);
	
	// ***********************************
	//
	// DTOs
	//
	// ***********************************
	
	List<EstablecimientoDTO1> getEstablecimientosDTO1();
	
}
