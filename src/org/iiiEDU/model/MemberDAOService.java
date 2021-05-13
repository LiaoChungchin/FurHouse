package org.iiiEDU.model;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service(value = "memberDAOService")
@Transactional
public class MemberDAOService {
	
	@Autowired @Qualifier("memberDAO")
	private MemberDAO memberDAO;
	
	public Member getMemberById(Integer memberId) {
		
		return memberDAO.getMemberById(memberId);
	}
	
	public Member getMemberByAccount(String account) {
		
		return memberDAO.getMemberByAccount(account);
	}
	
	public List<Member> getAllMembers() {
		
		return memberDAO.getAllMembers();
	}
	
	public boolean deleteById(Integer memberId) {
		
		return memberDAO.deleteById(memberId);
	}
	
	public Member updateById(Integer memberId, String password, String name, String phone, String email,String address) {
		
		return memberDAO.updateById(memberId, password, name, phone, email, address);
	}
	
	public boolean updatePhoto(Integer memberId, byte[] photo, String photoPath) {
		
		return memberDAO.updatePhoto(memberId, photo, photoPath);
	}
	
	public Member insert(Member member) {
		
		return memberDAO.insert(member);
	}
	
	public Member updateById2(Integer memberId,String password) {

		return memberDAO.updateById2(memberId, password);
	}
}
