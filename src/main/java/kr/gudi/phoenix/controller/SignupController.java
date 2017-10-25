package kr.gudi.phoenix.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
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
	
	
	@RequestMapping("/Login") // 로그인
	public ModelAndView login(ModelAndView mav){
		mav.setViewName("Login");
		return mav;
	}
	
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
      HashMap<String, Object> Logindata = (HashMap<String, Object>) tsi.getLoginData(loginData);
      session.setAttribute("UserId", Logindata.get("UserId")); //다른 페이지에서 로그인 데이터를 가져오기 위해  세팅한것 건들면 팀장님한테 뒤짐
      mav.addObject("LoginData", loginData);
      System.out.println(loginData);
      return mav;
   }
   
//   @RequestMapping(value="/Userlogin", method=RequestMethod.POST)
//   public ModelAndView Userlogin(ModelAndView mav, HttpServletRequest req, HttpSession session){
//      String id = req.getParameter("id");
//      String pwd = req.getParameter("pwd");
//      HashMap<String, Object> userlogin = new HashMap<String, Object>();
//      userlogin.put("id", id);
//      userlogin.put("pwd", pwd);
//      System.out.println(userlogin);
//      HashMap<String, Object> Logindata = (HashMap<String, Object>) usi.login(userlogin);
//      session.setAttribute("id", Logindata.get("id")); //다른 페이지에서 로그인 데이터를 가져오기 위해  세팅한것 건들면 팀장님한테 뒤짐
//      mav.addObject("loginuser", userlogin);
//      return mav;
//   }
}