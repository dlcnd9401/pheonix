package kr.gudi.phoenix.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class QuestionDao implements QuestionDaoInterface {

	@Resource(name="sqlSession")
	SqlSession session;
	
	@Override
	public List<HashMap<String, Object>> getData() {
		return session.selectList("question.qestionListData");
	}
	
	@Override
	public List<HashMap<String, Object>> getSearchData(HashMap<String, Object> param) {
		return session.selectList("question.questionSearchData", param);
	}
	
	

	@Override
	public HashMap<String, Object> getDetailData(HashMap<String, Object> param) {
		return session.selectOne("question.questionDetailData", param);
	}
	
	@Override
	public int setAnswerData(HashMap<String, Object> param) {
		return session.update("question.questionAnswerData", param);
	}
	
	@Override
	public int setWriteData(HashMap<String, Object> param) {
		return session.insert("question.questionWriteData", param); //값 넣는 화면구현 --> insert
	}
	
}