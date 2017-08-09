package com.wldd.common;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import com.wldd.entity.MyPrice;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MyPriceModel {
	private List<MyPrice> myPrice;
}
