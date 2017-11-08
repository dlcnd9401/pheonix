package kr.gudi.phoenix.controller;

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
	
	@RequestMapping("/model")
	public ModelAndView model(ModelAndView mav){
		mav.setViewName("model");
		HashMap<String, Object> map = msi.model();
		mav.addObject("model", map.get("model"));
		return mav;
	}
	
	@RequestMapping("/mainsec")
	public ModelAndView modeltest(ModelAndView mav){
		mav.setViewName("main");
		return mav;
	}
	
	@RequestMapping(value="/alert")
	public ModelAndView alert(ModelAndView mav){
		return mav;
	}
	
	@RequestMapping(value = "/PopUp")
	public ModelAndView popup(ModelAndView mav, HttpSession session){
		HashMap<String, HashMap<String, Object>> user = (HashMap<String, HashMap<String, Object>>) session.getAttribute("user");
		return mav;
	}

	/*1023*/
@RequestMapping(value = "/modeldetail", method = RequestMethod.GET)
	public ModelAndView modeldetail(ModelAndView mav,HttpServletRequest req, HttpServletResponse resp, HttpSession session){
	HashMap<String, HashMap<String, Object>> user = (HashMap<String, HashMap<String, Object>>) session.getAttribute("user");
	if(user == null){
		mav.setViewName("redirect:/alert");
		return mav;
	}else{
		map = new HashMap<String,Object>();
		HashMap<String, Object> param = HttpUtil.getParameterMap(req);
		map.put("code", req.getParameter("code"));
		map = msi.modeldetail(map);
		mav.addObject("detail", map.get("modeldetail"));
		mav.addObject("UserId", user.get("data").get("UserId"));
		mav.addObject("UserPost", user.get("data").get("UserPost"));		
		mav.setViewName("Model/Modeldetail");
		return mav;
	}	
	}



	@RequestMapping("/modellist")
	public ModelAndView modellist(ModelAndView mav,HttpServletRequest req, HttpSession session){
		map = new HashMap<String,Object>();
		HashMap<String, HashMap<String, Object>> user = (HashMap<String, HashMap<String, Object>>) session.getAttribute("user");
		if(user == null){ 
			mav.setViewName("redirect:/alert");
			return mav;
		}else{
		/*HashMap<String, Object> user = (HashMap<String, Object>) session.getAttribute("user");*/
		map.put("scode", req.getParameter("scode"));
		map = msi.modellist(map);
		mav.addObject("data", map.get("modellist"));
		if(user != null) {
			mav.addObject("UserId", user.get("data").get("UserId"));
			mav.setViewName("Model/ModelList");			
			return mav;
		}else{
			mav.setViewName("Model/ModelList");
			return mav;
			}
		}
	}
	
	@RequestMapping("/Modelbuy")
	public ModelAndView modelbuy(ModelAndView mav,HttpServletRequest req, HttpSession session){
		HashMap<String,Object> param = new HashMap<String,Object>();
		HashMap<String, Object> user = (HashMap<String, Object>) session.getAttribute("user");
		param = HttpUtil.getParameterMap(req);
		param= msi.modelbuy(param);
		mav.setViewName("Model/popup");		
		return mav;
	}  

	@RequestMapping("/ModelCart")
	public ModelAndView modelcart(ModelAndView mav,HttpServletRequest req, HttpSession session){
		HashMap<String,Object> param = new HashMap<String,Object>();
		param = HttpUtil.getParameterMap(req);
		param= msi.modelcart(param);
		mav.setViewName("Model/popup");
		return  mav;
	}
	
}
