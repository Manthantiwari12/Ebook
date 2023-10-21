package com.dao;

import com.entity.User;

public interface UserDao {
	public boolean userRegister(User user);
	public User login(String email, String passwaord);
	public boolean updateprofile(User us);
	public boolean checkuser(String email);
}
