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
		List<Product> products = query.list();
		
		/*待新增：return null時不出錯？*/
		
		return products;
	}
	
	//選取一項
	@Override
	public Product selectOneProduct(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		Product product = session.get(Product.class, id);
		if(product!=null) {
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
		Product setproduct = session.get(Product.class,product.getId());
		
		/*待新增：所有數字欄位不得為負值*/
		if(setproduct!=null) {
			setproduct.setType(product.getType());
			setproduct.setSubType(product.getSubType());
			setproduct.setBrandName(product.getBrandName());
			setproduct.setProductName(product.getProductName());
			setproduct.setPrice(product.getPrice());
			setproduct.setQuantity(product.getQuantity());
			setproduct.setStock(product.getStock());
			setproduct.setPlace(product.getPlace());
			setproduct.setComment1(product.getComment1());
			setproduct.setComment2(product.getComment2());
			setproduct.setPhoto1(product.getPhoto1());
			setproduct.setPhoto2(product.getPhoto2());
			setproduct.setPhoto3(product.getPhoto3());
			setproduct.setUpdateDate(product.getUpdateDate());
			setproduct.setShelf(product.getShelf());
			
			return 1;
		}
		return 0;
	}
		
	//刪除
	@Override
	public Integer deleteProduct(Integer id) {
		Session session = sessionFactory.getCurrentSession();

		Product product = session.get(Product.class, id);
		
		if(product!=null) {
			session.delete(product);
			return 1;
		}
		return 0;
	}
}
