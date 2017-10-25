package kr.gudi.phoenix.service;

import java.util.HashMap;

public interface SignupServiceInterface {
    public HashMap<String, Object> getData();
    public HashMap<String, Object> getLoginData(HashMap<String, Object> param);
    public HashMap<String, Object> setSignupData(HashMap<String, Object> param);
    public HashMap<String, Object> checkid(HashMap<String, Object> param);
    
 }