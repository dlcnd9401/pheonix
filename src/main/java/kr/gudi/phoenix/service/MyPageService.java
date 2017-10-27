package kr.gudi.phoenix.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.gudi.phoenix.dao.MyPageDaoInterface;
@Service
public class MyPageService implements MyPageServiceInterface {

	@Autowired
	MyPageDaoInterface mdi;
	
	public HashMap<String, Object> map;

	@Override
	public HashMap<String, Object> paging(HashMap<String, Object> param) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("data", mdi.paging(param));
		map.put("totCnt", mdi.totCnt(param));
		return map;
	}
	@Override
	public HashMap<String, Object> bagdel(HashMap<String, Object> param) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("status", mdi.bagdel(param));
		return map;
	}
	
	@Override
	public HashMap<String, Object> sellpaging(HashMap<String, Object> param) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("data2", mdi.sellpaging(param));
		map.put("totCnt2", mdi.selltotCnt());
		return map;
	}
	@Override
	public HashMap<String, Object> userUpdate(HashMap<String, Object> param) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("state", mdi.userUpdate(param));
		return map;
	}
}
