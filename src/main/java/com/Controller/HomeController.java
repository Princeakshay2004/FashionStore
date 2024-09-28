package com.Controller;

import java.io.UnsupportedEncodingException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.util.ObjectUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.Config.projectConfig;
import com.Entity.User;
import com.Froms.userForm;
import com.Helper.FileUploadHelper;
import com.Helper.Message;
import com.Service.userService;

import jakarta.mail.MessagingException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class HomeController {

	@Autowired
	private userService userService;
	@Autowired
	private FileUploadHelper fileUploadHelper;
	@Autowired
	private PasswordEncoder passwordEncoder;
	@Autowired
	private projectConfig projectConfig;

	@GetMapping("/")
	public String home() {
		return "home";
	}

	@GetMapping("/signup")
	public String signup() {
		return "signup";
	}

	@PostMapping("/saveUser")
	public String saveUser( @ModelAttribute userForm userform, HttpSession sesssion) {
		if (!userform.getPassword().equals(userform.getConform_password())) {
			Message msg = new Message("Your Password Does Not Matches", "text-danger");
			sesssion.setAttribute("signupMsg", msg);
			return "redirect:/signup";
		}
		
		User user = new User();
		String Id = UUID.randomUUID().toString();
		user.setuId(Id);
		user.setName(userform.getName());
		user.setMobile(userform.getMobile());
		user.setEmail(userform.getEmail());
		user.setPassword(passwordEncoder.encode(userform.getPassword()));
		user.setGender(userform.getGender());
		user.setAddress(userform.getAddress());
		user.setState(userform.getState());
		user.setCity(userform.getCity());
		user.setPincode(userform.getPincode());
		user.setProvider("SELF");
		user.setRole("USER");
		user.setAccountNonLocked(true);
		user.setFailedAttempts(0);
		user.setEnabled(true);
		MultipartFile multipartFile = userform.getProfile();
		if(!multipartFile.isEmpty())
		{
		  user.setProfile(multipartFile.getOriginalFilename().toString());
		  fileUploadHelper.uploadFile(multipartFile);
		}
		
		
		

		try {
			userService.saveUser(user);
			Message msg = new Message("You Have Registred Successfully Please Login", "alert-success");
			sesssion.setAttribute("Login", msg);
		} catch (Exception e) {
			Message msg = new Message("Please provide Valid Information", "text-danger");
			sesssion.setAttribute("signupMsg", msg);
			return "redirect:/signup";
		}
		return "redirect:/login";
	}

	@GetMapping("/login")
	public String login() {
		return "login";
	}

	// Forgot Password

	@GetMapping("/forgot")
	public String forgotPassword() {
		return "forgot";
	}

	@PostMapping("/proccedForgot")
	public String proccedForgot(@RequestParam String email, HttpSession session, HttpServletRequest request)
			throws UnsupportedEncodingException, MessagingException {
		User user = userService.getUserByEmail(email);
		if (ObjectUtils.isEmpty(user)) {
			Message msg = new Message("Please provide valid email", "alert-danger");
			session.setAttribute("proccedForgot", msg);
			return "redirect:/forgot";
		} else {
			String Token = UUID.randomUUID().toString();
			userService.updateUserResetToken(email, Token);
			String url = com.Config.projectConfig.generateUrl(request) + "/updatePassword?Token=" + Token;

			Boolean sendmail = projectConfig.sendMail(url, email);
			if (sendmail) {
				Message msg = new Message("Password reset link send successfully.. please cheak email",
						"alert-success");
				session.setAttribute("proccedForgot", msg);
			} else {
				Message msg = new Message("Something wrong on server", "alert-danger");
				session.setAttribute("proccedForgot", msg);
			}
		}
		return "redirect:/forgot";
	}

	@GetMapping("/updatePassword")
	public String updatePassword(@RequestParam String Token, HttpSession session) {
		User user = userService.getUserBytoken(Token);

		if (ObjectUtils.isEmpty(user)) {
			Message msg = new Message("Your link is Invalid or expired !", "alert-danger");
			session.setAttribute("updatePassword", msg);
		}
		session.setAttribute("Token", Token);
		return "updatePassword";
	}

	@PostMapping("/updatePassword")
	public String saveupdatePassword(@RequestParam String Token, @RequestParam String password,@RequestParam String conform_password, HttpSession session) {
		User user = userService.getUserBytoken(Token);
		if (ObjectUtils.isEmpty(user)) {
			Message msg = new Message("Your link is Invalid or expired !", "alert-danger");
			session.setAttribute("updatePassword", msg);
		} else {
			if(password.equals(conform_password))
			{
				user.setPassword(passwordEncoder.encode(password));
				user.setResetToken(null);
				userService.updateUser(user);
				Message msg = new Message("Your password is updated Successfully, Please Login", "alert-success");
				session.setAttribute("Login", msg);
			}
			else{
				Message msg = new Message("Your Password Does Not Matches!", "alert-danger");
				session.setAttribute("updatePassword", msg);
				return"redirect:/updatePassword?Token="+Token;
			}			
		}
		return "redirect:/login";

	}

	@GetMapping("/error")
	public String error() {
		return "error";
	}

	@GetMapping("/updateProfile")
	public String updateProfile()
	{
		return"profileEdit";
	}
	
	
	@PostMapping("/saveProfile/{Id}")
	public String saveUpdatedProfile(@ModelAttribute userForm userform,@PathVariable String Id, HttpSession sesssion)
	{
	
		User user=userService.getUserById(Id);
	 	user.setName(userform.getName());
		user.setMobile(userform.getMobile());
		user.setGender(userform.getGender());
		user.setAddress(userform.getAddress());
		user.setState(userform.getState());
		user.setCity(userform.getCity());
		user.setPincode(userform.getPincode());
		user.setProvider("SELF");
		if(userform.getPassword()!=null && userform.getNewpassword()!=null)
		{
			if(userform.getPassword().equals(user.getPassword()))
			{
			 user.setPassword(passwordEncoder.encode(userform.getNewpassword()));
			}
			else {
				Message msg = new Message("Please Enter Correct Password", "alert-ddanger");
				sesssion.setAttribute("signupMsg", msg);
			}
		}
		
		if(userform.getProfile().isEmpty())
		{
		  user.setProfile(user.getProfile());
		}
		else
		{
			MultipartFile multipartFile = userform.getProfile();
			user.setProfile(multipartFile.getOriginalFilename().toString());
			fileUploadHelper.uploadFile(multipartFile);
		}
		
		try {
			userService.updateUser(user);
			Message msg = new Message("Your Profile Updated Successfully", "alert-success");
			sesssion.setAttribute("signupMsg", msg);
		} catch (Exception e) {
			Message msg = new Message("Something wengt wrong", "alert-danger");
			sesssion.setAttribute("signupMsg", msg);
		}
		return"redirect:/updateProfile";
	}	
}
