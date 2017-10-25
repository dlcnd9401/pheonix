package kr.gudi.phoenix.dao;

import java.util.HashMap;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
@Repository
public class MyPageDao implements MyPageDaoInterface {
	@Resource(name="sqlSession")
	SqlSession session;


	@Override
	public List<HashMap<String, Object>> paging(HashMap<String, Object> param) {
		return session.selectList("mypage.paging", param);
	}

	@Override
	public HashMap<String, Object> totCnt() {
		return session.selectOne("mypage.totCnt");
	}

	@Override
	public int bagdel(HashMap<String, Object> param) {
		return session.update("mypage.del", param);
	}

	@Override
	public List<HashMap<String, Object>> sellpaging(HashMap<String, Object> param) {
		return session.selectList("mypage.sellpaging", param);
	}

	@Override
	public HashMap<String, Object> selltotCnt() {
		return session.selectOne("mypage.selltotCnt");
	}
	
}
