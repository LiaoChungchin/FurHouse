package org.iiiEDU.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("productServiceImpl")
@Transactional
public class ProductServiceImpl implements ProductService {
	
	// Interface DI
	@Autowired
	private ProductDAO productDAO;
	
	@Override
	public List<Product> selectAllProduct() {
		
		return productDAO.selectAllProduct();
	}

	@Override
	public Product selectOneProduct(Integer id) {
		
		return productDAO.selectOneProduct(id);
	}

	@Override
	public Integer insertProduct(Product product) {
		
		return productDAO.insertProduct(product);
	}

	@Override
	public Integer updateProduct(Product product) {
		
		return productDAO.updateProduct(product);
	}

	@Override
	public Integer deleteProduct(Integer id) {
		
		return productDAO.deleteProduct(id);
	}
}
