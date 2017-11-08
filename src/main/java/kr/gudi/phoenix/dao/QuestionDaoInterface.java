package kr.gudi.phoenix.dao;

import java.util.HashMap;
import java.util.List;

public interface QuestionDaoInterface {
	public List<HashMap<String, Object>> getData();
	public List<HashMap<String, Object>> getSearchData(HashMap<String, Object> param);
	public HashMap<String, Object> getDetailData(HashMap<String, Object> param);
	public int setAnswerData(HashMap<String, Object> param);
	public int setWriteData(HashMap<String, Object> param); //값을 넣는거니까 ->set 	
}