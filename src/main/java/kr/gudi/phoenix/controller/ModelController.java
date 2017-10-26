package kr.gudi.phoenix.controller;

import java.io.Console;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.gudi.phoenix.service.ModelServiceInterface;
import kr.gudi.util.HttpUtil;


@Controller
public class ModelController {
	
	@Autowired
	ModelServiceInterface msi;
		
	public HashMap<String, Object> map;
	
/*	@RequestMapping("/model")
	public ModelAndView model(ModelAndView mav){
		mav.setViewName("model");
		mav.addObject("data", msi.model());
		return mav;
		
	}*/
	
/*	@RequestMapping("/model")
	public ModelAndView model(ModelAndView mav){
		mav.setViewName("model");
		return mav;
	}
	
	@RequestMapping("/modellist")
	public ModelAndView modellist(ModelAndView mav){
		mav.setViewName("Model/ModelList");
		return mav;
	}*/
	

	/*1023*/
@RequestMapping("/modeldetail")
	public ModelAndView modeldetail(ModelAndView mav,HttpServletRequest req, HttpSession session){
	map = new HashMap<String,Object>();
	map.put("code", req.getParameter("code"));
	map = msi.modeldetail(map);
	mav.addObject("detail", map.get("modeldetail"));
	mav.setViewName("Model/Modeldetail");
	return mav;
	}

/*	@RequestMapping("/modeldata")
	public ModelAndView modeldata(ModelAndView mav,HttpServletRequest req, HttpSession session){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map = msi.getData();
		return HttpUtil.makeHashToJsonModelAndView(map);
	}*/


	@RequestMapping("/modellist")
	public ModelAndView modellist(ModelAndView mav,HttpServletRequest req, HttpSession session){
		map = new HashMap<String,Object>();
		map.put("scode", req.getParameter("scode"));
		map = msi.modellist(map);
		mav.addObject("data", map.get("modellist"));
		mav.setViewName("Model/ModelList");
		System.out.println(session.getAttribute("user"));
		return mav;
	}
	
	@RequestMapping("/model")
	public ModelAndView model(ModelAndView mav,HttpServletRequest req, HttpSession session){
		map = new HashMap <String,Object>();
		map.put("path", req.getParameter("path"));
		map.put("sname", req.getParameter("sname"));
		map.put("top", req.getParameter("top"));
		map.put("scode", req.getParameter("scode"));
		map = msi.model(map);
		mav.addObject("model", map.get("model"));
		mav.setViewName("model");
		return mav;
	}
	
/*	@RequestMapping("/modeldata") //List 보여주기 
	public ModelAndView masterPageData(ModelAndView mav){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map = msi.getData();
		map = tsi.getData();
		return HttpUtil.makeHashToJsonModelAndView(map);
	}*/
	
/*	@RequestMapping("/model")
	public ModelAndView masterPage1(ModelAndView mav){
		mav.setViewName("model");
		return mav;
	}
	
	@RequestMapping("/modellist")
	public ModelAndView modellist(ModelAndView mav){
		mav.setViewName("Model/ModelList");
		return mav;
	}
	
	public ModelAndView modeldata(ModelAndView mav){
		HashMap<String,Object> map = new HashMap<String,Object>();
		map = msi.getdata();
		return HttpUtil.makeHashToJsonModelAndView(map);
	}
	*/
	
}
