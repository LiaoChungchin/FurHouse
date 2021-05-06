package org.iiiEDU.model;

import java.util.List;

public interface CatDAO {
	List<Cat> selectAllCat();
	Cat selectOneCat(Integer id);
	Integer insertCat(Cat cat);
	Integer updateCat(Cat cat);
	Integer deleteCat(Integer id,List<AdoptList> adoptLists);
	List<Cat> selectSomeCatNR();
}
