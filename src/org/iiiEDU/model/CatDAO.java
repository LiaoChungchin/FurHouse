package org.iiiEDU.model;

import java.util.List;

public interface CatDAO {
	public List<Cat> selectAllCat();
	public Cat selectOneCat(Integer id);
	public Integer insertCat(Cat cat);
	public Integer updateCat(Cat cat);
	public Integer deleteCat(Integer id);
}
