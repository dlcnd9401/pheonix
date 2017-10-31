package kr.gudi.phoenix.controller;

import java.io.Console;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	@RequestMapping("/modeltest")
	public ModelAndView modeltest(ModelAndView mav){
		mav.setViewName("test");
		return mav;
	}
	
	@RequestMapping(value="/PopUp", method = RequestMethod.GET)
	public ModelAndView popup(ModelAndView mav, HttpSession session,HttpServletRequest req){
		mav.setViewName("Model/popup");
		return mav;
	}
	/*
	@RequestMapping("/modellist")
	public ModelAndView modellist(ModelAndView mav){
		mav.setViewName("Model/ModelList");
		return mav;
	}*/
	
	/*1023*/
@RequestMapping(value = "/modeldetail", method = RequestMethod.GET)
	public ModelAndView modeldetail(ModelAndView mav,HttpServletRequest req, HttpServletResponse resp, HttpSession session){
	map = new HashMap<String,Object>();
	HashMap<String, Object> param = HttpUtil.getParameterMap(req);
	map.put("code", req.getParameter("code"));
	map = msi.modeldetail(map);
	HashMap<String, HashMap<String, Object>> user = (HashMap<String, HashMap<String, Object>>) session.getAttribute("user");
	mav.addObject("detail", map.get("modeldetail"));
	mav.addObject("UserId", user.get("data").get("UserId"));
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
		HashMap<String, Object> user = (HashMap<String, Object>) session.getAttribute("user");
		map.put("scode", req.getParameter("scode"));
		map = msi.modellist(map);
		mav.addObject("data", map.get("modellist"));
		mav.setViewName("Model/ModelList");
		System.out.println(session.getAttribute("user"));
		return mav;
	}
	
	@RequestMapping("/model")
	public ModelAndView model(ModelAndView mav,HttpServletRequest req, HttpSession session){
		HashMap<String, Object> user = (HashMap<String, Object>) session.getAttribute("user");
		map = new HashMap <String,Object>();
		map.put("path", req.getParameter("path"));
		map.put("sname", req.getParameter("sname"));
		map.put("top", req.getParameter("top"));
		map.put("scode", req.getParameter("scode"));
		map = msi.model(map);
		mav.addObject("model", map.get("model"));
		mav.setViewName("model");
		System.out.println(session.getAttribute("user"));
		return mav;
	}
	
	@RequestMapping("/Modelbuy")
	public ModelAndView modelbuy(ModelAndView mav,HttpServletRequest req, HttpSession session){
		HashMap<String,Object> param = new HashMap<String,Object>();
		HashMap<String, Object> user = (HashMap<String, Object>) session.getAttribute("user");
		param = HttpUtil.getParameterMap(req);
		param= msi.modelbuy(param);
		mav.setViewName("Model/popup");
		System.out.println(session.getAttribute("user"));
		return mav;
	}  

	@RequestMapping("/ModelCart")
	public ModelAndView modelcart(ModelAndView mav,HttpServletRequest req, HttpSession session){
		HashMap<String,Object> param = new HashMap<String,Object>();
		HashMap<String, Object> user = (HashMap<String, Object>) session.getAttribute("user");
		param = HttpUtil.getParameterMap(req);
		param= msi.modelcart(param);
		mav.setViewName("Model/popup");
		System.out.println(session.getAttribute("user"));
		return  mav;
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
	
	/*		map = new HashMap <String,Object>();
	map.put("Code", req.getParameter("Code"));
	map.put("path", req.getParameter("path"));
	map.put("Sname", req.getParameter("Sname"));
	map.put("auth", req.getParameter("auth"));
	map.put("UserId", req.getParameter("UserId"));
	map.put("Price", req.getParameter("Price"));
	map.put("Name",req.getParameter("Name"));
	map = msi.modelcart(map);
	mav.addObject("modelcart", map.get("modelcart"));
	mav.setViewName("ModelCart");
	return mav;*/
	
}
