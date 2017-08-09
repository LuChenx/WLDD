package com.wldd.service;

import com.wldd.entity.Account;
import com.wldd.entity.Seller;

/*
 * @Author luchenxi
 * 账号处理
 */
public interface AccountService {
	public void putAccountIntoRedis(String username, String password);

	public Boolean accountCheck(String username);

	public void putUserIntoRedis(String name, String phone, String account);

	public void putPUserIntoRedis(String name, String phone, String account);

	public void putShopIntoRedis(Seller seller);

	void setAccount(Account account);
}
