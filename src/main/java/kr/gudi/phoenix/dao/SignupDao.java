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
      return session.selectList("login.getData");
   }
   
   // 회원가입 아이디 중복체크
   @Override
   public HashMap<String, Object> checkid(HashMap<String, Object> param) {
      return session.selectOne("login.checkid", param);
   }
   
   // 로그인
   @Override
   public HashMap<String, Object> getLoginData(HashMap<String, Object> param) {
      return session.selectOne("login.getLoginData", param); //HashMap 형식으로 row하나만 가져온다  --> selectOne
      //selectOne은 데이터 하나 
   }
   
   // 회원가입
   @Override
   public int setSignupData(HashMap<String, Object> param) {	  
      return session.insert("login.getSignupData", param); //값 넣는 화면구현 --> insert
   }
   
}