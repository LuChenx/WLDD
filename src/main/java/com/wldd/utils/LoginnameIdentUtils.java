package com.wldd.utils;

import java.util.HashMap;
import java.util.Map;

import com.sun.istack.internal.logging.Logger;

public class LoginnameIdentUtils {
	private static Logger logger = Logger.getLogger(Logger.class);

	public static String append(String loginName, String ident) {
		logger.info("append loginName and ident");
		return loginName + ident;
	}

	public static Map<String, String> subString(String tagString) {
		Map<String, String> userInfoMap = new HashMap<String, String>();
		userInfoMap.put("loginName",
				tagString.substring(0, tagString.length() - 1));
		userInfoMap.put("ident", tagString.charAt(tagString.length() - 1) + "");

		logger.info("subString tag , get ident : " + userInfoMap.get("ident"));
		return userInfoMap;
	}
}
