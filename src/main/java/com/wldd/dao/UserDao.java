package com.wldd.dao;

import com.wldd.entity.User;

public interface UserDao {
	void save(User user);

	User getByLoginName(String loginName);

	void updatePassword(String loginPassword, String userId);
}
