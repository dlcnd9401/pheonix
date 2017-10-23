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
		return session.selectList("team.getData");
	}

	@Override
	public HashMap<String, Object> getDetailData(HashMap<String, Object> param) {
		return session.selectOne("team.getDetailData", param);
	}
	
}
