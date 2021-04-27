package org.iiiEDU.model;

import java.util.List;

public interface ProductDAO {
	
	public List<Product> selectAllProduct();
	
	public Product selectOneProduct(Integer id);
	
	public Integer insertProduct(Product product);	
	
	public Integer updateProduct(Product product);	
	
	public Integer deleteProduct(Integer id);
}
