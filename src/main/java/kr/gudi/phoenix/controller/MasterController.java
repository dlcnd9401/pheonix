package kr.gudi.phoenix.controller;

import java.io.File;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import kr.gudi.phoenix.service.MasterServiceInterface;

import kr.gudi.util.HttpUtil;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

@Controller
public class MasterController {

	@Autowired
	MasterServiceInterface msi;	
	
//	화면이동페이지 3개 이미지출력
	//MyPageMaster
		@RequestMapping("/mastermove")
		public ModelAndView MyPageMaster(ModelAndView mav) {
			mav.setViewName("/MasterPage/mastermove");
			return mav;
		}
	
//	재고관리페이지로 이동
	@RequestMapping("/clockmanage")
	public ModelAndView clockmanage(ModelAndView mav){
		mav.setViewName("/MasterPage/clockmanage");
		return mav;
	}	
//	재고골라서리스트 가져오기
	@RequestMapping("/stockselectData")
	public ModelAndView clockmanage2(ModelAndView mav) {
		HashMap<String, Object> sd = new HashMap<String, Object>();
		sd = msi.stocklistselect();		
		return HttpUtil.makeHashToJsonModelAndView(sd);
	}
//	재고리스트 페이징
	@RequestMapping("/stocklistData")
	public ModelAndView clockmanage3(ModelAndView mav, HttpServletRequest req, HttpServletResponse resp) {
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("start", Integer.parseInt(req.getParameter("start")));
		param.put("viewRow", Integer.parseInt(req.getParameter("viewRow")));
		param.put("storeSearchType", req.getParameter("storeSearchType"));
		
		// 디비에서 받아 온 hashmap 데이터를 json으로 변경하여 model 값으로 넣어 준다.
	      JSONObject jsonObject = new JSONObject();
	      jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(msi.stocklistpaging(param)));
	      mav.addObject("message", jsonObject.toString());		
	      mav.setViewName("json");
	      return mav;
	}
	
	//재고수량조절
		@RequestMapping("/stockupdate")
		public void StockUpdate(HttpServletRequest req, HttpServletResponse resp, ModelAndView mav) {
			HashMap<String, Object> param = HttpUtil.getParameterMap(req);
			HttpUtil.sendResponceToJson(resp, msi.stockupdate(param));
		}
		
//	회원관리페이지로 이동
	@RequestMapping("/usermanage")
	public ModelAndView usermanage(ModelAndView mav){
		mav.setViewName("/MasterPage/usermanage");
		return mav;
	}
//	유저골라서리스트 가져오기
	@RequestMapping("/userselectData")
	public void usermanage2(HttpServletResponse response, HttpServletRequest req) {
		HashMap<String, Object> ud = HttpUtil.getParameterMap(req);
		ud = msi.userlistselect(ud);
		HttpUtil.sendResponceToJson(response, ud);
	}
//	유저리스트 페이징
	@RequestMapping("/userlistData")
	public ModelAndView usermanage3(ModelAndView mav, HttpServletRequest req) {
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("start", Integer.parseInt(req.getParameter("start")));
		param.put("viewRow", Integer.parseInt(req.getParameter("viewRow")));		
		// 디비에서 받아 온 hashmap 데이터를 json으로 변경하여 model 값으로 넣어 준다.
	      JSONObject jsonObject = new JSONObject();
	      jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(msi.userlistpaging(param)));
	      mav.addObject("message", jsonObject.toString());		
	      mav.setViewName("json");
	      return mav;
	}	
	
//	상품등록페이지 이동
	@RequestMapping("/clockupdate")
	public ModelAndView clockupdate(ModelAndView mav){
		mav.setViewName("/MasterPage/clockupdate");
		return mav;
	}	
//	디비에 상품내용 등록
	@RequestMapping(value="/clockupData", method=RequestMethod.POST)
	   public ModelAndView clockupdate1(ModelAndView mav, HttpServletRequest req, @RequestParam("cdjyfilename") MultipartFile[] file){	
	      HashMap<String, Object> map = new HashMap<String, Object>();
			map = msi.fileOutput(file, req);
			mav.addObject("data", map);
			mav.setViewName("clockupdate");		
			System.out.println(map);
			return mav;
	   }


	 
	
}




	



	
	

