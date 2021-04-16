package org.iiiEDU.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("talkDAOService")
@Transactional
public class TalkDAOService {
	
	@Autowired
	@Qualifier("talkDAO")
	private TalkDAO talkDAO;
	
	public List<Talk> getByUserID(Integer sendUser) {
		
		return talkDAO.getByUserID(sendUser);
	}
	
	public void insertTalk(Talk talk) {
		
		talkDAO.insertTalk(talk);
	}
	
	public Integer setAlreadyRead(Integer sendUser) {
		
		return talkDAO.setAlreadyRead(sendUser);
	}
}
