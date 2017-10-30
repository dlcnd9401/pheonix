package kr.gudi.phoenix.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.gudi.phoenix.dao.MasterDaoInterface;

@Service
public class MasterService implements MasterServiceInterface {

	@Autowired
	MasterDaoInterface mdi;
	public HashMap<String, Object> map;
	
	@Override
	public HashMap<String, Object> setClockupData(HashMap<String, Object> param) {
	    map = new HashMap<String, Object>();
	    map.put("status", mdi.setClockupData(param));
	    return map;
	}

	@Override
	public HashMap<String, Object> stocklist() {
		map = new HashMap<String, Object>();
		map.put("list", mdi.stocklist());
		return map;
	}
	
	@Override
	public HashMap<String, Object> stocklistselect() {
		map = new HashMap<String, Object>();
		map.put("list", mdi.stocklistselect());
		return map;
	}

	@Override
	public HashMap<String, Object> stocklistpaging(HashMap<String, Object> param) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("data", mdi.stocklistpaging(param));
		map.put("totCnt", mdi.stocklisttotcnt());
		return map;
	}

	@Override
	public HashMap<String, Object> userlist() {
		map = new HashMap<String, Object>();
		map.put("list", mdi.userlist());
		return map;
	}
 
	@Override
	public HashMap<String, Object> userlistselect(HashMap<String, Object> param) {
		map = new HashMap<String, Object>();
		map.put("list", mdi.userlistselect(param));
		return map;
	}
	
	@Override
	public HashMap<String, Object> userlistpaging(HashMap<String, Object> param) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("data", mdi.userlistpaging(param));
		map.put("totCnt", mdi.userlisttotcnt());
		return map;
	}

}
