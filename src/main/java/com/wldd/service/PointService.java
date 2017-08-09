package com.wldd.service;

import java.util.List;

import com.wldd.entity.MyPoint;

public interface PointService {
	void save(MyPoint myPoint);

	void delete(String pointId);

	List<MyPoint> findAll();
}
