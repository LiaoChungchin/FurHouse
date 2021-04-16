package org.iiiEDU.model;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service("adoptListServiceimpl")
@Transactional
public class AdoptListServiceimpl implements AdoptListService {

	@Autowired 
	private AdoptListDAO adoptListDAO;
	
	@Override
	public Integer insertAdoptList(AdoptList adoptList) {
		adoptList.setFk_adoptListStatusId(1);
		return adoptListDAO.insertAdoptList(adoptList);
	}

	@Override
	public Integer updateAdoptList(AdoptList adoptList) {
		return adoptListDAO.updateAdoptList(adoptList);
	}

	@Override
	public Integer deleteAdoptList(Integer id) {
		return adoptListDAO.deleteAdoptList(id);
	}

	@Override
	public List<AdoptList> selectAllAdoptList() {
		return adoptListDAO.selectAllAdoptList();
	}

	@Override
	public AdoptList selectOneAdoptList(Integer id) {
		return adoptListDAO.selectOneAdoptList(id);
	}

	@Override
	public List<AdoptList> searchAllAdoptListStatus(String adoptListStatus) {
		return adoptListDAO.searchAllAdoptListStatus(adoptListStatus);
	}

	@Override
	public List<AdoptList> searchAllAdoptListCatId(Integer catId) {
		return adoptListDAO.searchAllAdoptListCatId(catId);
	}
	
	public List<AdoptList> searchAllAdoptListCatNickname(String catNickname){
		return adoptListDAO.searchAllAdoptListCatNickname(catNickname);
	}


	@Override
	public List<AdoptList> searchAllAdoptListMemberId(Integer memberId) {
		return adoptListDAO.searchAllAdoptListMemberId(memberId);
	}

	@Override
	public List<AdoptList> searchAllAdoptListMemberName(String memberName) {
		return adoptListDAO.searchAllAdoptListMemberName(memberName);
	}
}
