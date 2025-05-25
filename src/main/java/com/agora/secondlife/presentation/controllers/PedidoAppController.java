package com.agora.secondlife.presentation.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.agora.secondlife.business.services.PedidoServices;

@Controller
@RequestMapping("/app")
public class PedidoAppController {

	private PedidoServices pedidoServices;

	public PedidoAppController(PedidoServices pedidoServices) {
		this.pedidoServices = pedidoServices;
	}
	
	@GetMapping("/lista-pedidos")
	public ModelAndView getListaPedidos(ModelAndView mav) {
		mav.addObject("pedidos", pedidoServices.getPedidosDTO1());
		mav.setViewName("listado-pedidos");
		return mav;
	}
	
	@GetMapping("/pedido")
	public ModelAndView getPedido(ModelAndView mav, @RequestParam Long id) {
		mav.addObject("pedido", pedidoServices.read(id).get());
		mav.setViewName("pedido");
		return mav;
	}
	
	
}
