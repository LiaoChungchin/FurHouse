package org.iiiEDU.test;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.iiiEDU.model.Member;
import org.iiiEDU.utils.PreparedStatementQueryTest;


@WebServlet("/MyTest")
public class TestJNDIConnection extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TestJNDIConnection() {
        super();
        
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		// 測試JNDI連接池
		Connection conn = null;
		try {
			InitialContext context = new InitialContext();
			DataSource ds = (DataSource) context.lookup("java:/comp/env/jdbc/servdb");
			conn = ds.getConnection();
			
			String sql = "SELECT [memberId] " + 
						 "      ,[account] " + 
						 "      ,[password] " + 
						 "      ,[name] " + 
						 "      ,[phone] " + 
						 "      ,[email] " + 
						 "      ,[gender] " + 
						 "      ,[address] " + 
						 "      ,[photo] " + 
						 "      ,[photoPath] " + 
						 "      ,[isBlock] " + 
						 "      ,[createDate] " + 
						 "  FROM [Member] " +
						 "  WHERE [memberId]=?;";
			
			List<Member> forList = PreparedStatementQueryTest.getForList(conn, Member.class, sql, 1);
			forList.forEach(System.out::println);
			
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
		} finally {
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
