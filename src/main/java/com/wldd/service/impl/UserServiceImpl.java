package com.wldd.service.impl;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wldd.dao.UserDao;
import com.wldd.entity.User;
import com.wldd.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {

	private static Logger logger = Logger.getLogger(Logger.class);

	@Autowired
	UserDao userDao;

	public void save(User user) {
		userDao.save(user);
	}

	public User getByLoginName(String loginName) {
		return userDao.getByLoginName(loginName);
	}

	public void updatePassword(String password, String loginName) {
		logger.info("uid:" + loginName + " | " + password);
		userDao.updatePassword(password, loginName);
	}

}
