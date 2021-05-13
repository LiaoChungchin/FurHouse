package org.iiiEDU.test;

import java.sql.Connection;
import java.sql.DriverManager;

import org.iiiEDU.config.SpringJavaEEConfig;
import org.iiiEDU.utils.JDBCUtils;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class TestSpringProperties {

	public static void main(String[] args) throws Exception {

		// using spring annotation get properties by XML
//		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("beansInUtils.config.xml");
		
		// using spring annotation get properties by Java class
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(SpringJavaEEConfig.class);
		
		JDBCUtils jdbcUtils = context.getBean("jdbcUtils", JDBCUtils.class);
//		System.out.println(jdbcUtils);
		
		String driverClass = jdbcUtils.getTheDriverClass();
		String url = jdbcUtils.getTheUrl();
		String user = jdbcUtils.getTheUser();
		String password = jdbcUtils.getThePassword();
		
		Class.forName(driverClass);
		Connection conn = DriverManager.getConnection(url, user, password);
//		System.out.println(conn);
		conn.close();
		context.close();
	}
}
