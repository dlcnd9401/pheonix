package kr.gudi.phoenix.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.gudi.phoenix.dao.ModeldaoInterface;

@Service
public class ModelService implements ModelServiceInterface {
	
	
	@Autowired
	ModeldaoInterface mdi;
	
	/*public HashMap<String, Object> map;*/

	
	@Override
	public HashMap<String, Object> model(HashMap<String, Object> param) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("model", mdi.model(param));
		return map;
	}
}
