package org.iiiEDU.model;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
@Service("catServiceimpl")
@Transactional
public class CatServiceimpl implements CatService {
	@Autowired @Qualifier("catimplDAO")
	private CatDAO catimplDAO;
	
	@Override
	public List<Cat> selectAllCat() {
		return catimplDAO.selectAllCat();
	}

	@Override
	public Cat selectOneCat(Integer id) {
		return catimplDAO.selectOneCat(id);
	}

	@Override
	public Integer insertCat(Cat cat) {
		return catimplDAO.insertCat(cat);
	}

	@Override
	public Integer updateCat(Cat cat) {
		return catimplDAO.updateCat(cat);
	}

	@Override
	public Integer deleteCat(Integer id) {
		return catimplDAO.deleteCat(id);
	}
	
	@Override
	public List<Cat> selectSomeCatNR(){
		return catimplDAO.selectSomeCatNR();
	}

	@Override
	public List<Cat> selectPopularCat(){
		return catimplDAO.selectPopularCat();
	}
}
