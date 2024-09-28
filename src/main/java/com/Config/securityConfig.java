package com.Config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import jakarta.servlet.http.HttpSession;

@Configuration
@EnableWebSecurity
@EnableMethodSecurity

public class securityConfig {

	@Autowired
	private userDetailService userDetailService;
	@Autowired
	private AuthenticationFail authenticationFail;
	@Autowired
	private LogoutSuccessHandler logoutSuccessHandler;
	@Autowired
	private AuthenticationSuccess authenticationSuccess;

	@Bean
	public DaoAuthenticationProvider daoAuthenticationProvider() {
		DaoAuthenticationProvider dap = new DaoAuthenticationProvider();
		dap.setUserDetailsService(userDetailService);
		dap.setPasswordEncoder(passwordEncoder());
		return dap;
	}

	@Bean
	public SecurityFilterChain securityFilterChain(HttpSession session, HttpSecurity httpSecurity) throws Exception {
		// To customize security
		httpSecurity.csrf(AbstractHttpConfigurer::disable);

		httpSecurity.authorizeHttpRequests(authorize -> {
			authorize.requestMatchers("/").authenticated();
			authorize.requestMatchers("/products/**").authenticated();
			authorize.requestMatchers("/admin/**").authenticated();
			authorize.requestMatchers("/cart/**").authenticated();
			authorize.requestMatchers("/order/**").authenticated();
			

			authorize.anyRequest().permitAll();
		});

		// login from customize
		httpSecurity.formLogin(formLogin -> {
			formLogin.loginPage("/login");
			formLogin.loginProcessingUrl("/do_login");
			formLogin.usernameParameter("email");
			formLogin.passwordParameter("password");
			formLogin.defaultSuccessUrl("/");
			formLogin.failureHandler(authenticationFail);
		});
		// for logout
		httpSecurity.logout(logoutform -> {
			logoutform.logoutUrl("/logout");
			logoutform.logoutSuccessUrl("/login?logout=true");
			logoutform.logoutSuccessHandler(logoutSuccessHandler);
		});

		httpSecurity.oauth2Login(oauth -> {
			oauth.loginPage("/login");
			oauth.successHandler(authenticationSuccess);
		});

		return httpSecurity.build();

	}

	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

}
