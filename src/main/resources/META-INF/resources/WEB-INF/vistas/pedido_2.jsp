<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>SecondLife - Factura de Pedido</title>
        <jsp:include page="common-in-head.jsp"/>
        <style>
            .invoice-container {
                max-width: 800px;
                margin: 0 auto;
                padding: 30px;
                border: 1px solid #eee;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                background-color: white;
            }
            .invoice-header {
                border-bottom: 2px solid #0d6efd;
                padding-bottom: 20px;
                margin-bottom: 30px;
            }
            .company-address {
                color: #6c757d;
                font-size: 0.9rem;
            }
            .invoice-title {
                color: #0d6efd;
                font-weight: 700;
            }
            .invoice-details {
                background-color: #f8f9fa;
                padding: 15px;
                border-radius: 5px;
                margin-bottom: 30px;
            }
            .total-row {
                font-size: 1.1rem;
                font-weight: bold;
                background-color: #f8f9fa;
            }
            .status-badge {
                font-size: 0.9rem;
                padding: 5px 10px;
            }
            @media print {
                body {
                    background-color: white;
                }
                .invoice-container {
                    border: none;
                    box-shadow: none;
                    padding: 0;
                }
                .no-print {
                    display: none;
                }
            }
        </style>
    </head>
    <body>
        <div class="container-fluid py-4 no-print">
            <jsp:include page="nav.jsp"/>
        </div>
        
        <div class="container mb-5">
            <div class="invoice-container">
                <!-- Encabezado -->
                <div class="invoice-header">
                    <div class="row">
                        <div class="col-md-6">
                            <img src="/img/logo2.jpg" alt="SecondLife Logo" height="80" class="mb-3">
                            <h2 class="invoice-title">SecondLife</h2>
                            <div class="company-address">
                                <p>C/ Reciclaje, 123<br>
                                28001 Madrid, España<br>
                                Tel: +34 910 000 000<br>
                                info@secondlife.com</p>
                            </div>
                        </div>
                        <div class="col-md-6 text-end">
                            <h1 class="text-primary">FACTURA</h1>
                            <p class="mb-1"><strong>Nº Pedido:</strong> ${pedido.id}</p>
                            <p class="mb-1"><strong>Fecha:</strong> <fmt:formatDate pattern="dd/MM/yyyy" value="${pedido.fechaHora}" /></p>
                            <p class="mb-1"><strong>Hora:</strong> <fmt:formatDate pattern="HH:mm" value="${pedido.fechaHora}" /></p>
                            <span class="badge ${pedido.estado == 'COMPLETADO' ? 'bg-success' : 
                                          pedido.estado == 'CANCELADO' ? 'bg-danger' : 
                                          pedido.estado == 'ENVIADO' ? 'bg-info text-dark' : 'bg-warning text-dark'} status-badge mt-2">
                                ${pedido.estado}
                            </span>
                        </div>
                    </div>
                </div>
                
                <!-- Información del pedido -->
                <div class="invoice-details">
                    <div class="row">
                        <div class="col-md-6">
                            <h5><i class="bi bi-shop"></i> Establecimiento</h5>
                            <p class="mb-1"><strong>Nombre:</strong> ${pedido.establecimiento.nombre}</p>
                        </div>
                        <div class="col-md-6">
                            <h5><i class="bi bi-person-badge"></i> Empleado</h5>
                            <p class="mb-1">${pedido.empleado.nombre} ${pedido.empleado.apellido1}</p>
                        </div>
                    </div>
                    <c:if test="${not empty pedido.cliente}">
                        <hr>
                        <div class="row">
                            <div class="col-12">
                                <h5><i class="bi bi-person"></i> Cliente</h5>
                                <p class="mb-1">${pedido.cliente.nombre} ${pedido.cliente.apellido1}</p>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${not empty pedido.observaciones}">
                        <hr>
                        <div class="row">
                            <div class="col-12">
                                <h5><i class="bi bi-chat-left-text"></i> Observaciones</h5>
                                <p class="mb-0">${pedido.observaciones}</p>
                            </div>
                        </div>
                    </c:if>
                </div>
                
                <!-- Detalle de productos -->
                <h4 class="mb-3"><i class="bi bi-list-ul"></i> Detalle del pedido</h4>
                <div class="table-responsive">
                    <table class="table">
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
                                    <td class="text-end"><fmt:formatNumber value="${linea.precio}" type="currency" currencySymbol="€"/></td>
                                    <td class="text-end">${linea.cantidad}</td>
                                    <td class="text-end"><fmt:formatNumber value="${subtotal}" type="currency" currencySymbol="€"/></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                        <tfoot>
                            <tr class="total-row">
                                <td colspan="3" class="text-end"><strong>TOTAL:</strong></td>
                                <td class="text-end text-primary">
                                    <fmt:formatNumber value="${totalPedido}" type="currency" currencySymbol="€"/>
                                </td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
                
                <!-- Información adicional -->
                <div class="mt-4 pt-4 border-top">
                    <div class="row">
                        <div class="col-md-6">
                            <h5><i class="bi bi-info-circle"></i> Información importante</h5>
                            <p class="small text-muted">Todos nuestros productos incluyen 6 meses de garantía. Gracias por contribuir a un consumo más sostenible.</p>
                        </div>
                        <div class="col-md-6 text-end">
                            <img src="/img/logo2.jpg" alt="SecondLife Logo" height="50" class="opacity-50">
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Botones de acción -->
            <div class="d-flex justify-content-center mt-4 no-print">
                <button onclick="window.print()" class="btn btn-primary me-2">
                    <i class="bi bi-printer"></i> Imprimir Factura
                </button>
                <a href="./lista-pedidos" class="btn btn-outline-secondary">
                    <i class="bi bi-arrow-left"></i> Volver a Pedidos
                </a>
            </div>
        </div>
        
        <!-- Bootstrap Icons -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    </body>
</html>