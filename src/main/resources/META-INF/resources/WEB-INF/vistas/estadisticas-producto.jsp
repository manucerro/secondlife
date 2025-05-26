<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Pollos Chicharrón - Estadísticas</title>
        <jsp:include page="common-in-head.jsp"/>
    </head>
    <body>
        <div class="container-fluid">
			<jsp:include page="nav.jsp">
			    <jsp:param name="active" value="productos"/>
			</jsp:include>
            
            <div class="row mt-3">
                <div class="col-md-12">
                    <div class="d-flex justify-content-between align-items-center">
                        <h3 class="mb-0">Estadísticas de Productos</h3>
                        <span class="badge bg-primary fs-6">Total productos: ${numeroProductos}</span>
                    </div>
                </div>
            </div>
            
            <div class="row mt-4">
                <div class="col-md-10 mx-auto">
                    <div class="card shadow-sm">
                        <div class="card-body">
                            <table class="table table-hover table-bordered">
                                <thead class="table-dark">
                                    <tr>
                                        <th>ID Familia</th>
                                        <th>Familia</th>
                                        <th class="text-right">Número de productos</th>
                                        <th class="text-right">Precio medio</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="entry" items="${mapa1}">
                                        <tr>
                                            <td>${entry.key.id}</td>
                                            <td>${entry.key.nombre}</td>
                                            <td class="text-right">${entry.value}</td>
                                            <td class="text-right">
                                                <c:choose>
                                                    <c:when test="${not empty mapa2[entry.key]}">
                                                        <span class="fw-bold">
                                                            <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${mapa2[entry.key]}" /> €
                                                        </span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="text-muted">---</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
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