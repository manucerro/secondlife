<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
    <div class="container-fluid">
        <a class="navbar-brand d-flex align-items-center" href="./home">
            <img src="/img/logo2.jpg" alt="SecondLife Logo" height="40" class="me-2 rounded-circle">
            <span class="fw-bold">SecondLife</span>
        </a>
        
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" 
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link ${param.active == 'home' ? 'active' : ''}" href="./home">
                        <i class="bi bi-house-door me-1"></i>Inicio
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ${param.active == 'empleados' ? 'active' : ''}" href="./lista-empleados">
                        <i class="bi bi-people me-1"></i>Empleados
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ${param.active == 'productos' ? 'active' : ''}" href="./lista-productos">
                        <i class="bi bi-box-seam me-1"></i>Productos
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ${param.active == 'estadisticas' ? 'active' : ''}" href="./estadisticas-producto">
                        <i class="bi bi-graph-up me-1"></i>Estadísticas
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ${param.active == 'pedidos' ? 'active' : ''}" href="./lista-pedidos">
                        <i class="bi bi-clipboard-check me-1"></i>Pedidos
                    </a>
                </li>
            </ul>
            
            <div class="d-flex">
                <span class="navbar-text me-3">
                    <i class="bi bi-recycle text-success"></i> Reutilizando con sentido
                </span>
            </div>
        </div>
    </div>
</nav>

<!-- Bootstrap Icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">