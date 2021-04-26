package org.iiiEDU.controller;

import java.util.List;

import org.iiiEDU.model.Map;
import org.iiiEDU.model.MapService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MapController {

	@Autowired
	@Qualifier("mapService")
	private MapService mapService;
	
	@GetMapping("/AllMap")
	public String AllMap(){
		return "page-map.jsp";
	}
	
	@GetMapping("/selectAllMap")
	@ResponseBody
	public List<Map> selectAllMap(){
		
		List<Map> maps = mapService.selectAllMap();
		
		return maps;
	}
	
	@GetMapping("/selectOneMap/{mapId}")
	@ResponseBody
	public Map selectOneMap(@PathVariable("mapId") Integer mapId){
		
		Map map = mapService.selectOneMapById(mapId);
		
		return map;
	}
	
	@GetMapping("/selectSomeMapByRegion/{myRegion}")
	@ResponseBody
	public List<Map> selectSomeMapByRegion(@PathVariable("myRegion") String region){
		
		List<Map> maps = mapService.selectSomeMapByRegion(region);
		
		if(maps.isEmpty()) {
			return null;
		}
		
		return maps; 
	}
	
	@GetMapping("/selectSomeMapBystoreName/{myStoreName}")
	@ResponseBody
	public List<Map> selectSomeMapBystoreName(@PathVariable("myStoreName") String storeName){
		
		List<Map> maps = mapService.selectSomeMapBystoreName(storeName);
		
		if(maps.isEmpty()) {
			return null;
		}
		
		return maps; 
	}
	
}
