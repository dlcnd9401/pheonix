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

import kr.gudi.phoenix.service.MyPageServiceInterface;
import kr.gudi.util.HttpUtil;


@Controller
public class MyPageController {
	public static final String PAGE = "MyPage/";
	@Autowired
	MyPageServiceInterface msi;
	
	//MyPageMaster
	@RequestMapping("/MyPageMaster")
	public ModelAndView MyPageMaster(ModelAndView mav) {
		mav.setViewName(PAGE + "MyPageMaster");
		return mav;
	}
	//장바구니
	@RequestMapping("/Cart")
	public ModelAndView cartpage(ModelAndView mav) {
		mav.setViewName(PAGE + "Cart");
		return mav;
	}//구매목록  
	@RequestMapping("/SellList")
	public ModelAndView sellList(ModelAndView mav) {
		mav.setViewName(PAGE + "SellList");
		return mav;
	}
	//비밀번호 비교확인
	@RequestMapping("/PwSelect")
	public ModelAndView pwSelect(ModelAndView mav) {
		mav.setViewName(PAGE + "PwSelect");
		return mav;
	}
	//회원정보수정
	@RequestMapping("/UserUpdate")
	public ModelAndView userUpdate(ModelAndView mav) {
		mav.setViewName(PAGE + "UserUpdate");
		return mav;
	}
	//Cart 삭제버튼
	@RequestMapping(value="/bagdel",method = RequestMethod.POST)
	public ModelAndView bagdel(HttpServletRequest req) {
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("BuyNo", Integer.parseInt(req.getParameter("BuyNo")));
		return HttpUtil.makeHashToJsonModelAndView(msi.bagdel(param));
	}
	//장바구니 체크한것들 구매목록으로 이동
	@RequestMapping(value="/sellUpdate",method = RequestMethod.POST)
	public ModelAndView sellUpdate(HttpServletRequest req) {
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("BuyNo", Integer.parseInt(req.getParameter("BuyNo")));
		return HttpUtil.makeHashToJsonModelAndView(msi.sellUpdate(param));
	}
	
	//회원별 장바구니 리스트
	@RequestMapping(value = "/cartList", method = RequestMethod.POST)
	public ModelAndView ListDataID(ModelAndView mav, HttpServletRequest req, HttpSession session){
		HashMap<String, Object> param = new HashMap<String, Object>();
		HashMap<String, HashMap<String, Object>> user = (HashMap<String, HashMap<String, Object>>) session.getAttribute("user");
		try {
			int start = 0;
			int viewRow = 10;
			String UserId = "admin";
			if(req.getParameter("start") != null){
				start = Integer.parseInt(req.getParameter("start"));
			}
			if(req.getParameter("viewRow") != null){
				viewRow = Integer.parseInt(req.getParameter("viewRow"));
			}
			if(req.getParameter("UserId") != null){
				param.put("UserId", user.get("data").get("UserId"));
			}
			param.put("start", start);
			param.put("viewRow", viewRow);
			param.put("UserId", UserId);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return HttpUtil.makeHashToJsonModelAndView(msi.paging(param));
	}
	@RequestMapping(value = "/sellListdata", method = RequestMethod.POST)
	public ModelAndView sellListData(ModelAndView mav, HttpServletRequest req, HttpSession session){
		HashMap<String, Object> param = new HashMap<String, Object>();
		HashMap<String, HashMap<String, Object>> user = (HashMap<String, HashMap<String, Object>>) session.getAttribute("user");
		try {	
			int start = 0;
			int viewRow = 10;
			String UserId = "admin";
			if(req.getParameter("start") != null){
				start = Integer.parseInt(req.getParameter("start"));
			}
			if(req.getParameter("viewRow") != null){
				viewRow = Integer.parseInt(req.getParameter("viewRow"));
			}
			if(req.getParameter("UserId") != null){
				param.put("UserId", user.get("data").get("UserId"));
			}
			param.put("start", start);
			param.put("viewRow", viewRow);
			param.put("UserId", UserId);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return HttpUtil.makeHashToJsonModelAndView(msi.sellpaging(param));
	}
	// 비밀번호 비교 후 페이지 이동
	@RequestMapping(value = "/PwSelectForm", method = RequestMethod.POST)
	public ModelAndView pwSelectForm(ModelAndView mav, HttpServletRequest req, HttpSession session) {
		try {
			HashMap<String, HashMap<String, Object>> user = (HashMap<String, HashMap<String, Object>>) session.getAttribute("user");
			HashMap<String, Object> form = HttpUtil.getParameterMap(req);
			if((form.get("UserPw")).equals(user.get("data").get("UserPw"))){
				mav.setViewName(PAGE + "UserUpdate");
				mav.addObject("user", user);
	     	}
				else{
				mav.setViewName(PAGE + "Error");
				mav.addObject("msg", "비밀번호가 잘못 되었습니다. 다시 확인 하시겠습니까?");
				mav.addObject("url", "PwSelect");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	//userinfo 데이터 가져와서 비밀번호 입력후 정보 수정, 예외처리
	@RequestMapping(value = "/userupDate", method = RequestMethod.POST)
	public ModelAndView userupDate(HttpServletRequest req, HttpServletResponse resp, ModelAndView mav, HttpSession session) {
		HashMap<String, HashMap<String, Object>> user = (HashMap<String, HashMap<String, Object>>) session.getAttribute("user");
		HashMap<String, Object> form = HttpUtil.getParameterMap(req);
		boolean check = true;
		if(("").equals(form.get("UserPw1"))){
			check = false;
		}
		
		if(("").equals(form.get("UserPw2"))){
			check = false;
		}
		if(form.get("UserPw2").equals(form.get("UserPw1"))){
			if(check){
				form.put("UserPw", form.get("UserPw1"));
			}else{
				form.put("UserPw", null);
			}
			
			form = msi.userUpdate(form);
			if(Integer.parseInt(form.get("status2").toString()) == 1){
				mav.setViewName("redirect:/model");
			}else{
				mav.setViewName(PAGE + "Error");
				mav.addObject("msg", "수정이 잘못 되었습니다. 다시 수정 하시겠습니까?");
				mav.addObject("url", "UserUpdate");
			}
		}else{
			mav.setViewName(PAGE + "Error");
			mav.addObject("msg", "수정이 잘못 되었습니다. 다시 수정 하시겠습니까?");
			mav.addObject("url", "UserUpdate");
		}
		form.put("UserEmail", user.get("data").get("UserEmail"));
		form.put("UserPost", user.get("data").get("UserPost"));
		form.put("UserTel", user.get("data").get("UserTel"));
		return mav;
	}
}
