package kr.gudi.phoenix.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class Modeldao implements ModeldaoInterface {
	
	@Resource(name="sqlSession")
	SqlSession session;
	
	/*@Override
	public HashMap<String, Object> model() {
		return session.selectOne("sql.model");

	}*/
	@Override
	public List<HashMap<String,Object>> model(HashMap<String,Object> param){
	return session.selectList("sql.model",param);

	}
}
