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
   
   // 회원가입
   @RequestMapping(value="/SignupData", method = RequestMethod.POST)
   public ModelAndView signupData(ModelAndView mav, HttpServletRequest req){ 
      HashMap<String, Object> param = HttpUtil.getParameterMap(req);      
      param = tsi.setSignupData(param);    
      return HttpUtil.makeHashToJsonModelAndView(param);
   }
   
   // 회원가입 아이디 중복체크
   @RequestMapping(value="/checkid", method = RequestMethod.POST)
   public void checkid(HttpServletRequest req, HttpServletResponse resp){
      HashMap<String, Object> checkid = HttpUtil.getParameterMap(req);      
      HashMap<String, Object> checkiddata = (HashMap<String, Object>) tsi.checkid(checkid);
      HttpUtil.sendResponceToJson(resp, checkiddata);
   }
//    로그인
   @RequestMapping(value = "/LoginData", method = RequestMethod.POST)
   public void loginData(HttpServletRequest req, HttpServletResponse resp, HttpSession session){
	   HashMap<String, Object> param = HttpUtil.getParameterMap(req);	   
	   HashMap<String, Object> result = tsi.getLoginData(param);	   
	   session.setAttribute("user", result);	   
	   HttpUtil.sendResponceToJson(resp, result);
//	   mav.addObject(result);
   }
   
// 로그인
//   @RequestMapping(value = "/LoginData", method = RequestMethod.POST)
//   public ModelAndView loginData(ModelAndView mav, HttpServletRequest req , HttpSession session){
//      HashMap<String, Object> param = HttpUtil.getParameterMap(req);      
//      HashMap<String, Object> result = tsi.getLoginData(param);      
//      session.setAttribute("user", result);      
//      mav.addObject(result);
//      return HttpUtil.makeHashToJsonModelAndView(result);
//   }
   
   
   // 로그아웃
   @RequestMapping("/Logout")
   public ModelAndView logout(ModelAndView mav, HttpSession session){
	   session.invalidate();
	   mav.setViewName("redirect:/model");
	   return mav;
   }
   // 로그인유지
   @RequestMapping(value="/LoginCheck", method = RequestMethod.POST)
   public void LoginCheck(HttpServletResponse resp, HttpSession session){
      HashMap<String, Object> user = (HashMap<String, Object>) session.getAttribute("user");
      HashMap<String, Object> map = new HashMap<String, Object>();
      if(user == null){
         map.put("status", 0);
      }else{
         map.put("status", 1);
         map.put("user", user);
      }
      HttpUtil.sendResponceToJson(resp, map);
   }
}