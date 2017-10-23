package kr.gudi.phoenix.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.gudi.phoenix.service.ModelServiceInterface;


@Controller
public class ModelController {
	
	@Autowired
	ModelServiceInterface msi;
		
	public HashMap<String, Object> map;
	
	/*@RequestMapping("/model")
	public ModelAndView model(ModelAndView mav){
		mav.setViewName("model");
		mav.addObject("data", msi.model());
		return mav;
		
	}*/
/*	@RequestMapping("/modeldetail")
	public String modeldetail(){
		return "Model/Modeldetail";
	}
	*/
	@RequestMapping("/modellist")
	public String modelList(){
		return "Model/modelList";
	}
	@RequestMapping("/model")
	public ModelAndView model(ModelAndView mav,HttpServletRequest req, HttpSession session){
		map = new HashMap <String,Object>();
		map.put("path", req.getParameter("path"));
		map.put("sname", req.getParameter("sname"));
		map = msi.model(map);
		mav.addObject("data", map.get("model"));
		mav.setViewName("model");
		return mav;
	}
	
	
}
