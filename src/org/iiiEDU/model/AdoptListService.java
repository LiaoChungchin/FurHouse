package org.iiiEDU.model;

import java.util.List;

public interface AdoptListService {
	Integer insertAdoptList(AdoptList adoptList);
	Integer updateAdoptList(AdoptList adoptList);
	Integer deleteAdoptList(Integer id);
	List<AdoptList> selectAllAdoptList();
	AdoptList selectOneAdoptList(Integer id);
	List<AdoptList> searchAllAdoptListStatus(String adoptListStatus);
	List<AdoptList> searchAllAdoptListCatId(Integer catId);
	List<AdoptList> searchAllAdoptListCatNickname(String catNickname);
	List<AdoptList> searchAllAdoptListMemberId(Integer memberId);
	List<AdoptList> searchAllAdoptListMemberName(String memberName);
}
