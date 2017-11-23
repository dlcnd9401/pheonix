package kr.gudi.phoenix.service;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public interface MasterServiceInterface {
	
	public HashMap<String, Object> setClockupData(HashMap<String, Object> param);	
	public HashMap<String, Object> fileOutput(MultipartFile[] file, HttpServletRequest req);
	public HashMap<String, Object> stocklistselect();
	public HashMap<String, Object> stocklistpaging(HashMap<String, Object> param);
	public HashMap<String, Object> stockupdate(HashMap<String, Object> param);
	public HashMap<String, Object> userlistselect(HashMap<String, Object> param);
	public HashMap<String, Object> userlistpaging(HashMap<String, Object> param);

}
