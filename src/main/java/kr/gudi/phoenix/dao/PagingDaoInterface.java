package kr.gudi.phoenix.dao;

import java.util.HashMap;
import java.util.List;

public interface PagingDaoInterface {
	//추상메소드 
	public List<HashMap<String, Object>> select(HashMap<String, Object> param);
	//조회할 페이징의 리스트(select)을 param으로 받아옴 --> 
	public HashMap<String, Object> totCnt();
	//리스트의 총 갯수 
}
