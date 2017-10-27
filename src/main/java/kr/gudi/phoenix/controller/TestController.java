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

import kr.gudi.phoenix.service.TestServiceInterface;
import kr.gudi.util.HttpUtil;

@Controller
public class TestController {
	
	
	@Autowired
	TestServiceInterface tsi;
	
	@RequestMapping("/test")
	public ModelAndView test(ModelAndView mav){
		mav.setViewName("test");
		mav.addObject("data", tsi.test());
		return mav;
	}
	//로그인
		@RequestMapping(value = "/login", method = RequestMethod.GET)
		public void login(HttpServletRequest req, HttpServletResponse resp, HttpSession session){
			HashMap<String, Object> param = HttpUtil.getParameterMap(req);
			HashMap<String, Object> result = tsi.login(param);
			session.setAttribute("user", result);
			HttpUtil.sendResponceToJson(resp, result);
		}
		
}
