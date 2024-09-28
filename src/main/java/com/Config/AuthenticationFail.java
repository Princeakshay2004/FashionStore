package com.Config;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import com.Entity.User;
import com.Helper.Message;
import com.Service.userService;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Component
public class AuthenticationFail implements AuthenticationFailureHandler {

	@Autowired
	private userService userService;

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		HttpSession session = request.getSession();

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		User user = userService.getUserByEmail(email);
		if (password != user.getPassword()) {
			Message msg = new Message("Invalid Creditainls", "alert-danger");
			session.setAttribute("Login", msg);
		}

		if (user.isEnabled()) {
			if (user.isAccountNonLocked()) {
				if (user.getFailedAttempts() < 3) {
					userService.increaseFailedAttempt(user);
				} else {
					userService.userAccountLock(user);
					Message msg = new Message("Your Account is Locked please try after 24 hour", "alert-danger");
					session.setAttribute("Login", msg);
				}
			} else {
				if (userService.unlockAcTimeExpire(user)) {
					Message msg = new Message("Your Account is Locked", "alert-danger");
					session.setAttribute("Login", msg);

				}

				Message msg = new Message("Your Account is Locked", "alert-danger");
				session.setAttribute("Login", msg);
			}
		} else {
			Message msg = new Message("Your Account is Inactive", "alert-danger");
			session.setAttribute("Login", msg);
		}

		response.sendRedirect("/login");
	}

}
