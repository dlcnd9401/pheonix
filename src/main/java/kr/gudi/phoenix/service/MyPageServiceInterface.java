package kr.gudi.phoenix.service;

import java.util.HashMap;


public interface MyPageServiceInterface {
	public HashMap<String, Object> cart();
	public HashMap<String, Object> paging(HashMap<String, Object> param);
	public HashMap<String, Object> bagdel(HashMap<String, Object> param);
}
