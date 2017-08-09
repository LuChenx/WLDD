package com.wldd.service;

import java.util.List;

import com.wldd.entity.MyPrice;

public interface MyPriceService {
	List<MyPrice> findAll();

	void save(List<MyPrice> myPrices);
}
