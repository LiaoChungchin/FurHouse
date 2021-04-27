package org.iiiEDU.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("productServiceImpl")
@Transactional
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductDAO productDAOImpl;
	
	@Override
	public List<Product> selectAllProduct() {
		return productDAOImpl.selectAllProduct();
	}

	@Override
	public Product selectOneProduct(Integer id) {
		return productDAOImpl.selectOneProduct(id);
	}

	@Override
	public Integer insertProduct(Product product) {
		return productDAOImpl.insertProduct(product);
	}

	@Override
	public Integer updateProduct(Product product) {
		return productDAOImpl.updateProduct(product);
	}

	@Override
	public Integer deleteProduct(Integer id) {
		return productDAOImpl.deleteProduct(id);
	}
}
