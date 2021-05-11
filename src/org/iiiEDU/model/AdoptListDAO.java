package org.iiiEDU.model;

import java.sql.Timestamp;
import java.util.List;


public interface AdoptListDAO {
	Integer getAdoptListTotal();
	Integer insertAdoptList(AdoptList adoptList);
	Integer updateAdoptList(AdoptList adoptList);
	Integer deleteAdoptList(Integer id);
	List<AdoptList> selectAllAdoptList();
	List<AdoptList> selectAllAdoptListPage(Integer pageLimit,Integer currentPage);
	AdoptList selectOneAdoptList(Integer id);
	List<AdoptList> selectSomeAdoptListForvisitTime(Timestamp visitTime);
	List<AdoptList> searchAllAdoptListVisitTime(String visitTime);
	List<AdoptList> searchAllAdoptListVisitTime(String visitTime,Integer catId);
	List<AdoptList> searchAllAdoptListStatus(String adoptListStatus);
	List<AdoptList> searchAllAdoptListCatId(Integer catId,Integer pageLimit,Integer currentPage);
	List<AdoptList> searchAllAdoptListCatId(Integer catId);
	List<AdoptList> searchAllAdoptListCatNickname(String catNickname,Integer pageLimit,Integer currentPage);
	List<AdoptList> searchAllAdoptListMemberId(Integer memberId,Integer pageLimit,Integer currentPage);
	List<AdoptList> searchAllAdoptListMemberIdByAsc(Integer memberId,Integer pageLimit,Integer currentPage);
	List<AdoptList> searchAllAdoptListMemberIdBeforeToday(Integer memberId,Timestamp today);
	List<AdoptList> searchAllAdoptListMemberId(Integer memberId,Integer fk_adoptListStatusId);
	List<AdoptList> searchAllAdoptListMemberName(String memberName,Integer pageLimit,Integer currentPage);
}
