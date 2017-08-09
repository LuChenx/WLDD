package com.wldd.dao;

import java.util.List;

import com.wldd.entity.MyPoint;

public interface PointDao {
	void save(MyPoint myPoint);

	void delete(String pointId);

	List<MyPoint> findAll();
}
