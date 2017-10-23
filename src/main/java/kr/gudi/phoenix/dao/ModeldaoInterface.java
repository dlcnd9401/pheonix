package kr.gudi.phoenix.dao;

import java.util.HashMap;
import java.util.List;

public interface ModeldaoInterface {
	
	/*public HashMap<String, Object> model();*/
	public List<HashMap<String, Object>> model(HashMap<String, Object> param);

}
