package kr.gudi.phoenix.service;

import java.util.HashMap;

public interface ModelServiceInterface {
	public HashMap<String, Object> model();
	public HashMap<String, Object> modellist(HashMap<String, Object> param);
	public HashMap<String, Object> modeldetail(HashMap<String, Object> param);
	public HashMap<String, Object> modelbuy(HashMap<String, Object> param);
	public HashMap<String, Object> modelcart(HashMap<String, Object> param);
	public HashMap<String, Object> modelupdate(HashMap<String, Object> param);
}
