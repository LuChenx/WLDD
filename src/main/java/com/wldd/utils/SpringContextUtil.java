package com.wldd.utils;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.NoSuchBeanDefinitionException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
/*
 * 在非controller层调用service工具类
 */
public class SpringContextUtil implements ApplicationContextAware
{

	private static ApplicationContext applicationContext; //Spring 上下文
	/*
	 * 实现ApplicationContextAware接口中的方法
	 * @see org.springframework.context.ApplicationContextAware#setApplicationContext(org.springframework.context.ApplicationContext)
	 */
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException
	{
		SpringContextUtil.applicationContext = applicationContext;
	}
	
	public static ApplicationContext getApplicationContext() {
	        return applicationContext;
	}
	 
	/*
	 * 下面是一些可能用到的方法。
	 */
	public static Object getBean(String name) throws BeansException {
	        return applicationContext.getBean(name);
	}
	 
	public static Object getBean(String name, Class requiredType)
	            throws BeansException {
	        return applicationContext.getBean(name, requiredType);
	}
	 
	public static boolean containsBean(String name) {
	        return applicationContext.containsBean(name);
	}
	 
	public static boolean isSingleton(String name) throws NoSuchBeanDefinitionException {
	        return applicationContext.isSingleton(name);
	}
	 
	public static Class getType(String name)    throws NoSuchBeanDefinitionException {
	        return applicationContext.getType(name);
	}
	 
	public static String[] getAliases(String name) throws NoSuchBeanDefinitionException {
	        return applicationContext.getAliases(name);
	}
	
}
