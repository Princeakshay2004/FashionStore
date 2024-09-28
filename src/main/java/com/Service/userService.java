package com.Service;

import java.util.List;

import com.Entity.User;

public interface userService {
	User saveUser(User user);

	User getUserById(String id);

	User updateUser(User user);

	void deleteUSer(String id);

	boolean isUserExist(String userID);

	boolean isUserExistByEmail(String email);

	List<User> getAllUser();

	User getUserByEmail(String email);

	public void increaseFailedAttempt(User user);

	public void userAccountLock(User user);

	public boolean unlockAcTimeExpire(User user);

	public void resetAttempt(Integer userId);

	public void updateUserResetToken(String email, String token);

	User getUserBytoken(String token);
}
