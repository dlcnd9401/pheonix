package kr.gudi.phoenix.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MasterDao implements MasterDaoInterface {
	
	@Resource(name="sqlSession")
	SqlSession session;
	
	@Override
	public int setClockupData(HashMap<String, Object> param) {		
		return session.insert("master.clockinsert", param);
	}
	
	@Override
	public List<HashMap<String, Object>> userlist() {		
		return session.selectList("master.userlist");
	}
	
	@Override
	public List<HashMap<String, Object>> userlistselect(HashMap<String, Object> param) {		
		return session.selectList("master.userlistselect", param);
	}
	
	@Override
	public List<HashMap<String, Object>> userlistpaging(HashMap<String, Object> param) {
		System.out.println(param);
		return session.selectList("master.userlistpaging", param);
	}
	
	@Override
	public HashMap<String, Object> userlisttotcnt() {		
		return session.selectOne("master.userlisttotcnt");
	}
	
	@Override
	public List<HashMap<String, Object>> stocklist() {		
		return session.selectList("master.stocklist");
	}
	
	@Override
	public List<HashMap<String, Object>> stocklistselect() {		
		return session.selectList("master.stocklistselect");
	}

	@Override
	public List<HashMap<String, Object>> stocklistpaging(HashMap<String, Object> param) {
		System.out.println(param);
		return session.selectList("master.stocklistpaging", param);
	}
	
	@Override
	public HashMap<String, Object> stocklisttotcnt() {		
		return session.selectOne("master.stocklisttotcnt");
	}

	

}
