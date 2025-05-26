<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>SecondLife - Detalle de Pedido</title>
        <jsp:include page="common-in-head.jsp"/>
        <style>
            .pedido-header {
                background-color: #f8f9fa;
                border-left: 5px solid #0d6efd;
                border-radius: 0.25rem;
            }
            .pedido-status {
                font-size: 1.1rem;
                letter-spacing: 0.5px;
            }
            .total-row {
                font-weight: bold;
                background-color: #f8f9fa;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <jsp:include page="nav.jsp"/>
            
            <div class="row mt-4">
                <div class="col-12">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h2 class="mb-0">Detalle de Pedido</h2>
                        <span class="badge bg-secondary fs-6">Nº ${pedido.id}</span>
                    </div>
                    
                    <!-- Datos principales -->
                    <div class="card mb-4 border-primary">
                        <div class="card-header bg-primary text-white">
                            <h4 class="mb-0"><i class="bi bi-card-checklist me-2"></i>Información del Pedido</h4>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <p><strong><i class="bi bi-calendar me-2"></i>Fecha:</strong> 
                                        <fmt:formatDate pattern="dd/MM/yyyy" value="${pedido.fechaHora}" />
                                    </p>
                                    <p><strong><i class="bi bi-clock me-2"></i>Hora:</strong> 
                                        <fmt:formatDate pattern="HH:mm" value="${pedido.fechaHora}" />
                                    </p>
                                    <p><strong><i class="bi bi-shop me-2"></i>Establecimiento:</strong> 
                                        ${pedido.establecimiento.nombre}
                                    </p>
                                </div>
                                <div class="col-md-6">
                                    <p>
                                        <strong><i class="bi bi-person-badge me-2"></i>Empleado:</strong> 
                                        ${pedido.empleado.nombre} ${pedido.empleado.apellido1}
                                    </p>
                                    <c:if test="${not empty pedido.cliente}">
                                        <p>
                                            <strong><i class="bi bi-person me-2"></i>Cliente:</strong> 
                                            ${pedido.cliente.nombre} ${pedido.cliente.apellido1}
                                        </p>
                                    </c:if>
                                    <p>
                                        <strong><i class="bi bi-info-circle me-2"></i>Estado:</strong>
                                        <span class="badge ${pedido.estado == 'PENDIENTE' ? 'bg-warning text-dark' : 
                                                          pedido.estado == 'COMPLETADO' ? 'bg-success' : 
                                                          pedido.estado == 'CANCELADO' ? 'bg-danger' : 
                                                          pedido.estado == 'ENVIADO' ? 'bg-info text-dark' : 'bg-secondary'} pedido-status">
                                            ${pedido.estado}
                                        </span>
                                    </p>
                                </div>
                            </div>
                            <c:if test="${not empty pedido.observaciones}">
                                <div class="alert alert-info mt-3">
                                    <strong><i class="bi bi-chat-left-text me-2"></i>Observaciones:</strong>
                                    ${pedido.observaciones}
                                </div>
                            </c:if>
                        </div>
                    </div>
                    
                    <!-- Detalle del pedido -->
                    <div class="card border-secondary">
                        <div class="card-header bg-secondary text-white">
                            <h4 class="mb-0"><i class="bi bi-list-ul me-2"></i>Productos</h4>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead class="table-light">
                                        <tr>
                                            <th>Producto</th>
                                            <th class="text-end">Cantidad</th>
                                            <th class="text-end">Precio unitario</th>
                                            <th class="text-end">Subtotal</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:set var="totalPedido" value="0"/>
                                        <c:forEach var="linea" items="${pedido.lineas}">
                                            <c:set var="subtotal" value="${linea.cantidad * linea.precio}"/>
                                            <c:set var="totalPedido" value="${totalPedido + subtotal}"/>
                                            <tr>
                                                <td>${linea.producto.nombre}</td>
                                                <td class="text-end">${linea.cantidad}</td>
                                                <td class="text-end">
                                                    <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" 
                                                        value="${linea.precio}" /> €
                                                </td>
                                                <td class="text-end fw-bold">
                                                    <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" 
                                                        value="${subtotal}" /> €
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        <tr class="total-row">
                                            <td colspan="3" class="text-end"><strong>TOTAL:</strong></td>
                                            <td class="text-end fw-bold text-primary">
                                                <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" 
                                                    value="${totalPedido}" /> €
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Botones de acción -->
                    <div class="d-flex justify-content-end mt-4">
                        <a href="./lista-pedidos" class="btn btn-outline-secondary me-2">
                            <i class="bi bi-arrow-left me-1"></i> Volver
                        </a>
                        <button class="btn btn-primary">
                            <i class="bi bi-printer me-1"></i> Imprimir
                        </button>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Bootstrap Icons -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    </body>
</html>