package org.iiiEDU.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository("adoptListDAOimpl")
public class AdoptListDAOimpl implements AdoptListDAO {

	@Autowired
	@Qualifier("sessionFactory")
	SessionFactory sessionFactory;

	@Override
	public Integer insertAdoptList(AdoptList adoptList) {

		Session session = sessionFactory.getCurrentSession();

		Cat cat = session.get(Cat.class, adoptList.getFk_catId());
		Member member = session.get(Member.class, adoptList.getFk_memberId());
		AdoptListStatus adoptListStatus = session.get(AdoptListStatus.class, adoptList.getFk_adoptListStatusId());

		adoptList.setCat(cat);
		adoptList.setMember(member);
		adoptList.setAdoptListStatus(adoptListStatus);

		if (adoptList.getVisitTime() != null) {
			session.save(adoptList);
			return 1;
		}
		return 0;
	}

	@Override
	public Integer updateAdoptList(AdoptList adoptList) {
		Session session = sessionFactory.getCurrentSession();

		AdoptList changAdoptList = session.get(AdoptList.class, adoptList.getId());

		Cat cat = session.get(Cat.class, adoptList.getFk_catId());
		Member member = session.get(Member.class, adoptList.getFk_memberId());
		AdoptListStatus adoptListStatus = session.get(AdoptListStatus.class, adoptList.getFk_adoptListStatusId());

		if (changAdoptList != null) {
			changAdoptList.setVisitTime(adoptList.getVisitTime());
			changAdoptList.setCat(cat);
			changAdoptList.setMember(member);
			changAdoptList.setAdoptListStatus(adoptListStatus);

			return 1;
		}
		return null;
	}

	@Override
	public Integer deleteAdoptList(Integer id) {
		Session session = sessionFactory.getCurrentSession();

		AdoptList adoptList = session.get(AdoptList.class, id);
		if (adoptList != null) {
			session.delete(adoptList);
			return 1;
		}
		return null;
	}

	@Override
	public List<AdoptList> selectAllAdoptList() {
		Session session = sessionFactory.getCurrentSession();

		String hql = "from AdoptList";

		Query<AdoptList> query = session.createQuery(hql, AdoptList.class);
		List<AdoptList> adoptLists = query.list();

		return adoptLists;
	}

	@Override
	public AdoptList selectOneAdoptList(Integer id) {
		Session session = sessionFactory.getCurrentSession();

		AdoptList adoptList = session.get(AdoptList.class, id);

		if (adoptList != null) {
			return adoptList;
		}
		return null;
	}

	@Override
	public List<AdoptList> searchAllAdoptListStatus(String adoptListStatus) {
		return null;
	}

	@Override
	public List<AdoptList> searchAllAdoptListCatId(Integer catId) {
		Session session = sessionFactory.getCurrentSession();

		String hql = "from AdoptList as a where a.cat.id = :catId";
		
		Query<AdoptList> query = session.createQuery(hql, AdoptList.class);
		query.setParameter("catId", catId);
		
		List<AdoptList> adoptLists = query.getResultList();
		
		return adoptLists;
	}
	
	@Override
	public List<AdoptList> searchAllAdoptListCatNickname(String catNickname) {
		Session session = sessionFactory.getCurrentSession();

		String hql = "from AdoptList as a where a.cat.nickname like :catNickname";
		
		Query<AdoptList> query = session.createQuery(hql, AdoptList.class);
		query.setParameter("catNickname", "%"+catNickname+"%");
		
		List<AdoptList> adoptLists = query.getResultList();
		
		return adoptLists;
	}

	@Override
	public List<AdoptList> searchAllAdoptListMemberId(Integer memberId) {
		Session session = sessionFactory.getCurrentSession();

		String hql = "from AdoptList where fk_memberId = :memberId";
		
		Query<AdoptList> query = session.createQuery(hql, AdoptList.class);
		query.setParameter("memberId", memberId);
		
		List<AdoptList> adoptLists = query.getResultList();
		
		return adoptLists;
	}

	@Override
	public List<AdoptList> searchAllAdoptListMemberName(String memberName) {
		
		Session session = sessionFactory.getCurrentSession();

		String hql = "from AdoptList as a where a.member.name like :memberName";
		
		Query<AdoptList> query = session.createQuery(hql, AdoptList.class);
		query.setParameter("memberName", "%"+memberName+"%");
		
		List<AdoptList> adoptLists = query.getResultList();
		
		return adoptLists;
	}
	
}
