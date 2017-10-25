package kr.gudi.phoenix.dao;

import java.util.HashMap;
import java.util.List;

public interface SignupDaoInterface {
	   public List<HashMap<String, Object>> getData();
	   public HashMap<String, Object> getLoginData(HashMap<String, Object> param);
	   public int setSignupData(HashMap<String, Object> param); //값을 넣는거니까 ->set
	   public HashMap<String, Object> checkid(HashMap<String, Object> param);
	}