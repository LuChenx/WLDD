package com.wldd.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wldd.dao.AccountDao;
import com.wldd.entity.Account;
import com.wldd.entity.Seller;
import com.wldd.service.AccountService;
import com.wldd.utils.redisUtils;

/*
 * Author luchenxi
 * 账号处理实现类
 */
@Service("accountService")
public class AccountServiceImpl implements AccountService {

	@Autowired
	AccountDao accountDao;

	public void putAccountIntoRedis(String username, String password) {
		redisUtils.setAccount(username, password);
	}

	public Boolean accountCheck(String username) {
		Account account = accountDao.getByAccount(username);
		return redisUtils.accountIsExits(username) && (account == null);
	}

	public void putUserIntoRedis(String name, String phone, String account) {
		redisUtils.setUserInfo(account, name, phone);
	}

	public void putPUserIntoRedis(String name, String phone, String account) {
		redisUtils.setPUserInfo(account, name, phone);
	}

	public void putShopIntoRedis(Seller seller) {
		redisUtils.setShopInfo(seller);
	}

	public void setAccount(Account account) {
		accountDao.setAccount(account);
	}

}
