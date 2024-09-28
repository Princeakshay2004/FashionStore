package com.Config;

import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.security.oauth2.core.user.DefaultOAuth2User;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.Entity.User;
import com.Helper.getLoggedUser;
import com.Repo.userRepo;
import com.Service.userService;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Component
public class AuthenticationSuccess implements AuthenticationSuccessHandler {
	@Autowired
	private getLoggedUser getLoggedUser;
	@Autowired
	private userService userService;
	@Autowired
	private userRepo userRepo;

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {

		OAuth2AuthenticationToken authenticationToken = (OAuth2AuthenticationToken) authentication;
		String authorizeClientId = authenticationToken.getAuthorizedClientRegistrationId();
		DefaultOAuth2User user = (DefaultOAuth2User) authentication.getPrincipal();

		if (authorizeClientId.equals("google")) {
			// To fetch user data
			String email = user.getAttribute("email").toString();
			String name = user.getAttribute("name").toString();
			String picture = user.getAttribute("picture").toString();

			// to save data
			User user1 = new User();
			user1.setName(name);
			user1.setEmail(email);
			user1.setProfile(picture);
			user1.setEmailverified(true);
			user1.setPassword(UUID.randomUUID().toString());
			user1.setuId(UUID.randomUUID().toString());
			user1.setProvider("GOOGLE");
			user1.setEnabled(true);
			user1.setGender("");
			user1.setCity("");
			user1.setAccountNonLocked(true);
			user1.setFailedAttempts(0);
			user1.setRole("USER");
			user1.setAddress("");
			user1.setState("");
			User user2 = userRepo.findByEmail(email);
			if (user2 == null) {
				userRepo.save(user1);
			}
		} else if (authorizeClientId.equals("github")) {

			// To fetch user data
			String email = user.getAttribute("email") != null ? user.getAttribute("gmail").toString()
					: user.getAttribute("login").toString() + "@gmail.com";
			String name = user.getAttribute("login").toString();
			String picture = user.getAttribute("avatar_url").toString();

			// to save data
			// to save data
			User user1 = new User();
			user1.setName(name);
			user1.setEmail(email);
			user1.setProfile(picture);
			user1.setEmailverified(true);
			user1.setPassword(UUID.randomUUID().toString());
			user1.setuId(UUID.randomUUID().toString());
			user1.setProvider("GOOGLE");
			user1.setEnabled(true);
			user1.setGender("");
			user1.setCity("");
			user1.setAccountNonLocked(true);
			user1.setFailedAttempts(0);
			user1.setRole("USER");
			user1.setAddress("");
			user1.setState("");
			User user2 = userRepo.findByEmail(email);
			if (user2 == null) {
				userRepo.save(user1);
			}
		}

		String username = com.Helper.getLoggedUser.getemailOfLoggerUser(authentication);
		User user1 = userService.getUserByEmail(username);

		if (user1.getRole().equals("ADMIN")) {
			response.sendRedirect("/admin");
		} else if (user1.getRole().equals("USER")) {
			response.sendRedirect("/");
		}

	}
}
