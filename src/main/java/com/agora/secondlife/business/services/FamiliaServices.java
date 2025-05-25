package com.agora.secondlife.business.services;

import java.util.List;
import java.util.Optional;

import com.agora.secondlife.business.model.Familia;

public interface FamiliaServices {

	/**
	 * Si la id no es null lanza IllegalStateException
	 * 
	 * 
	 */
	Long create(Familia familia);										
	
	Optional<Familia> read(Long id);									
	
	/**
	 * Si la id es null o no existe lanza IllegalStateException
	 * 
	 */
	void update(Familia familia);										
	
	List<Familia> getAll();
	
}
