package com.ServiceImpl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Entity.User;
import com.Repo.userRepo;
import com.Service.userService;
import com.cloudinary.Cloudinary;

@Service
public class userServiceImpl implements userService {

	@Autowired
	private userRepo userRepo;
	@Autowired
	private Cloudinary cloudinary;

	@Override
	public User saveUser(User user) {

		return userRepo.save(user);
	}

	@Override
	public User getUserById(String id) {
		// TODO Auto-generated method stub
		return userRepo.findById(id).orElse(null);
	}

	@Override
	public User updateUser(User user) {
		return userRepo.save(user);
	}

	@Override
	public void deleteUSer(String id) {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean isUserExist(String userID) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isUserExistByEmail(String email) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<User> getAllUser() {
		return userRepo.findAll();
	}

	@Override
	public User getUserByEmail(String email) {
		return userRepo.findByEmail(email);
	}

	@Override
	public void increaseFailedAttempt(User user) {
		int attempts = user.getFailedAttempts() + 1;
		user.setFailedAttempts(attempts);
		userRepo.save(user);
	}

	@Override
	public void userAccountLock(User user) {
		user.setAccountNonLocked(false);
		user.setLockTime(new Date());
		userRepo.save(user);

	}

	@Override
	public boolean unlockAcTimeExpire(User user) {
		long lockTime = user.getLockTime().getTime();
		long unlockTime = lockTime + 24 * 60 * 60 * 1000;
		long currentTime = System.currentTimeMillis();
		if (unlockTime <= currentTime) {
			user.setAccountNonLocked(true);
			user.setFailedAttempts(0);
			user.setLockTime(null);
			userRepo.save(user);
		}
		return true;
	}

	@Override
	public void resetAttempt(Integer userId) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateUserResetToken(String email, String token) {
		// TODO Auto-generated method stub
		User user = userRepo.findByEmail(email);
		user.setResetToken(token);
		userRepo.save(user);
	}

	@Override
	public User getUserBytoken(String token) {
		return userRepo.findByResetToken(token);
	}

}
