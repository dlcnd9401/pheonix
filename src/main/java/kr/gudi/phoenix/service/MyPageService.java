package kr.gudi.phoenix.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.gudi.phoenix.dao.MyPageDaoInterface;
@Service
public class MyPageService implements MyPageServiceInterface {

	@Autowired
	MyPageDaoInterface mdi;
	
	public HashMap<String, Object> map;
	
	@Override
	public HashMap<String, Object> cart() {
		  map = new HashMap<String, Object>();
	      map.put("list", mdi.cart());
	      return map;
	}

	@Override
	public HashMap<String, Object> paging(HashMap<String, Object> param) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("data", mdi.paging(param));
		map.put("totCnt", mdi.totCnt());
		return map;
	}

	@Override
	public HashMap<String, Object> bagdel(HashMap<String, Object> param) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("status", mdi.bagdel(param));
		return map;
	}
}
