package kr.gudi.phoenix.dao;

import java.util.HashMap;
import java.util.List;

public interface SignupDaoInterface {
	   public List<HashMap<String, Object>> getData();
	   public HashMap<String, Object> getLoginData(HashMap<String, Object> param); //로그인
	   public int setSignupData(HashMap<String, Object> param); // 회원가입 아이디중복체크
	   public HashMap<String, Object> checkid(HashMap<String, Object> param);// 회원가입 아이디중복체크
	}