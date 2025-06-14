package com.agora.secondlife.security;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.agora.secondlife.security.integration.model.UsuarioPL;
import com.agora.secondlife.security.integration.repositories.UsuarioPLRepository;

@Service
public class UserDetailsServiceImpl implements UserDetailsService{

	private UsuarioPLRepository usuarioPLRepository;
	
	public UserDetailsServiceImpl(UsuarioPLRepository usuarioPLRepository) {
		this.usuarioPLRepository = usuarioPLRepository;
	}
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		UsuarioPL usuarioPL = usuarioPLRepository.findByUsername(username)
				.orElseThrow(() -> new UsernameNotFoundException("User Not Found with username " + username));
	
		return UserDetailsImpl.build(usuarioPL);
	}

}
