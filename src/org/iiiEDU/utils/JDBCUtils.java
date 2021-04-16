package org.iiiEDU.utils;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

/**
 * 操作數據庫的工具類
 * 
 * @作者:廖崇欽
 * @最後修改者:廖崇欽
 * @最後修改時間:2021-02-14
 */
@Component("jdbcUtils")
@Scope("singleton")
@PropertySource("classpath:jdbc.properties")
public class JDBCUtils {
	
	// 測試連接狀況
	@Test
	public void test01() throws Exception {
		Connection conn = JDBCUtils.getConnection();
		System.out.println(conn);
	}
	
	@Value("${user}")
	private String theUser;
	@Value("${password}")
	private String thePassword;
	@Value("${url}")
	private String theUrl;
	@Value("${driverClass}")
	private String theDriverClass;
	
	public JDBCUtils() {
		super();
	}

	public Connection getConnectionByAnnotation() throws Exception {
		
		Class.forName(theDriverClass);
		Connection conn = DriverManager.getConnection(theUser, theUrl, thePassword);	

		return conn;
	}
	
	/**
	 * 獲取數據庫的連接
	 * 
	 * @作者:廖崇欽
	 * @最後修改者:廖崇欽
	 * @最後修改時間:2021-02-14
	 * @return
	 * @throws Exception
	 */
	public static Connection getConnection() throws Exception {
		
		InputStream is = ClassLoader.getSystemResourceAsStream("jdbc.properties");

		Properties pros = new Properties();
		pros.load(is);
		String user = pros.getProperty("user");
		String password = pros.getProperty("password");
		String url = pros.getProperty("url");
		String driverClass = pros.getProperty("driverClass");

		Class.forName(driverClass);
		Connection conn = DriverManager.getConnection(url, user, password);	

		return conn;
	}

	/**
	 * 關閉連接和Statement資源的操作
	 * 
	 * @作者:廖崇欽
	 * @最後修改者:廖崇欽
	 * @最後修改時間:2021-02-14
	 * @param conn
	 * @param ps
	 */
	public static void closeResource(Connection conn, Statement ps) {

		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (ps != null) {
			try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 關閉資源操作
	 * 
	 * @作者:廖崇欽
	 * @最後修改者:廖崇欽
	 * @最後修改時間:2021-02-14
	 * @param conn
	 * @param ps
	 * @param rs
	 */
	public static void closeResource(Connection conn, Statement ps, ResultSet rs) {

		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (ps != null) {
			try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (rs != null) {
			try {
			rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public String getTheUser() {
		return theUser;
	}

	public void setTheUser(String theUser) {
		this.theUser = theUser;
	}

	public String getThePassword() {
		return thePassword;
	}

	public void setThePassword(String thePassword) {
		this.thePassword = thePassword;
	}

	public String getTheUrl() {
		return theUrl;
	}

	public void setTheUrl(String theUrl) {
		this.theUrl = theUrl;
	}

	public String getTheDriverClass() {
		return theDriverClass;
	}
	
	public void setTheDriverClass(String theDriverClass) {
		this.theDriverClass = theDriverClass;
	}

	@Override
	public String toString() {
		return "JDBCUtils [theUser=" + theUser + ", thePassword=" + thePassword + ", theUrl=" + theUrl
				+ ", theDriverClass=" + theDriverClass + "]";
	}
}