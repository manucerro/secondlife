<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>SecondLife - Electrodomésticos con nueva vida</title>
        <jsp:include page="common-in-head.jsp"/>
        <style>
            .hero-section {
                background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), url('/img/electrodomesticos-bg.jpg');
                background-size: cover;
                background-position: center;
                color: white;
                padding: 5rem 0;
                margin-bottom: 3rem;
                border-radius: 0.5rem;
            }
            
            .value-card {
                transition: transform 0.3s;
                height: 100%;
            }
            
            .value-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 10px 20px rgba(0,0,0,0.1);
            }
            
            .feature-icon {
                font-size: 2.5rem;
                margin-bottom: 1rem;
                color: #0d6efd;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid px-0">
			<jsp:include page="nav.jsp">
			    <jsp:param name="active" value="productos"/>
			</jsp:include>
            
            <!-- Hero Section -->
            <div class="hero-section text-center">
                <div class="container">
                    <h1 class="display-4 fw-bold">Bienvenido a SecondLife</h1>
                    <p class="lead fs-3">Dando una segunda oportunidad a electrodomésticos de calidad</p>
                    <a href="./lista-productos" class="btn btn-primary btn-lg mt-3">Explorar productos</a>
                </div>
            </div>
            
            <!-- Main Content -->
            <div class="container">
                <!-- About Section -->
                <div class="row align-items-center mb-5">
                    <div class="col-md-6">
                        <h2 class="fw-bold mb-4">Nuestra filosofía</h2>
                        <p class="lead">En SecondLife creemos en la economía circular y en dar una segunda vida a electrodomésticos que todavía tienen mucho que ofrecer.</p>
                        <p>Cada año, toneladas de electrodomésticos perfectamente funcionales terminan en vertederos. Nosotros los recuperamos, revisamos, reparamos si es necesario y los preparamos para que encuentren un nuevo hogar.</p>
                        <p>No solo ahorras dinero, sino que contribuyes a un planeta más sostenible.</p>
                    </div>
                    <div class="col-md-6 text-center">
                        <img src="/img/logo2.jpg" alt="Logo SecondLife" class="img-fluid rounded shadow" style="max-height: 400px;">
                    </div>
                </div>
                
                <!-- Value Propositions -->
                <h2 class="text-center mb-4 fw-bold">¿Por qué elegir SecondLife?</h2>
                <div class="row g-4 mb-5">
                    <div class="col-md-4">
                        <div class="card value-card p-4 h-100">
                            <div class="text-center">
                                <div class="feature-icon">
                                    <i class="bi bi-currency-euro"></i>
                                </div>
                                <h3>Ahorro económico</h3>
                            </div>
                            <p class="text-center">Hasta un 70% de descuento sobre el precio original. Electrodomésticos de calidad a precios asequibles.</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card value-card p-4 h-100">
                            <div class="text-center">
                                <div class="feature-icon">
                                    <i class="bi bi-shield-check"></i>
                                </div>
                                <h3>Garantía incluida</h3>
                            </div>
                            <p class="text-center">Todos nuestros productos pasan rigurosos controles e incluyen garantía de 6 meses.</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card value-card p-4 h-100">
                            <div class="text-center">
                                <div class="feature-icon">
                                    <i class="bi bi-tree"></i>
                                </div>
                                <h3>Sostenibilidad</h3>
                            </div>
                            <p class="text-center">Reduces tu huella ecológica al dar una segunda vida a productos que todavía son útiles.</p>
                        </div>
                    </div>
                </div>
                
                <!-- Testimonials -->
                <div class="bg-light p-5 rounded-3 mb-5">
                    <h2 class="text-center mb-4 fw-bold">Lo que dicen nuestros clientes</h2>
                    <div class="row">
                        <div class="col-md-4 mb-3 mb-md-0">
                            <div class="card h-100">
                                <div class="card-body">
                                    <blockquote class="blockquote mb-0">
                                        <p>"Compré una lavadora hace 6 meses y funciona perfectamente. El ahorro fue increíble."</p>
                                        <footer class="blockquote-footer">María G.</footer>
                                    </blockquote>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 mb-3 mb-md-0">
                            <div class="card h-100">
                                <div class="card-body">
                                    <blockquote class="blockquote mb-0">
                                        <p>"Excelente servicio. Me ayudaron a encontrar exactamente lo que necesitaba para mi cocina."</p>
                                        <footer class="blockquote-footer">Carlos M.</footer>
                                    </blockquote>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card h-100">
                                <div class="card-body">
                                    <blockquote class="blockquote mb-0">
                                        <p>"Me encanta la filosofía de la empresa. Calidad, ahorro y cuidado del medio ambiente."</p>
                                        <footer class="blockquote-footer">Ana L.</footer>
                                    </blockquote>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Bootstrap Icons -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    </body>
</html>