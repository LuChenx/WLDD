package com.wldd.utils;

import java.util.HashMap;

import javax.servlet.http.Cookie;

import org.apache.log4j.Logger;

public class CookieUtils {

	private static Logger logger = Logger.getLogger(Logger.class);

	public static String getAccountFormCookies(Cookie[] cookies) {

		HashMap<String, String> cookiesMap = new HashMap<String, String>();

		for (int i = 0; i < cookies.length; i++) {
			Cookie cookie = cookies[i];
			logger.info("cookie-key:" + cookie.getName() + "/cookie-value:"
					+ cookie.getValue());
			cookiesMap.put(cookie.getName(), cookie.getValue());
		}

		if (cookiesMap.isEmpty()) {
			logger.error("cookie is empty");
			return null;
		}

		if (cookiesMap.get("cookie_useraccount").isEmpty()) {
			logger.error("cookie is expire");
			return null;
		} else {
			return cookiesMap.get("cookie_useraccount");
		}
	}
}
