package org.iiiEDU.model;

import java.sql.Connection;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.iiiEDU.utils.PreparedStatementQueryTest;
import org.iiiEDU.utils.PreparedStatementUpdateTest;
import org.springframework.stereotype.Service;

/**
 * 產品頁面， 產品的DAO
 * 
 * @作者:林純歆
 * @最後修改者:林純歆
 * @最後修改時間:2021-03-24
 */

@Service("productImplDAO")
public class ProductImplDAO {

	public List<Product> SelectAllProduct() {

		String sql = "SELECT [id] id" 
				+ "      ,[type] type" 
				+ "      ,[subType] subType"
				+ "      ,[brandName] brandName" 
				+ "      ,[productName] productName" 
				+ "      ,[price] price"
				+ "      ,[quantity] quantity" 
				+ "      ,[stock] stock" 
				+ "      ,[place] place"
				+ "      ,[comment1] comment1" 
				+ "      ,[comment2] comment2" 
				+ "      ,[photo1] photo1"
				+ "      ,[photo2] photo2" 
				+ "      ,[photo3] photo3" 
				+ "      ,[updateDate] updateDate"
				+"       ,[shelf] shelf"
				+ "  FROM [FurHouse].[dbo].[Product];";

		Connection conn = null;

		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource) context.lookup("java:/comp/env/jdbc/servdb");
			conn = ds.getConnection();
			
			List<Product> forList = PreparedStatementQueryTest.getForList(conn, Product.class, sql);
			
			return forList;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return null;
	}
	
	
	
	public List<Product> SelectOneProduct(int productId){
		String sql ="SELECT [id] id" 
				+ "      ,[type] type" 
				+ "      ,[subType] subType"
				+ "      ,[brandName] brandName" 
				+ "      ,[productName] productName" 
				+ "      ,[price] price"
				+ "      ,[quantity] quantity" 
				+ "      ,[stock] stock" 
				+ "      ,[place] place"
				+ "      ,[comment1] comment1" 
				+ "      ,[comment2] comment2" 
				+ "      ,[photo1] photo1"
				+ "      ,[photo2] photo2" 
				+ "      ,[photo3] photo3" 
				+ "      ,[updateDate] updateDate"
				+"       ,[shelf] shelf"
				+ "  FROM [FurHouse].[dbo].[Product]"
				+ " WHERE [id] = ?";
		
		Connection conn = null;

		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:/comp/env/jdbc/servdb");
			conn = ds.getConnection();
			
			List<Product> forList = PreparedStatementQueryTest.getForList(conn,Product.class, sql ,productId);

			return forList;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(conn!=null) {
				try {
					conn.close();
				}catch(Exception e) {
					e.printStackTrace();
				}	
			}
		}
		return null;
	}

	public int SelectLastProductId(){
		String sql = "SELECT [id] id"
				+	" FROM [FurHouse].[dbo].[Product]" 
				+	" ORDER BY [Product] DESC";
		
		Connection conn = null;

		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:/comp/env/FurHouse/servdb");
			conn = ds.getConnection();
			
			List<Product> forList = PreparedStatementQueryTest.getForList(conn,Product.class, sql);

			return forList.get(0).getId();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(conn!=null) {
				try {
					conn.close();
				}catch(Exception e) {
					e.printStackTrace();
				}	
			}
		}
		return 0;
	}

	public int insertProduct(Product product) {
		String sql = "INSERT INTO [FurHouse].[dbo].[Product]"
					+ "([type]"
					+ ",[subType]"
					+ ",[brandName]"
					+ ",[productName]"
					+ ",[price]"
					+ ",[quantity]"
					+ ",[stock]"
					+ ",[place]"
					+ ",[comment1]"
					+ ",[comment2]"
					+ ",[photo1]"
					+ ",[photo2]"
					+ ",[photo3]"
					+ ",[updateDate]"
					+ ",[shelf])"
					+ "VALUES"
					+ "(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		
		Connection conn = null;
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:/comp/env/FurHouse/servdb");
			conn = ds.getConnection();
			
			int i = PreparedStatementUpdateTest.update(conn, sql ,product.getId(),product.getType(),product.getSubType(),product.getBrandName()
						,product.getProductName(),product.getPrice(),product.getQuantity(),product.getStock(),product.getPlace()
						,product.getComment1(),product.getComment2(),product.getPhoto1(),product.getPhoto2(),product.getPhoto3()
						,product.getUpdateDate(),product.getShelf());
			return i;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(conn!=null) {
				try {
					conn.close();
				}catch(Exception e) {
					e.printStackTrace();
				}	
			}
		}
		return 0;
	}

	public int updateProduct(Product product) {
		String sql = "UPDATE [FurHouse].[dbo].[Product]"
				+ "   SET [type] = ?"
				+ "      ,[subtype] = ?"
				+ "      ,[brand_name] = ?"
				+ "      ,[product_name] = ?"
				+ "      ,[price] = ?"
				+ "      ,[quantity] = ?"
				+ "      ,[stock] = ?"
				+ "      ,[place] = ?"
				+ "      ,[comment1] = ?"
				+ "      ,[comment2] = ?"
				+ "      ,[photo1] = ?"
				+ "		 ,[photo2] = ?"
				+ "		 ,[photo3] = ?"
				+ "		 ,[updateDate] = ?"
				+ "		 ,[shelf] = ?"
				+ " WHERE [id] = ?";
		
		Connection conn = null;
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:/comp/env/FurHouse/servdb");
			conn = ds.getConnection();
			
			int i = PreparedStatementUpdateTest.update(conn, sql ,product.getType(),product.getSubType(),product.getBrandName()
					 ,product.getProductName(),product.getPrice(),product.getQuantity(),product.getStock()
					 ,product.getPlace(),product.getComment1(),product.getComment2(),product.getPhoto1(),product.getPhoto2()
					 ,product.getPhoto3(),product.getUpdateDate(),product.getShelf(),product.getId());
			return i;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(conn!=null) {
				try {
					conn.close();
				}catch(Exception e) {
					e.printStackTrace();
				}	
			}
		}
		return 0;
	}

	public int deleteProduct(int productId) {
		String sql = "DELETE FROM [FurHouse].[dbo].[Product] WHERE [id] = ?";
		
		Connection conn = null;
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:/comp/env/FurHouse/servdb");
			conn = ds.getConnection();
			
			int i = PreparedStatementUpdateTest.update(conn, sql ,productId);
			return i;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(conn!=null) {
				try {
					conn.close();
				}catch(Exception e) {
					e.printStackTrace();
				}	
			}
		}
		return 0;
	}

}

