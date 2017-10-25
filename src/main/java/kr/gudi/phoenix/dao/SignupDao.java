package kr.gudi.phoenix.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class SignupDao implements SignupDaoInterface {

   @Resource(name="sqlSession")
   SqlSession session;
   
   @Override
   public List<HashMap<String, Object>> getData() {
      return session.selectList("sjsj.getData");
   }
   
   @Override
   public HashMap<String, Object> getLoginData(HashMap<String, Object> param) {
      return session.selectOne("sjsj.getLoginData", param); //HashMap 형식으로 row하나만 가져온다  --> selectOne
      //selectOne은 데이터 하나 
   }
   
   @Override
   public int setSignupData(HashMap<String, Object> param) {
      return session.insert("sjsj.getSignupData", param); //값 넣는 화면구현 --> insert
   }
   
}