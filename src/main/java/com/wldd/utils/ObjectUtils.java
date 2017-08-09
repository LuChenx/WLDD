package com.wldd.utils;

import java.beans.BeanInfo;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;

public class ObjectUtils {

	private static Logger logger = Logger.getLogger(Logger.class);

	public static Object mapToObject(Map<String, String> map, Class<?> beanClass)
			throws Exception {
		if (map == null) {
			logger.error("map is null!");
			return null;
		}
		Object obj = beanClass.newInstance();

		BeanInfo beanInfo = Introspector.getBeanInfo(obj.getClass());
		logger.info("beanInfo:" + beanInfo.toString());
		PropertyDescriptor[] propertyDescriptors = beanInfo
				.getPropertyDescriptors();
		for (PropertyDescriptor property : propertyDescriptors) {
			Method setter = property.getWriteMethod();
			if (setter != null) {
				logger.info("get param form map." + property.getName() + ":"
						+ map.get(property.getName()));
				try {
					setter.invoke(obj, map.get(property.getName()));
					logger.info("mapToObject success");
				} catch (Exception e) {
					logger.error("mapToObject error");
				}
			}
		}
		return obj;
	}

	public static Map<String, String> objectToMap(Object obj) throws Exception {
		if (obj == null)
			return null;

		Map<String, String> map = new HashMap<String, String>();

		BeanInfo beanInfo = Introspector.getBeanInfo(obj.getClass());
		PropertyDescriptor[] propertyDescriptors = beanInfo
				.getPropertyDescriptors();
		for (PropertyDescriptor property : propertyDescriptors) {
			String key = property.getName();
			logger.info("param:" + key);
			if (key.compareToIgnoreCase("class") == 0) {
				logger.info("continue:" + key);
				continue;
			}
			Method getter = property.getReadMethod();
			Object value = getter != null ? getter.invoke(obj) : null;
			if (value != null) {
				logger.info("get value:" + value.toString());
				map.put(key, value.toString());
			} else {
				logger.info("this param is null");
				continue;
			}
		}

		logger.info(map.toString());
		return map;
	}
}
