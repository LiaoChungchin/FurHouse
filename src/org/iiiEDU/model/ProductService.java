package org.iiiEDU.model;

import java.util.List;

public interface ProductService {
	List<Product> selectAllProduct();
	Product selectOneProduct(Integer id);
	Integer insertProduct(Product product);
	Integer updateProduct(Product product);
	Integer deleteProduct(Integer id);
	List<Product> selectProductByType(String type);
}
