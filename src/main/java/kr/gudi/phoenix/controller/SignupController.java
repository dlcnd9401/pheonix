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
      HashMap<String, Object> param = new HashMap<String, Object>();
      param = HttpUtil.getParameterMap(req);
      param = tsi.setSignupData(param);
      return HttpUtil.makeHashToJsonModelAndView(param);
   }
   
   @RequestMapping(value="/LoginData", method=RequestMethod.POST)
   public ModelAndView loginData(ModelAndView mav, HttpServletRequest req, HttpSession session){
		 String id = req.getParameter("id");
	     String pwd = req.getParameter("pw");
	     HashMap<String, Object> loginData = new HashMap<String, Object>();
	     loginData.put("id", id);
	     loginData.put("pw", pwd);
	     System.out.println(loginData);
	     HashMap<String, Object> Logindata = (HashMap<String, Object>) tsi.getLoginData(loginData);
	     session.setAttribute("id", Logindata.get("id"));
	     mav.addObject("loginuser", loginData);
	     System.out.println(loginData);
	     return mav;
   }
   
   @RequestMapping(value="/checkid", method = RequestMethod.POST)
   public void checkid(HttpServletRequest req, HttpServletResponse resp){
      HashMap<String, Object> checkid = HttpUtil.getParameterMap(req);
      System.out.println(checkid);
      HashMap<String, Object> checkiddata = (HashMap<String, Object>) tsi.checkid(checkid);
      HttpUtil.sendResponceToJson(resp, checkiddata);
   }
   

}