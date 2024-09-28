package com.Config;

import java.io.IOException;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;

import com.Helper.Message;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Component
public class LogoutSuccessHandler
		implements org.springframework.security.web.authentication.logout.LogoutSuccessHandler {

	@Override
	public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {
		HttpSession session = request.getSession();
		Message msg = new Message("You Logout Successfully", "alert-primary");
		session.setAttribute("Login", msg);
		response.sendRedirect("/login");

	}

}
