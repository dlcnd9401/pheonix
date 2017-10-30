package kr.gudi.phoenix.service;

import java.util.HashMap;

public interface MasterServiceInterface {
	
	public HashMap<String, Object> setClockupData(HashMap<String, Object> param);
	
	public HashMap<String, Object> stocklist();
	public HashMap<String, Object> stocklistselect();
	public HashMap<String, Object> stocklistpaging(HashMap<String, Object> param);
	
	public HashMap<String, Object> userlist();
	public HashMap<String, Object> userlistselect(HashMap<String, Object> param);
	public HashMap<String, Object> userlistpaging(HashMap<String, Object> param);

}
