package com.wldd.dao;

import com.wldd.entity.Account;

public interface AccountDao {
	Account getByAccount(String account);

	void setAccount(Account account);
}
