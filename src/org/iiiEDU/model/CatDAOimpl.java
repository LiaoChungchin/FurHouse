package org.iiiEDU.model;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository("catimplDAO")
@Transactional
public class CatDAOimpl implements CatDAO {
	@Autowired @Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	
	@Override
	public List<Cat> selectAllCat(){
		Session session = sessionFactory.getCurrentSession();
		
		String hql = "from Cat";
		
		
		Query<Cat> query = session.createQuery(hql,Cat.class);
		
		List<Cat> cats = query.list();
		
		
		return cats;

	}

	@Override
	public Cat selectOneCat(Integer id){
		Session session = sessionFactory.getCurrentSession();
		Cat cat = session.get(Cat.class, id);
		if(cat!=null) {
			return cat;
		}
		return null;
	}
	
	@Override
	public Integer insertCat(Cat cat) {
		Session session = sessionFactory.getCurrentSession();
		
		AdoptStatus adoptStatus = session.get(AdoptStatus.class,cat.getFk_adoptStatusId());
		
		cat.setAdoptStatus(adoptStatus);
		
		if(cat.getNickname()!=null) {
			session.save(cat);
			return 1;
		}
		return 0;
	}
	
	@Override
	public Integer updateCat(Cat cat) {
		Session session = sessionFactory.getCurrentSession();
		Cat changcat = session.get(Cat.class,cat.getId());
		
		AdoptStatus adoptStatus = session.get(AdoptStatus.class,cat.getFk_adoptStatusId());
		System.out.println(adoptStatus);
		if(changcat!=null) {
			changcat.setNickname(cat.getNickname());
			changcat.setType(cat.getType());
			changcat.setGender(cat.getGender());
			changcat.setLigation(cat.getLigation());
			changcat.setVaccination(cat.getVaccination());
			changcat.setCreateDate(cat.getCreateDate());
			changcat.setComment1(cat.getComment1());
			changcat.setComment2(cat.getComment2());
			changcat.setPhoto1(cat.getPhoto1());
			changcat.setPhoto2(cat.getPhoto2());
			changcat.setAdoptStatus(adoptStatus);
			
			System.out.println("update:"+changcat);
			
			session.save(changcat);
			return 1;
		}
		return 0;
	}

	@Override
	public Integer deleteCat(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		
		Cat cat = session.get(Cat.class, id);
		
		if(cat!=null) {
			cat.setAdoptStatus(null);
			session.delete(cat);
			return 1;
		}
		return 0;
	}

}
