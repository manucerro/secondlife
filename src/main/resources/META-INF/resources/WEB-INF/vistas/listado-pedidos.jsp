<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>SecondLife - Listado de Pedidos</title>
        <jsp:include page="common-in-head.jsp"/>
        <style>
            .status-pendiente { background-color: #fff3cd; }
            .status-completado { background-color: #d4edda; }
            .status-cancelado { background-color: #f8d7da; }
            .status-enviado { background-color: #cce5ff; }
        </style>
    </head>
    <body>
        <div class="container-fluid">
			<jsp:include page="nav.jsp">
			    <jsp:param name="active" value="productos"/>
			</jsp:include>
            
            <div class="row mt-3">
                <div class="col-md-12">
                    <div class="d-flex justify-content-between align-items-center">
                        <h3 class="mb-0">Listado de Pedidos</h3>
                        <span class="badge bg-primary fs-6">Total pedidos: ${pedidos.size()}</span>
                    </div>
                </div>
            </div>
            
            <div class="row mt-4">
                <div class="col-12">
                    <div class="card shadow-sm">
                        <div class="card-body">
                            <table class="table table-hover table-bordered">
                                <thead class="table-dark">
                                    <tr>
                                        <th>ID</th>
                                        <th>Fecha</th>
                                        <th>Hora</th>
                                        <th>Estado</th>
                                        <th>Establecimiento</th>
                                        <th>Empleado</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="pedido" items="${pedidos}">
                                        <tr class="${pedido.estado == 'PENDIENTE' ? 'status-pendiente' : 
                                                     pedido.estado == 'COMPLETADO' ? 'status-completado' : 
                                                     pedido.estado == 'CANCELADO' ? 'status-cancelado' : 
                                                     pedido.estado == 'ENVIADO' ? 'status-enviado' : ''}">
                                            <td>#${pedido.id}</td>
                                            <td>
                                                <fmt:formatDate pattern="dd/MM/yyyy" value="${pedido.fechaHora}" />
                                            </td>
                                            <td>
                                                <fmt:formatDate pattern="HH:mm" value="${pedido.fechaHora}" />
                                            </td>
                                            <td>
                                                <span class="badge ${pedido.estado == 'PENDIENTE' ? 'bg-warning text-dark' : 
                                                              pedido.estado == 'COMPLETADO' ? 'bg-success' : 
                                                              pedido.estado == 'CANCELADO' ? 'bg-danger' : 
                                                              pedido.estado == 'ENVIADO' ? 'bg-info text-dark' : 'bg-secondary'}">
                                                    ${pedido.estado}
                                                </span>
                                            </td>
                                            <td>${pedido.establecimiento}</td>
                                            <td>${pedido.empleado}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>