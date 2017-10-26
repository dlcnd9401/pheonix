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

import kr.gudi.phoenix.service.SignupServiceInterface;
import kr.gudi.phoenix.dao.SignupDaoInterface;
import kr.gudi.util.HttpUtil;

@Controller
public class SignupController {
	
	
   @RequestMapping("/Signup") // 회원가입페이지
   public ModelAndView signup(ModelAndView mav){
      mav.setViewName("Signup");
      return mav;
   }
   
   @Autowired
   SignupServiceInterface tsi;
   
   @RequestMapping("/SignupData")
   public ModelAndView signupData(ModelAndView mav, HttpServletRequest req){ 
      HashMap<String, Object> param = HttpUtil.getParameterMap(req);
      System.out.println(param);
      param = tsi.setSignupData(param);
      System.out.println(param);
      return HttpUtil.makeHashToJsonModelAndView(param);
   }
   
   
   @RequestMapping(value="/checkid", method = RequestMethod.POST)
   public void checkid(HttpServletRequest req, HttpServletResponse resp){
      HashMap<String, Object> checkid = HttpUtil.getParameterMap(req);
      System.out.println(checkid);
      HashMap<String, Object> checkiddata = (HashMap<String, Object>) tsi.checkid(checkid);
      HttpUtil.sendResponceToJson(resp, checkiddata);
   }
   
   //로그인
   @RequestMapping(value = "/LoginData", method = RequestMethod.GET)
   public void loginData(HttpServletRequest req, HttpServletResponse resp, HttpSession session){
	   HashMap<String, Object> param = HttpUtil.getParameterMap(req);
	   HashMap<String, Object> result = tsi.getLoginData(param);
	   session.setAttribute("user", result);
	   HttpUtil.sendResponceToJson(resp, result);
   }
   

}