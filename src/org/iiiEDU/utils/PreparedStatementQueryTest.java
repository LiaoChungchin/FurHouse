package org.iiiEDU.utils;

import java.io.File;
import java.io.FileOutputStream;
import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.List;

import org.iiiEDU.model.Member;
import org.junit.jupiter.api.Test;

/**
 * 獲得測試sql萬用查詢語句
 * 
 * @作者:廖崇欽
 * @最後修改者:廖崇欽
 * @最後修改時間:2021-02-14
 */
public class PreparedStatementQueryTest {
	
	// 查詢表中字段
	@Test 
	public void tset01() {
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
				 "  FROM [Member1] " +         // <----之後改Member
				 "  WHERE [memberId]=?;";
		List<Member> forList = getForList(Member.class, sql, 1);
		forList.forEach(System.out::println);
	}
	// 查詢表中photo圖片
	@Test 
	public void tset02() throws Exception {
		String sql = "SELECT [photo] photo "
					+ "FROM [Member1] "        // <----之後改Member
					+ "WHERE [memberId]=?;";
		List<Member> forList = getForList(Member.class, sql, 1);
		forList.forEach(System.out::println);
		
		byte[] buff = forList.get(0).getPhoto();
		
		File downLoadImage = new File("WebContent\\assets\\img\\testPathFile\\copy.jpg");
		FileOutputStream fos = new FileOutputStream(downLoadImage);
		fos.write(buff);
		
		fos.close();
	}

	@SuppressWarnings("deprecation")
	public static <T> List<T> getForList(Class<T> clazz, String sql, Object... args){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			// 獲取連接
			conn = JDBCUtils.getConnection();	
			// 執行預編譯sql語句
			ps = conn.prepareStatement(sql);
			// prepare statement ? 注入
			for(int i = 0; i < args.length; i ++) {
			ps.setObject(i + 1, args[i]);
			}
			// 獲取結果集
			rs = ps.executeQuery();
			// 獲取結果集的元資料
			ResultSetMetaData rsmd = rs.getMetaData();
			int columnCount = rsmd.getColumnCount(); // 結果集的欄位數
			// 造要回傳的list
			ArrayList<T> list = new ArrayList<>();
			// 結果集的遍歷
			while(rs.next()) {
				// 造該類的對象
				T t = clazz.newInstance();
				// 將查詢到的結果集封裝到類所創造的對象中(ORM思想)
				for(int i = 0; i < columnCount; i ++) {
					Object columnValue = rs.getObject(i + 1);
					String columnLabel = rsmd.getColumnLabel(i + 1); // 結果集的該欄位的標籤名稱
					Field field = clazz.getDeclaredField(columnLabel); // 反射得到對象該名稱的屬性
					field.setAccessible(true);
					field.set(t, columnValue); // 對象的屬性設值
				}
				list.add(t);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 資源的關閉
			JDBCUtils.closeResource(conn, ps, rs);
		}
		return null;
	}
	
	// 通用的查詢操作，用於返回數據中的一條紀錄(考慮上事務)
	@SuppressWarnings("deprecation")
	public static <T> List<T> getForList(Connection conn, Class<T> clazz, String sql, Object... args){
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			// 執行預編譯sql語句
			ps = conn.prepareStatement(sql);
			// prepare statement ? 注入
			for(int i = 0; i < args.length; i ++) {
			ps.setObject(i + 1, args[i]);
			}
			// 獲取結果集
			rs = ps.executeQuery();
			// 獲取結果集的元資料
			ResultSetMetaData rsmd = rs.getMetaData();
			int columnCount = rsmd.getColumnCount(); // 結果集的欄位數
			// 造要回傳的list
			ArrayList<T> list = new ArrayList<>();
			// 結果集的遍歷
			while(rs.next()) {
				// 造該類的對象
				T t = clazz.newInstance();
				// 將查詢到的結果集封裝到類所創造的對象中(ORM思想)
				for(int i = 0; i < columnCount; i ++) {
					Object columnValue = rs.getObject(i + 1);
					String columnLabel = rsmd.getColumnLabel(i + 1); // 結果集的該欄位的標籤名稱
					Field field = clazz.getDeclaredField(columnLabel); // 反射得到對象該名稱的屬性
					field.setAccessible(true);
					field.set(t, columnValue); // 對象的屬性設值
				}
				list.add(t);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 資源的關閉
			JDBCUtils.closeResource(null, ps, rs);
		}
		return null;
	}
}
