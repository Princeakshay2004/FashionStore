package com.Repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.Entity.User;

@Repository
public interface userRepo extends JpaRepository<User, String> {

	User findByEmail(String email);

	User findByResetToken(String resetToken);

}
