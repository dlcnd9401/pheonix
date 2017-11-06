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

@Service
public class MasterService implements MasterServiceInterface {

	@Autowired
	MasterDaoInterface mdi;
	public HashMap<String, Object> map;
	
	@Override
	public HashMap<String, Integer> setClockupData(HashMap<String, Object> param) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
	    //HashMap<String, Integer> map = new HashMap<String, Integer>();
	    map.put("status", mdi.setClockupData(param));
	    return map;
	}
	@Override
	   public HashMap<String, Integer> fileOutput(MultipartFile[] file, HttpServletRequest req) {
	      HashMap<String, Integer> map2 = new HashMap<String, Integer>();
	      map = new HashMap<String, Object>();
	      
	      for(int i = 0; i < file.length; i++){
	         String name = file[i].getOriginalFilename();
	         String path2 = "resources/img/";
	         System.out.println(path2 + name);
	         try {
	            byte[] bytes = file[i].getBytes();
	            
	            String path = "";
	            // 개발 툴에서만 사용 할것!
//	            path = "E:/GIT/JDC/src/main/webapp/" + path2;
	            path = req.getSession().getServletContext().getRealPath("/") + path2;
	            System.out.println(path);
	            
	            File f = new File(path);
	            
	            if(f.exists()){
	               f = new File(path + name);
	               OutputStream out = new FileOutputStream(f);
	               out.write(bytes);
	               out.close();
	               
	               HashMap<String, Object> map = new HashMap<String, Object>();
	               map.put("path", path2);
	               map.put("name", name);	               
	               System.out.println("service map : "+ map);
	               map2 = setClockupData(map);
	            }
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
//		System.out.println("service param : "+ param);
		map.put("data", mdi.stocklistpaging(param));
//		System.out.println();
		map.put("totCnt", mdi.stocklisttotcnt());
		return map;
	}
	
	@Override
	public HashMap<String, Object> stockupdate(HashMap<String, Object> param) {
		System.out.println("service param : "+ param);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("status", mdi.stockupdate(param));
		System.out.println("service : "+ map);
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
