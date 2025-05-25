package com.agora.secondlife.business.services.impl;

import java.util.List;
import java.util.Optional;

import org.dozer.DozerBeanMapper;
import org.springframework.stereotype.Service;

import com.agora.secondlife.business.model.Empleado;
import com.agora.secondlife.business.model.dtos.EmpleadoDTO1;
import com.agora.secondlife.business.model.dtos.EmpleadoDTO2;
import com.agora.secondlife.business.services.EmpleadoServices;
import com.agora.secondlife.integration.model.EmpleadoPL;
import com.agora.secondlife.integration.repositories.EmpleadoPLRepository;

@Service
public class EmpleadoServicesImpl implements EmpleadoServices {

	private EmpleadoPLRepository empleadoPLRepository;
	private DozerBeanMapper mapper;
	
	public EmpleadoServicesImpl(EmpleadoPLRepository empleadoRepository, DozerBeanMapper mapper) {
		this.empleadoPLRepository = empleadoRepository;
		this.mapper = mapper;
	}
	
	@Override
	public Optional<Empleado> read(Long id) {
		
		Optional<EmpleadoPL> optionalPL = empleadoPLRepository.findById(id);
		
		return optionalPL.isEmpty() ? Optional.empty() : Optional.of(mapper.map(optionalPL.get(), Empleado.class));
	}

	@Override
	public List<Empleado> getAll() {
		
		List<EmpleadoPL> empleadosPL = empleadoPLRepository.findAll();
		
		return empleadosPL.stream()
				.map(x -> mapper.map(x, Empleado.class)).toList();
		
	}
	
	// ***********************************
	//
	// DTOs
	//
	// ***********************************	
	
	@Override
	public List<EmpleadoDTO1> getEmpleadosDTO1() {
		return empleadoPLRepository.findDTO1();
	}

	@Override
	public List<EmpleadoDTO2> getEmpleadosDTO2() {
		return empleadoPLRepository.findDTO2();
	}
	
}
