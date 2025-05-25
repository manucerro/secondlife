package com.agora.secondlife.business.services;

import java.util.List;
import java.util.Optional;

import com.agora.secondlife.business.model.Empleado;
import com.agora.secondlife.business.model.dtos.EmpleadoDTO1;
import com.agora.secondlife.business.model.dtos.EmpleadoDTO2;

public interface EmpleadoServices {

	Optional<Empleado> read(Long id);
	
	List<Empleado> getAll();
	
	// ***********************************
	//
	// DTOs
	//
	// ***********************************
	
	List<EmpleadoDTO1> getEmpleadosDTO1();
	
	List<EmpleadoDTO2> getEmpleadosDTO2();
		
}
