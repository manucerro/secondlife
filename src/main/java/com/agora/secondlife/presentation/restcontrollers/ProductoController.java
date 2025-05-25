package com.agora.secondlife.presentation.restcontrollers;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
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

import com.agora.secondlife.business.model.Familia;
import com.agora.secondlife.business.model.Producto;
import com.agora.secondlife.business.model.dtos.ProductoDTO1;
import com.agora.secondlife.business.model.dtos.ProductoDTO2;
import com.agora.secondlife.business.model.dtos.ProductoDTO3;
import com.agora.secondlife.business.services.ProductoServices;
import com.agora.secondlife.presentation.config.PresentationException;

@RestController
@RequestMapping("/rest/productos")
public class ProductoController {
	
	private ProductoServices productoServices;
	
	public ProductoController(ProductoServices productosServices) {
		this.productoServices = productosServices;
	}
	
	@GetMapping
	public List<Producto> getAll(){
		return productoServices.getAll();
	}
	
	@GetMapping("/{id}")
	public Producto getProducto(@PathVariable Long id) {
		
		Optional<Producto> optional = productoServices.read(id);
		
		if(optional.isEmpty()) {
			throw new PresentationException("No existe el producto con id " + id, HttpStatus.NOT_FOUND);
		}
		
		return optional.get();
	}
	
	@PostMapping
	public ResponseEntity<?> createProducto(@RequestBody Producto producto, UriComponentsBuilder ucb){
		
		Long id = null;
		
		try {
			id = productoServices.create(producto);
		} catch(IllegalStateException e) {
			throw new PresentationException(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return ResponseEntity.created(ucb.path("/productos/{id}").build(id)).build();
	}
	
	@PutMapping("/{id}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void updateProducto(@RequestBody Producto producto, @PathVariable Long id) {
		
		producto.setId(id);
		
		try {
			productoServices.update(producto);
		} catch(IllegalStateException e) {
			throw new PresentationException(e.getMessage(), HttpStatus.BAD_REQUEST);
		}	
	}
	
	@DeleteMapping("/{id}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void deleteProducto(@PathVariable Long id){
		
		try {
			productoServices.delete(id);
		} catch(IllegalStateException e) {
			throw new PresentationException("El producto con ID [" + id + "] no existe.", HttpStatus.NOT_FOUND);
		}
	}
	
	@GetMapping("/estadistica")
	public Map<Familia, Integer> getEstadistica(){
		return productoServices.getEstadisticaNumeroProductosPorFamilia();
	}
	
	// ***********************************
	//
	// DTOs
	//
	// ***********************************	
	
	@GetMapping("/dtos/productoDTO1")
	public List<ProductoDTO1> getProductosDTO1(){
		return productoServices.getProductosDTO1();
	}
	
	@GetMapping("/dtos/productoDTO2")
	public List<ProductoDTO2> getProductosDTO2(){
		return productoServices.getProductosDTO2();
	}
	
	@GetMapping("/dtos/productoDTO3")
	public List<ProductoDTO3> getProductosDTO3(@RequestParam(required=false, defaultValue="0") Double descuento){
		return productoServices.getProductosDTO3(descuento);
	}

}
