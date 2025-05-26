<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>SecondLife - Listado de Empleados</title>
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
                        <h3 class="mb-0">Listado de Empleados</h3>
                        <span class="badge bg-primary fs-6">Total empleados: ${empleados.size()}</span>
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
                                        <th>Nombre Completo</th>
                                        <th>Teléfono</th>
                                        <th>Email</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="empleado" items="${empleados}">
                                        <tr>
                                            <td>${empleado.nombreCompleto}</td>
                                            <td>${empleado.telefono}</td>
                                            <td>
                                                <a href="mailto:${empleado.email}" class="text-decoration-none">
                                                    ${empleado.email}
                                                </a>
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