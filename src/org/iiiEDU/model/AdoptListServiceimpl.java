package org.iiiEDU.model;

import java.sql.Timestamp;
import java.util.List;

//import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("adoptListServiceimpl")
@Transactional
public class AdoptListServiceimpl implements AdoptListService {

	@Autowired 
	private AdoptListDAO adoptListDAO;
	
	@Override
	public Integer getAdoptListTotal() {
		return adoptListDAO.getAdoptListTotal();
	}
	
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
	public List<AdoptList> selectAllAdoptListPage(Integer pageLimit,Integer currentPage){
		return adoptListDAO.selectAllAdoptListPage(pageLimit, currentPage);
	}

	@Override
	public AdoptList selectOneAdoptList(Integer id) {
		return adoptListDAO.selectOneAdoptList(id);
	}
	
	@Override
	public AdoptList selectOneAdoptList(Timestamp visitTime) {
		return adoptListDAO.selectOneAdoptList(visitTime);
	}
	
	@Override
	public List<AdoptList> searchAllAdoptListVisitTime(String visitTime){
		return adoptListDAO.searchAllAdoptListVisitTime(visitTime);
	}

	@Override
	public List<AdoptList> searchAllAdoptListStatus(String adoptListStatus) {
		return adoptListDAO.searchAllAdoptListStatus(adoptListStatus);
	}

	@Override
	public List<AdoptList> searchAllAdoptListCatId(Integer catId,Integer pageLimit,Integer currentPage) {
		return adoptListDAO.searchAllAdoptListCatId(catId,pageLimit,currentPage);
	}
	
	public List<AdoptList> searchAllAdoptListCatNickname(String catNickname,Integer pageLimit,Integer currentPage){
		return adoptListDAO.searchAllAdoptListCatNickname(catNickname,pageLimit,currentPage);
	}

	@Override
	public List<AdoptList> searchAllAdoptListMemberId(Integer memberId,Integer pageLimit,Integer currentPage) {
		return adoptListDAO.searchAllAdoptListMemberId(memberId,pageLimit,currentPage);
	}
	
	@Override
	public List<AdoptList> searchAllAdoptListMemberId(Integer memberId){
		return adoptListDAO.searchAllAdoptListMemberId(memberId);
	}

	@Override
	public List<AdoptList> searchAllAdoptListMemberName(String memberName,Integer pageLimit,Integer currentPage) {
		return adoptListDAO.searchAllAdoptListMemberName(memberName,pageLimit,currentPage);
	}


}
