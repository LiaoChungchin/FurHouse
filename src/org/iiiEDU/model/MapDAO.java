package org.iiiEDU.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository("mapDAO")
public class MapDAO {
	
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	
	
	public List<Map> selectAllMap(){
		Session session = sessionFactory.getCurrentSession();
		
		String hql = "from Map";
		
		Query<Map> query = session.createQuery(hql, Map.class);
		List<Map> maps = query.getResultList();
		
		return maps;
	}
	
	public Map selectOneMapById(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		
		Map map = session.get(Map.class, id);
		
		return map;
	}
	
	public List<Map> selectSomeMapByRegion(String region){
		Session session = sessionFactory.getCurrentSession();
		
		String hql = "from Map where region = :myRegion";
		
		Query<Map> query = session.createQuery(hql, Map.class).setParameter("myRegion", region);
		
		List<Map> maps = query.getResultList();
		
		return maps;
	}
	
	public List<Map> selectSomeMapBystoreName(String storeName){
		Session session = sessionFactory.getCurrentSession();
		
		String hql = "from Map where storeName like :myStoreName";
		
		Query<Map> query = session.createQuery(hql, Map.class).setParameter("myStoreName", "%"+storeName+"%");
		
		List<Map> maps = query.getResultList();
		
		return maps;
	}
}
