package com.agora.secondlife.presentation.restcontrollers;

import java.util.List;
import java.util.Optional;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

import com.agora.secondlife.business.model.Establecimiento;
import com.agora.secondlife.business.model.dtos.EstablecimientoDTO1;
import com.agora.secondlife.business.services.EstablecimientoServices;
import com.agora.secondlife.presentation.config.PresentationException;

@RestController
@RequestMapping("/rest/establecimientos")
public class EstablecimientoController {
	
	private EstablecimientoServices establecimientoServices;
	
	public EstablecimientoController(EstablecimientoServices establecimientoServices) {
		this.establecimientoServices = establecimientoServices;
	}
	
	@GetMapping
	public List<Establecimiento> getEstablecimientos(@RequestParam(required=false) String provincia){
	
		List<Establecimiento> establecimientos = null;
		
		if(provincia == null) {
			establecimientos = establecimientoServices.getAll();
		} else {
			establecimientos = establecimientoServices.getByProvincia(provincia);
		}
		
		return establecimientos;
	}
	
	@GetMapping("/{nif}")
	public Establecimiento getEstablecimiento(@PathVariable String nif){
		
		Optional<Establecimiento> optional = establecimientoServices.read(nif);
		
		if(optional.isEmpty()) {
			throw new PresentationException("No existe el establecimiento con NIF " + nif, HttpStatus.NOT_FOUND);
		}
		
		return optional.get();
	}
	
	@PostMapping
	public ResponseEntity<?> createEstablecimiento(@RequestBody Establecimiento establecimiento, UriComponentsBuilder ucb){
		
		try {
			establecimientoServices.create(establecimiento);
		} catch(IllegalStateException e) {
			throw new PresentationException(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return ResponseEntity.created(ucb.path("/establecimientos/{nif}").build(establecimiento.getNIF())).build();
	}
	
	@PutMapping
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void updateEstablecimiento(@RequestBody Establecimiento establecimiento) {
		
		try {
			establecimientoServices.update(establecimiento);
		} catch(IllegalStateException e) {
			throw new PresentationException(e.getMessage(), HttpStatus.BAD_REQUEST);
		}	
	}
	
	// ***********************************
	//
	// DTOs
	//
	// ***********************************	
	
	@GetMapping("/dtos/establecimientoDTO1")
	public List<EstablecimientoDTO1> getEstablecimientosDTO1(){
		return establecimientoServices.getEstablecimientosDTO1();
	}
	
}
