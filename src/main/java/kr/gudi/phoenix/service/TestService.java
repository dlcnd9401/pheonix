package kr.gudi.phoenix.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.gudi.phoenix.dao.TestdaoInterface;
//test
@Service
public class TestService implements TestServiceInterface {

	@Autowired
	TestdaoInterface tdi;
	
	public HashMap<String, Object> map;
	
	@Override
	public HashMap<String, Object> test() {
		map = new HashMap<String, Object>();
		map.put("test", tdi.test());
		return map;
	}

}
