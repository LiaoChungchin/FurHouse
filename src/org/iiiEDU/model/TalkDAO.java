package org.iiiEDU.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository("talkDAO")
public class TalkDAO {
	
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sf;
	
	public List<Talk> getByUserID(Integer sendUser) {
		Session session = sf.getCurrentSession();
		String hql = "FROM Talk WHERE sendUser = :sendUser OR toUser = :toUser";
		Query<Talk> query = session.createQuery(hql, Talk.class);
		query.setParameter("sendUser", sendUser);
		query.setParameter("toUser", sendUser);
		
		return query.getResultList();
	}
	
	public void insertTalk(Talk talk) {
		Session session = sf.getCurrentSession();
		session.save(talk);
	}
	
	public Integer setAlreadyRead(Integer sendUser) {
		Integer count = 0;
		Session session = sf.getCurrentSession();
		String hql = "FROM Talk WHERE sendUser = :sendUser and isRead = 'unread'";
		List<Talk> query = session.createQuery(hql, Talk.class)
								  .setParameter("sendUser", sendUser)
								  .list();
		for(Talk talk : query) {
			talk.setIsRead("read");
			count++;
		}
		
		return count;
	}
	
}
