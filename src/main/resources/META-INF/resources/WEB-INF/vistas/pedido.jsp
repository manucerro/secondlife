<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <title>SecondLife - Detalle de Pedido</title>
    <jsp:include page="common-in-head.jsp"/>
    <style>
        .pedido-header {
            background-color: #f8f9fa;
            border-radius: 0.5rem;
            padding: 1.5rem;
            margin-bottom: 2rem;
            border-left: 4px solid #0d6efd;
        }
        .detail-card {
            border: none;
            box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
        }
        .detail-card .card-header {
            background-color: #0d6efd;
            color: white;
        }
        .status-badge {
            font-size: 0.9rem;
            padding: 0.35rem 0.75rem;
        }
        .total-row {
            font-weight: bold;
            background-color: #f8f9fa;
        }
    </style>
</head>
<body>
    <div class="container-fluid">
        <jsp:include page="nav.jsp"/>
        
        <div class="row mt-4">
            <div class="col-12">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h2 class="mb-0">Detalle de Pedido</h2>
                    <span class="badge bg-primary fs-6">Nº ${pedido.id}</span>
                </div>
                
                <!-- Información principal -->
                <div class="card detail-card mb-4">
                    <div class="card-header">
                        <h3 class="h5 mb-0"><i class="bi bi-card-checklist me-2"></i>Información del Pedido</h3>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6">
                                <dl class="row">
                                    <dt class="col-sm-4">Fecha</dt>
                                    <dd class="col-sm-8">
                                        <fmt:formatDate pattern="dd/MM/yyyy" value="${pedido.fechaHora}" />
                                    </dd>
                                    
                                    <dt class="col-sm-4">Hora</dt>
                                    <dd class="col-sm-8">
                                        <fmt:formatDate pattern="HH:mm" value="${pedido.fechaHora}" />
                                    </dd>
                                    
                                    <dt class="col-sm-4">Estado</dt>
                                    <dd class="col-sm-8">
                                        <span class="badge ${pedido.estado == 'PENDIENTE' ? 'bg-warning text-dark' : 
                                                      pedido.estado == 'COMPLETADO' ? 'bg-success' : 
                                                      pedido.estado == 'CANCELADO' ? 'bg-danger' : 
                                                      pedido.estado == 'ENVIADO' ? 'bg-info text-dark' : 'bg-secondary'} status-badge">
                                            ${pedido.estado}
                                        </span>
                                    </dd>
                                </dl>
                            </div>
                            <div class="col-md-6">
                                <dl class="row">
                                    <dt class="col-sm-4">Empleado</dt>
                                    <dd class="col-sm-8">
                                        ${pedido.empleado.nombre} ${pedido.empleado.apellido1}
                                    </dd>
                                    
                                    <c:if test="${not empty pedido.cliente}">
                                        <dt class="col-sm-4">Cliente</dt>
                                        <dd class="col-sm-8">
                                            ${pedido.cliente.nombre} ${pedido.cliente.apellido1}
                                        </dd>
                                    </c:if>
                                    
                                    <dt class="col-sm-4">Establecimiento</dt>
                                    <dd class="col-sm-8">
                                        ${pedido.establecimiento.nombre}
                                    </dd>
                                </dl>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Detalle del pedido -->
                <div class="card detail-card mb-4">
                    <div class="card-header">
                        <h3 class="h5 mb-0"><i class="bi bi-list-ul me-2"></i>Productos</h3>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead class="table-light">
                                    <tr>
                                        <th>Producto</th>
                                        <th class="text-end">Precio unitario</th>
                                        <th class="text-end">Cantidad</th>
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
                                            <td class="text-end">
                                                <fmt:formatNumber value="${linea.precio}" type="currency" currencySymbol="€"/>
                                            </td>
                                            <td class="text-end">${linea.cantidad}</td>
                                            <td class="text-end">
                                                <fmt:formatNumber value="${subtotal}" type="currency" currencySymbol="€"/>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    <tr class="total-row">
                                        <td colspan="3" class="text-end"><strong>TOTAL:</strong></td>
                                        <td class="text-end text-primary">
                                            <fmt:formatNumber value="${totalPedido}" type="currency" currencySymbol="€"/>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                
                <!-- Observaciones -->
                <c:if test="${not empty pedido.observaciones}">
                    <div class="card detail-card mb-4">
                        <div class="card-header">
                            <h3 class="h5 mb-0"><i class="bi bi-chat-left-text me-2"></i>Observaciones</h3>
                        </div>
                        <div class="card-body">
                            <p class="mb-0">${pedido.observaciones}</p>
                        </div>
                    </div>
                </c:if>
                
                <!-- Botones de acción -->
                <div class="d-flex justify-content-between mt-4">
                    <a href="./lista-pedidos" class="btn btn-outline-secondary">
                        <i class="bi bi-arrow-left me-1"></i> Volver a Pedidos
                    </a>
                    <div>
                        <a href="./pedido_1?id=${pedido.id}" class="btn btn-outline-primary me-2">
                            <i class="bi bi-eye me-1"></i> Vista Detallada
                        </a>
                        <a href="./pedido_2?id=${pedido.id}" class="btn btn-primary">
                            <i class="bi bi-printer me-1"></i> Imprimir Factura
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
</body>
</html>