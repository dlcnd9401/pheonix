package kr.gudi.phoenix.controller;

import java.io.Console;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;   //HttpSession

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import kr.gudi.phoenix.service.QuestionServiceInterface;
import kr.gudi.util.HttpUtil;


@Controller
public class QuestionController {

   @RequestMapping("/MasterPage1") //List 보여주기 
   public ModelAndView masterPage1(ModelAndView mav, HttpSession session){                                            
      HashMap<String, HashMap<String, Object>> UserId = (HashMap<String, HashMap<String, Object>>) session.getAttribute("UserId");
       /*  if(UserId == null){
            mav.setViewName("redirect:/Signup");
         }else {
            mav.setViewName("model");
         } 로그인을 안했으면  로그인 하라는 페이지로 이동(singup맞나??) / 로그인을 했으면 메인페이지로 보내줌 */ 
      mav.setViewName("/Question/MasterPage1");
      return mav;
   }
   
   
   
   @RequestMapping("/MasterPage1Search")//게시판 검색기능 
   public void masterPage1Search(HttpServletResponse response, HttpServletRequest req) {
        HashMap<String, Object> ud = HttpUtil.getParameterMap(req);
         ud = tsi.getSearchData(ud); 
         System.out.println(ud);
         HttpUtil.sendResponceToJson(response, ud);
      }
   
   
   
   
   @RequestMapping("/Detail") //게시판안에 있는 글 상세보기 
   public ModelAndView detail(ModelAndView mav, HttpSession session){
	  HashMap<String, HashMap<String, Object>> user = (HashMap<String, HashMap<String, Object>>) session.getAttribute("user");
	  mav.addObject("UserAuth", user.get("data").get("UserAuth"));
	  System.out.println(user.get("data").get("UserAuth"));
      mav.setViewName("/Question/Detail"); //경로설정 확인
      return mav;
   }
   
   
   
   
/*   @RequestMapping("/Answer") //관리자 답변
   public ModelAndView answer(ModelAndView mav){
      mav.setViewName("/Question/Detail");
      return mav;
   }
   */
   
   
   
   @RequestMapping("/Write") //글작성하기
   public ModelAndView write(ModelAndView mav, HttpSession session ){

	   mav.setViewName("/Question/Write");
      return mav;
   }
   
   
   
   @Autowired
   QuestionServiceInterface tsi;

   @RequestMapping("/MasterPageData") //List 보여주기 
   public ModelAndView masterPageData(ModelAndView mav, HttpServletRequest req, HttpSession session){ 
      HashMap<String, HashMap<String, Object>> UserId = (HashMap<String, HashMap<String, Object>>) session.getAttribute("UserId");
      HashMap<String, Object> map = new HashMap<String, Object>();  //데이터를 요청하는게 필요없으면 안적어줌 req 
      map = tsi.getData();
      /*map = tsi.getData();*/
      return HttpUtil.makeHashToJsonModelAndView(map);
   }
   
   @RequestMapping("/DetailData") //게시판안에 있는 글 상세보기 
   public ModelAndView detailData(ModelAndView mav, HttpServletRequest req,HttpSession session){
	   HashMap<String, HashMap<String, Object>> user = (HashMap<String, HashMap<String, Object>>) session.getAttribute("user");
	   HashMap<String, Object> param = new HashMap<String, Object>(); // 요청하는 데이터면 담는 그릇은 parameter 
      param.put("Qno", req.getParameter("Qno"));
      /*param.put("UserAuth", user.get("data").get("UserAuth"));*/
      param.put("UserId", user.get("data").get("UserId"));
      System.out.println("UserId : " +  user.get("data").get("UserId"));
      HashMap<String, Object> map = tsi.getDetailData(param);
      return HttpUtil.makeHashToJsonModelAndView(map);
   }
   
   
   
   
   
   
   
   
   @RequestMapping("/WriteData") //글 작성하기
   public ModelAndView writeData(ModelAndView mav, HttpServletRequest req,HttpSession session){ 
      HashMap<String, Object> param = new HashMap<String, Object>();
      param = HttpUtil.getParameterMap(req);
      HashMap<String, HashMap<String, Object>> user = (HashMap<String, HashMap<String, Object>>) session.getAttribute("user");
      param.put("UserId", user.get("data").get("UserId"));
      param = tsi.setWriteData(param);
      return HttpUtil.makeHashToJsonModelAndView(param);
   }
      
}
   
   
   
