package kr.gudi.phoenix.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.gudi.phoenix.dao.QuestionDaoInterface;

@Service
public class QuestionService implements QuestionServiceInterface {

   @Autowired
   QuestionDaoInterface tdi;
   
   public HashMap<String, Object> map;
   
 @Override
 public HashMap<String, Object> getData(){
	 map = new HashMap<String, Object>();
	 map.put("list", tdi.getData());
	 return map;
 }

   @Override
   public HashMap<String, Object> getDetailData(HashMap<String, Object> param) {
      map = new HashMap<String, Object>();
      map.put("data", tdi.getDetailData(param));
      return map;
   }
   
   @Override
   public HashMap<String, Object> setWriteData(HashMap<String, Object> param) {
   	map = new HashMap<String, Object>();
       map.put("status", tdi.setWriteData(param)); //상태값 ㄹㅇㄴㄹㄹㅇㄴㅇ
       return map;
   }

}dsfdsfdsfdㅇㅇ