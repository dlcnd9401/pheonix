package kr.gudi.phoenix.dao;

import java.util.HashMap;
import java.util.List;

public interface ModeldaoInterface {	

	public List<HashMap<String, Object>> model();
	public List<HashMap<String, Object>> modellist(HashMap<String, Object> param);
	public List<HashMap<String, Object>> modeldetail(HashMap<String, Object> param);
	public int modelbuy(HashMap<String, Object> param);
	public int modelcart(HashMap<String, Object> param);
}
