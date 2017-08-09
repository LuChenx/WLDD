package com.wldd.dao;

import java.util.List;

import com.wldd.entity.MyPrice;

public interface MyPriceDao {
	List<MyPrice> findAll();

	void save(MyPrice myPrice);

	void update(MyPrice myPrice);
}
