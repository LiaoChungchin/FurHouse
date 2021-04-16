package org.iiiEDU.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import org.junit.jupiter.api.Test;

/**
 * 獲得測試sql萬用更新語句
 * 
 * @作者:廖崇欽
 * @最後修改者:廖崇欽
 * @最後修改時間:2021-03-17
 */
public class PreparedStatementUpdateTest {
	
	// 測試表中加載圖片
	@Test
	public void test01(){
		
		FileInputStream fis = null;
		try {
			File uploadImg = new File("WebContent\\assets\\img\\members\\m4.jpg");
			
			fis = new FileInputStream(uploadImg);
			byte[] buff = fis.readAllBytes();
			
			String sql = "UPDATE [Member1] "
							+ "SET [photo] = ? "
							+ "WHERE [memberId] = ? ;";
			update(sql, buff, 1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(fis != null) {
				try {
					fis.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	
	// 通用的增刪改操作(未考慮事務)
	public static int update(String sql, Object... args) {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			// 獲取數據庫連接
			conn = JDBCUtils.getConnection();
			// 預編譯sql語句，返回PreparedStatement的實例
			ps = conn.prepareStatement(sql);
			// 填充佔位符
			for(int i = 0; i < args.length; i ++) {
				ps.setObject(i + 1, args[i]);
			}
			// 執行
			int update = ps.executeUpdate();
			return update;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 關閉資源
			JDBCUtils.closeResource(conn, ps);
		}
		return 0;
	}
	// 通用的增刪改操作(考慮上事務)
	public static int update(Connection conn, String sql, Object... args) {
		PreparedStatement ps = null;
		try {
			// 預編譯sql語句，返回PreparedStatement的實例
			ps = conn.prepareStatement(sql);
			// 填充佔位符
			for(int i = 0; i < args.length; i ++) {
				ps.setObject(i + 1, args[i]);
			}
			// 執行
			int update = ps.executeUpdate();
			return update;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 關閉資源
			JDBCUtils.closeResource(null, ps);
		}
		return 0;
	}
}
