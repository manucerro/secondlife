<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>SecondLife - Listado de Productos</title>
        <jsp:include page="common-in-head.jsp"/>
        <style>
            .descatalogado-row {
                background-color: #f8d7da;
                opacity: 0.8;
            }
            .descatalogado-badge {
                font-size: 0.8em;
                letter-spacing: 0.5px;
            }
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
                        <h3 class="mb-0">Catálogo de Productos</h3>
                        <div>
                            <span class="badge bg-primary fs-6 me-2">Total: ${productos.size()}</span>
                            <span class="badge bg-danger fs-6">Descatalogados: 
                                <c:set var="countDescatalogados" value="0"/>
                                <c:forEach var="producto" items="${productos}">
                                    <c:if test="${producto.descatalogado}">
                                        <c:set var="countDescatalogados" value="${countDescatalogados + 1}"/>
                                    </c:if>
                                </c:forEach>
                                ${countDescatalogados}
                            </span>
                        </div>
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
                                        <th>Nombre</th>
                                        <th>Familia</th>
                                        <th class="text-end">Precio</th>
                                        <th class="text-center">Fecha Alta</th>
                                        <th class="text-center">Estado</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="producto" items="${productos}">
                                        <tr class="${producto.descatalogado ? 'descatalogado-row' : ''}">
                                            <td>${producto.id}</td>
                                            <td>${producto.nombre}</td>
                                            <td>
                                                <span class="badge bg-info text-dark">
                                                    ${producto.familia.nombre}
                                                </span>
                                            </td>
                                            <td class="text-end fw-bold">
                                                <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${producto.precio}" /> €
                                            </td>
                                            <td class="text-center">
                                                <fmt:formatDate pattern="dd/MM/yyyy" value="${producto.fechaAlta}" />
                                            </td>
                                            <td class="text-center">
                                                <c:choose>
                                                    <c:when test="${producto.descatalogado}">
                                                        <span class="badge bg-danger descatalogado-badge">DESCATALOGADO</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="badge bg-success descatalogado-badge">DISPONIBLE</span>
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