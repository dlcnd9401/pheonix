package kr.gudi.phoenix.dao;

import java.util.HashMap;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
//test
@Repository
public class Testdao implements TestdaoInterface {
	@Resource(name="sqlSession")
	SqlSession session;
	
	@Override
	public HashMap<String, Object> test() {
		return session.selectOne("sql.test");
	}
	@Override
	public HashMap<String, Object> login(HashMap<String, Object> param) {
		return session.selectOne("sql.login", param);
	}
}
