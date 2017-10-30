package kr.gudi.phoenix.dao;

import java.util.HashMap;
import java.util.List;

public interface MyPageDaoInterface {
	public List<HashMap<String, Object>> paging(HashMap<String, Object> param);
	public List<HashMap<String, Object>> sellpaging(HashMap<String, Object> param);
	public HashMap<String, Object> totCnt(HashMap<String, Object> param);
	public HashMap<String, Object> selltotCnt();
	public int bagdel(HashMap<String, Object> param);
	public List<HashMap<String,Object>> myLog(HashMap<String, Object> param);
	public int userUpdate(HashMap<String, Object> param);
	public int sellUpdate(HashMap<String, Object> param);
}