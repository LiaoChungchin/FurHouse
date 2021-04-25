package org.iiiEDU.model;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("mapService")
@Transactional
public class MapService {

	@Autowired
	@Qualifier("mapDAO")
	private MapDAO mapDAO;
	
	public List<Map> selectAllMap(){
		return mapDAO.selectAllMap();
	}
	
	public Map selectOneMapById(Integer id) {
		return mapDAO.selectOneMapById(id);
	}

	public List<Map> selectSomeMapByRegion(String region){
		return mapDAO.selectSomeMapByRegion(region);
	}
}
