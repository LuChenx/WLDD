package com.wldd.service;

import com.wldd.entity.User;

public interface UserService {
	void save(User user);

	User getByLoginName(String loginName);

	void updatePassword(String password, String loginName);
}
