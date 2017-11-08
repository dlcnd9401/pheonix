package kr.gudi.phoenix.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.gudi.phoenix.dao.SignupDaoInterface;

	@Service
	public class SignupService implements SignupServiceInterface {
	
	   @Autowired
	   SignupDaoInterface tdi;	   
	   public HashMap<String, Object> map;
	   
	 @Override
	 public HashMap<String, Object> getData(){
	    map = new HashMap<String, Object>();
	    map.put("list", tdi.getData());
	    return map;
	 }
	
	 // 로그인
	 @Override
	   public HashMap<String, Object> getLoginData(HashMap<String, Object> param) {
	      map = new HashMap<String, Object>();	     
	      map.put("data", tdi.getLoginData(param));	      
	      return map;
	   }
	 
	 
	 // 회원가입아이디 중복확인
	 @Override
	   public HashMap<String, Object> checkid(HashMap<String, Object> param){
	      map = new HashMap<String, Object>();
	      map.put("checkid", tdi.checkid(param));
	      return map;
	   }
	 
	// 회원가입
	@Override
	public HashMap<String, Object> setSignupData(HashMap<String, Object> param) {
	    map = new HashMap<String, Object>();
	    map.put("status", tdi.setSignupData(param));
	    return map;
	}
   
}
