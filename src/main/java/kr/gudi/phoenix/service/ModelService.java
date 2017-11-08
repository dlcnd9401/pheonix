package kr.gudi.phoenix.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.gudi.phoenix.dao.ModeldaoInterface;

@Service
public class ModelService implements ModelServiceInterface {
	
	
	@Autowired
	ModeldaoInterface mdi;
	
	public HashMap<String, Object> map;

	@Override
	public HashMap<String, Object> model() {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("model", mdi.model());
		return map;
	}
	@Override
	public HashMap<String, Object> modellist(HashMap<String, Object> param) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("modellist", mdi.modellist(param));
		return map;
	}
	@Override
	public HashMap<String, Object> modeldetail(HashMap<String, Object> param) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("modeldetail", mdi.modeldetail(param));
		return map;
	}

	@Override
	public HashMap<String, Object> modelbuy(HashMap<String, Object> param) {
		map = new HashMap<String,Object>();
		map.put("buylist",mdi.modelbuy(param));
		return map;
	}
	@Override
	public HashMap<String, Object> modelcart(HashMap<String, Object> param) {
		map = new HashMap<String, Object>();
		map.put("modelcart", mdi.modelcart(param));
		return map;
	}
	
}
