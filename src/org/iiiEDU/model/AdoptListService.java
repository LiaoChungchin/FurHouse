package org.iiiEDU.model;

import java.sql.Timestamp;
import java.util.List;

public interface AdoptListService {
	Integer getAdoptListTotal();
	Integer insertAdoptList(AdoptList adoptList);
	Integer updateAdoptList(AdoptList adoptList);
	Integer deleteAdoptList(Integer id);
	List<AdoptList> selectAllAdoptList();
	List<AdoptList> selectAllAdoptListPage(Integer pageLimit,Integer currentPage);
	AdoptList selectOneAdoptList(Integer id);
	AdoptList selectOneAdoptList(Timestamp visitTime);
	List<AdoptList> searchAllAdoptListVisitTime(String visitTime);
	List<AdoptList> searchAllAdoptListStatus(String adoptListStatus);
	List<AdoptList> searchAllAdoptListCatId(Integer catId,Integer pageLimit,Integer currentPage);
	List<AdoptList> searchAllAdoptListCatNickname(String catNickname,Integer pageLimit,Integer currentPage);
	List<AdoptList> searchAllAdoptListMemberId(Integer memberId,Integer pageLimit,Integer currentPage);
	List<AdoptList> searchAllAdoptListMemberId(Integer memberId);
	List<AdoptList> searchAllAdoptListMemberName(String memberName,Integer pageLimit,Integer currentPage);
}
