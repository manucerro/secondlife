package com.agora.secondlife.business.services;

import java.util.List;
import java.util.Optional;

import com.agora.secondlife.business.model.Pedido;
import com.agora.secondlife.business.model.dtos.PedidoDTO1;

public interface PedidoServices {

	/**
	 * Si la id no es null lanza IllegalStateException
	 * 
	 */
	Long create(Pedido pedido);
	
	Optional<Pedido> read(Long id);
	
	/**
	 * Si la id es null o no existe lanza IllegalStateException
	 * 
	 */
	void update(Pedido producto);
	
	/**
	 * Si la id es null o no existe lanza IllegalStateException
	 * 
	 */
	void delete(Long id);
	
	List<Pedido> getAll();
	
	// ***********************************
	//
	// DTOs
	//
	// ***********************************
		
	List<PedidoDTO1> getPedidosDTO1();
	
}
