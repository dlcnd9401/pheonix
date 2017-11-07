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
	public List<HashMap<String,Object>> model(){
	return session.selectList("sql.model");

	}
	@Override
	public List<HashMap<String,Object>> modellist(HashMap<String,Object> param){
	return session.selectList("sql.modellist",param);

	}
	@Override
	public List<HashMap<String,Object>> modeldetail(HashMap<String,Object> param){
	return session.selectList("sql.modeldetail",param);

	}
/*	@Override
	public List<HashMap<String, Object>> getData() {
		return session.selectList("mmodel.model");
	}
	@Override
	public HashMap<String, Object> getlistdata(HashMap<String, Object> param) {
		return session.selectOne("mmodel.getlistdata", param);
	}*/
	@Override
	public int modelbuy(HashMap<String, Object> param) {
		return session.insert("sql.modelbuy",param);
	}
	@Override
	public int modelcart(HashMap<String, Object> param) {
		return session.insert("sql.modelcart",param);
	}
	
	
	
	
}
