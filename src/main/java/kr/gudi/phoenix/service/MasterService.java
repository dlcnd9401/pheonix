package kr.gudi.phoenix.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.gudi.phoenix.dao.MasterDaoInterface;
import kr.gudi.util.HttpUtil;

@Service
public class MasterService implements MasterServiceInterface {

	@Autowired
	MasterDaoInterface mdi;
	public HashMap<String, Object> map;
	public HashMap<String, Object> map2;
	public HashMap<String, Object> param;
		
	@Override
	public HashMap<String, Object> setClockupData(HashMap<String, Object> param) {
		map = new HashMap<String, Object>();	   
		System.out.println(param);
	    map.put("status", mdi.setClockupData(param));	 
	    System.out.println("map " + map);
	    return map;
	}
	
	@Override
	   public HashMap<String, Object> fileOutput(MultipartFile[] file, HttpServletRequest req) {
		  map = new HashMap<String, Object>();
          map2 = new HashMap<String, Object>();  
		  param = HttpUtil.getParameterMap(req);	      
	      System.out.println(param);
	      
	      for(int i = 0; i < file.length; i++){
	         String name = file[i].getOriginalFilename();
	         String path2 = "resources/img/";	
	         System.out.println(name);
	         try {
	            byte[] bytes = file[i].getBytes();
	            
	            String path = "";	            
	            // 개발 툴에서만 사용 할것!
	            /*path = "E:/Git/phoenix2/src/main/webapp/" + path2 + name;*/ 	
	            /*path = "C:/Users/GD/git/phoenix/src/main/webapp/" + path2 + name;*/
	            path = req.getSession().getServletContext().getRealPath("/") + path2 +  name;	            
//	            System.out.println("name " + name + " path " + path);	 
	            File f = new File(path);
	            
	            if(f.exists()){
		               f = new File(path);
		               OutputStream out = new FileOutputStream(f);	            
		               out.write(bytes);
		               out.close();	               
//		               path = "";
		               path = path2 + name;		               
		               map.put("path", path);
		               map.put("sname", param.get("sname"));
		               map.put("name", param.get("name"));
		               map.put("mKind", param.get("mKind"));
		               map.put("mshape", param.get("mshape"));
		               map.put("scode", param.get("scode"));
		               map.put("code", param.get("code"));
		               map.put("price", param.get("price"));
		               map.put("introduce", param.get("introduce"));
		               map2 = setClockupData(map);		               
		            }
		            System.out.println("map " + map);
		            System.out.println("map2 " + map2);
		         } catch (IOException e) {
		            e.printStackTrace();
		         }
		      }	      

	      return map2;
	   }
	
	
		
	@Override
	public HashMap<String, Object> stocklistselect() {
		map = new HashMap<String, Object>();
		map.put("list", mdi.stocklistselect());
		return map;
	}

	@Override
	public HashMap<String, Object> stocklistpaging(HashMap<String, Object> param) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("data", mdi.stocklistpaging(param));
		map.put("totCnt", mdi.stocklisttotcnt());
		return map;
	}
	
	@Override
	public HashMap<String, Object> stockupdate(HashMap<String, Object> param) {		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("status", mdi.stockupdate(param));		
		return map;
	}
 
	@Override
	public HashMap<String, Object> userlistselect(HashMap<String, Object> param) {
		map = new HashMap<String, Object>();
		map.put("list", mdi.userlistselect(param));
		return map;
	}
	
	@Override
	public HashMap<String, Object> userlistpaging(HashMap<String, Object> param) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("data", mdi.userlistpaging(param));
		map.put("totCnt", mdi.userlisttotcnt());
		return map;
	}

}
