package com.agora.secondlife.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.servlet.util.matcher.MvcRequestMatcher;
import org.springframework.web.servlet.handler.HandlerMappingIntrospector;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

	@Autowired
	private UserDetailsService userDetailsService;

	@Autowired
	private JwtAuthEntryPoint unauthorizedHandler;

	@Bean
	JwtAuthTokenFilter authenticationTokenFilterBean() throws Exception {
		return new JwtAuthTokenFilter();
	}

	@Bean
	AuthenticationManager authenticationManager(AuthenticationConfiguration authConfig) throws Exception {
		return authConfig.getAuthenticationManager();
	}

	@Bean
	PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	    
	@Bean
	MvcRequestMatcher.Builder mvc(HandlerMappingIntrospector introspector) {
		return new MvcRequestMatcher.Builder(introspector);
	}
	
	@Bean
    SecurityFilterChain filterChain(HttpSecurity http, MvcRequestMatcher.Builder mvc) throws Exception {

        http.csrf(csrf -> csrf.disable())
            
        	.exceptionHandling(exception -> exception.authenticationEntryPoint(unauthorizedHandler))		// Indicamos qué hacer en caso de usuario no autorizado
        	.headers(headers -> headers.frameOptions(frameOptions -> frameOptions.sameOrigin())) 			// Permitir el uso de iframes
        	.sessionManagement(session -> session.sessionCreationPolicy(SessionCreationPolicy.STATELESS))	// El servidor no establece sesiones
            
            .authorizeHttpRequests(auth ->
            
                auth.requestMatchers(HttpMethod.POST, "/auth/signin/**").permitAll() // Permite el acceso al controlador que entrega tokens
                    .requestMatchers("/WEB-INF/**").permitAll() 					 // Permite acceso a JSP en WEB-INF    
                    .requestMatchers("/img/**", "/css/**", "/js/**").permitAll() 	 // Permite acceso a recursos estáticos
                    .requestMatchers("/favicon.ico").permitAll() 	 				 // Permite acceso al favicon.ico
                    .requestMatchers(HttpMethod.OPTIONS, "/**").permitAll()			 // Permite cualquier petición con el verbo OPTIONS
                    .requestMatchers("/app/**").permitAll()	  						 // Permite el acceso a la aplicación JSP
                    .requestMatchers("/admin/auditoria/**").permitAll() 			 // Permite el acceso a la página de Logs
                    .requestMatchers("/h2-console/**").permitAll()					 // Permite el acceso a la consola H2
                    .requestMatchers("/").permitAll()
                    .anyRequest().authenticated()									 // El resto requiere estar autenticado   
            );
        
        http.authenticationProvider(authenticationProvider());						// Indicamos quién es el proveedor de autenticación. Quién decide quien pasa y quien no 
        http.addFilterBefore(authenticationTokenFilterBean(), 
        					 UsernamePasswordAuthenticationFilter.class);			// Incluimos el filtro de seguridad dentro de la cadena de filtros.

        return http.build();																																																																																																																					
    }

    // *************************************************************************************
    //
    // PRIVATE METHODS
    //
    // *************************************************************************************
	
	private DaoAuthenticationProvider authenticationProvider() {

		DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
		authProvider.setUserDetailsService(userDetailsService);
		authProvider.setPasswordEncoder(passwordEncoder());

		return authProvider;
	}
}