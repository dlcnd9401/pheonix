package kr.gudi.phoenix.dao;

import java.util.HashMap;
import java.util.List;

public interface MasterDaoInterface {
	
	public int setClockupData(HashMap<String, Object> param); //값을 넣는거니까 ->set 	
		
	public List<HashMap<String, Object>> stocklistselect();
	public List<HashMap<String, Object>> stocklistpaging(HashMap<String, Object> param);
	public HashMap<String, Object> stocklisttotcnt();
	public int stockupdate(HashMap<String, Object> param);
	public List<HashMap<String, Object>> userlistselect(HashMap<String, Object> param);
	public List<HashMap<String, Object>> userlistpaging(HashMap<String, Object> param);
	public HashMap<String, Object> userlisttotcnt();
}
