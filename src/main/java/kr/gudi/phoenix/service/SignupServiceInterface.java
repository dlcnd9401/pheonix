package kr.gudi.phoenix.service;

import java.util.HashMap;

public interface SignupServiceInterface {
    public HashMap<String, Object> getData();
    public HashMap<String, Object> getLoginData(HashMap<String, Object> param); // 로그인
    public HashMap<String, Object> setSignupData(HashMap<String, Object> param); // 회원가입
    public HashMap<String, Object> checkid(HashMap<String, Object> param); // 회원가입 아이디 중복체크    
 }