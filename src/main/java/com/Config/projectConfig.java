package com.Config;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import com.cloudinary.Cloudinary;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.HttpServletRequest;

@Configuration
@Component
public class projectConfig {

	@Autowired
	private JavaMailSender mailSender;

	public boolean sendMail(String url, String receptEmail) throws UnsupportedEncodingException, MessagingException {

		MimeMessage msg = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(msg);
		helper.setFrom("akshaybachate8668@gmail.com", "FashionStore");
		helper.setTo(receptEmail);
		String Content = "<p>Hello,</p>" + "<p>You have requested to reset your password. </p>"
				+ "<p>Click the below link to change your password</p>" + "<p><a href=\"" + url
				+ "\">Change my password</a></p>";

		helper.setSubject("Password Reset");
		helper.setText(Content, true);
		mailSender.send(msg);

		return true;
	}

	public static String generateUrl(HttpServletRequest request) {
		// TODO Auto-generated method stub
		String siteuRL = request.getRequestURL().toString();
		return siteuRL.replace(request.getServletPath(), "");

	}

	@Bean
	public Cloudinary getCloudinary() {
		Map map = new HashMap();
		map.put("cloud_name", "dqg87xvqe");
		map.put("api_key", "885775179382469");
		map.put("api_secret", "5v48EbzSkTn1xvVhruhH5-kabEM");
		map.put("secure", true);

		return new Cloudinary(map);
	}

}