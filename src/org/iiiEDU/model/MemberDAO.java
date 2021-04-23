package org.iiiEDU.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository("memberDAO")
public class MemberDAO {

	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sf;

	public Member getMemberById(Integer memberId) {

		Session session = sf.getCurrentSession();

		return session.get(Member.class, memberId);
	}

	public Member getMemberByAccount(String account) {

		Session session = sf.getCurrentSession();
		String hql = "FROM Member m WHERE m.account=:inputAccount";
		Query<Member> query = session.createQuery(hql, Member.class);
		query.setParameter("inputAccount", account);

		return query.uniqueResult();
	}

	public List<Member> getAllMembers() {

		Session session = sf.getCurrentSession();
		String hql = " FROM Member";
		Query<Member> query = session.createQuery(hql, Member.class);
		return query.list();
	}

	public boolean deleteById(Integer memberId) {

		Session session = sf.getCurrentSession();
		Member member = session.get(Member.class, memberId);
		if (member != null) {
			session.delete(member);
			return true;
		}
		return false;
	}

	public Member updateById(Integer memberId, String password, String name, String phone, String email, String address) {

		Session session = sf.getCurrentSession();
		Member member = session.get(Member.class, memberId);
		if (member != null) {
			member.setPassword(password);
			member.setName(name);
			member.setPhone(phone);
			member.setEmail(email);
			member.setAddress(address);
		}
		return member;
	}

	public boolean updatePhoto(Integer memberId, byte[] photo, String photoPath) {

		Session session = sf.getCurrentSession();
		Member member = session.get(Member.class, memberId);
		if (member != null) {
			member.setPhoto(photo);
			member.setPhotoPath(photoPath);
			return true;
		}
		return false;
	}

	public Member insert(Member member) {

		Session session = sf.getCurrentSession();
		String hql = "FROM Member WHERE account = :inputAccount";
		Query<Member> query = session.createQuery(hql, Member.class);
		query.setParameter("inputAccount", member.getAccount());
		Member result = query.uniqueResult();
		if (result == null) {
			session.save(member);
			return member;
		}
		return null;
	}

	public Member updateById1(Integer memberId, String name, String phone, String email, String address) {

		Session session = sf.getCurrentSession();
		Member member = session.get(Member.class, memberId);
		if (member != null) {
			member.setName(name);
			member.setPhone(phone);
			member.setEmail(email);
			member.setAddress(address);
		}
		return member;
	}
}
