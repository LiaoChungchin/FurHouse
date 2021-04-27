package org.iiiEDU.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository("productDAOImpl")
public class ProductDAOImpl implements ProductDAO {
	
	@Autowired 
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;	
	
	//選取全部
	@Override
	public List<Product> selectAllProduct(){
		
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM Product"; 
			
		Query<Product> query = session.createQuery(hql,Product.class);		

		return query.list();
	}
	
	//選取一項
	@Override
	public Product selectOneProduct(Integer id) {
		
		Session session = sessionFactory.getCurrentSession();
		Product product = session.get(Product.class, id);
		
		if(product != null) {
			
			return product;
		}
		
		return null;
	}
	
	//新增
	@Override
	public Integer insertProduct(Product product) {
		
		Session session = sessionFactory.getCurrentSession();
		session.save(product);
		
		return 1;		
	}
	
	//更新
	@Override
	public Integer updateProduct(Product product) {
		
		Session session = sessionFactory.getCurrentSession();
		Product setProduct = session.get(Product.class,product.getId());
		
		if(setProduct != null) {
			
			setProduct.setType(product.getType());
			setProduct.setSubType(product.getSubType());
			setProduct.setBrandName(product.getBrandName());
			setProduct.setProductName(product.getProductName());
			setProduct.setPrice(product.getPrice());
			setProduct.setQuantity(product.getQuantity());
			setProduct.setStock(product.getStock());
			setProduct.setPlace(product.getPlace());
			setProduct.setComment1(product.getComment1());
			setProduct.setComment2(product.getComment2());
			setProduct.setPhoto1(product.getPhoto1());
			setProduct.setPhoto2(product.getPhoto2());
			setProduct.setPhoto3(product.getPhoto3());
			setProduct.setUpdateDate(product.getUpdateDate());
			setProduct.setShelf(product.getShelf());
			
			return 1;
		}
		
		return 0;
	}
		
	//刪除
	@Override
	public Integer deleteProduct(Integer id) {
		
		Session session = sessionFactory.getCurrentSession();
		Product product = session.get(Product.class, id);
		
		if(product != null) {
			session.delete(product);
			
			return 1;
		}
		
		return 0;
	}
}
