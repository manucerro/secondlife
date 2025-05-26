<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>SecondLife - Registro de Logs</title>
        <jsp:include page="common-in-head.jsp"/>
        <style>
            .status-2xx { background-color: #d4edda; }  /* Verde para respuestas exitosas */
            .status-4xx { background-color: #fff3cd; }  /* Amarillo para client errors */
            .status-5xx { background-color: #f8d7da; }  /* Rojo para server errors */
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
                        <h3 class="mb-0">Registro de Solicitudes</h3>
                        <span class="badge bg-secondary fs-6">Total registros: ${logs.size()}</span>
                    </div>
                </div>
            </div>
            
            <div class="row mt-4">
                <div class="col-12">
                    <div class="card shadow-sm">
                        <div class="card-body table-responsive">
                            <table class="table table-hover table-bordered">
                                <thead class="table-dark">
                                    <tr>
                                        <th>ID</th>
                                        <th>Fecha</th>
                                        <th>Hora</th>
                                        <th>Ruta</th>
                                        <th>Método</th>
                                        <th>IP</th>
                                        <th>Tiempo (ms)</th>
                                        <th>Estado</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="log" items="${logs}">
                                        <tr class="${log.statusCode >= 200 && log.statusCode < 300 ? 'status-2xx' : 
                                                     (log.statusCode >= 400 && log.statusCode < 500 ? 'status-4xx' : 
                                                     (log.statusCode >= 500 ? 'status-5xx' : ''))}">
                                            <td>${log.id}</td>
                                            <td>
                                                <fmt:formatDate pattern="dd/MM/yyyy" value="${log.timeStamp}" />
                                            </td>
                                            <td class="text-end">
                                                <fmt:formatDate pattern="HH:mm:ss" value="${log.timeStamp}" />
                                            </td>
                                            <td class="text-truncate" style="max-width: 200px;" title="${log.path}">
                                                ${log.path}
                                            </td>
                                            <td>
                                                <span class="badge ${log.method == 'GET' ? 'bg-primary' : 
                                                               log.method == 'POST' ? 'bg-success' : 
                                                               log.method == 'PUT' ? 'bg-warning text-dark' : 
                                                               log.method == 'DELETE' ? 'bg-danger' : 'bg-secondary'}">
                                                    ${log.method}
                                                </span>
                                            </td>
                                            <td>${log.ip}</td>
                                            <td class="text-end">${log.elapsedTime}</td>
                                            <td class="text-center">
                                                <span class="badge ${log.statusCode >= 200 && log.statusCode < 300 ? 'bg-success' : 
                                                              log.statusCode >= 400 && log.statusCode < 500 ? 'bg-warning text-dark' : 
                                                              log.statusCode >= 500 ? 'bg-danger' : 'bg-secondary'}">
                                                    ${log.statusCode}
                                                </span>
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