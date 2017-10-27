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
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

@Controller
public class MyPageController {
	public static final String PAGE = "MyPage/";
	@Autowired
	MyPageServiceInterface msi;
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
	
	//Cart 페이지 데이터페이징
	@RequestMapping("/listData2")
	public ModelAndView listData(ModelAndView mav, HttpServletRequest req, HttpSession session) {
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("start", Integer.parseInt(req.getParameter("start")));
		param.put("viewRow", Integer.parseInt(req.getParameter("viewRow")));
		return HttpUtil.makeHashToJsonModelAndView(msi.paging(param));
	}
	//Cart 삭제버튼
	@RequestMapping("/bagdel")
	public ModelAndView bagdel(HttpServletRequest req) {
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("BuyNo", Integer.parseInt(req.getParameter("BuyNo")));
		return HttpUtil.makeHashToJsonModelAndView(msi.bagdel(param));
	}
	
	//구매목록 데이터페이징
	@RequestMapping("/sellData")
	public ModelAndView sellData(HttpServletRequest req) {
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("start", Integer.parseInt(req.getParameter("start")));
		param.put("viewRow", Integer.parseInt(req.getParameter("viewRow")));
		System.out.println(param);
		return HttpUtil.makeHashToJsonModelAndView(msi.sellpaging(param));
	}
	//회원별 장바구니 리스트
	@RequestMapping(value = "/cartList", method = RequestMethod.GET)
	public ModelAndView ListDataID(ModelAndView mav, HttpServletRequest req, HttpSession session){
		HashMap<String, Object> param = new HashMap<String, Object>();
		HashMap<String, Object> user = (HashMap<String, Object>) session.getAttribute("user");
		try {
			int start = 0;
			int viewRow = 10;
			System.out.println("UserId");
			if(req.getParameter("start") != null){
				start = Integer.parseInt(req.getParameter("start"));
			}
			if(req.getParameter("viewRow") != null){
				viewRow = Integer.parseInt(req.getParameter("viewRow"));
			}
			param.put("start", start);
			param.put("viewRow", viewRow);
			param.put("UserId", user.get("UserId"));
		}catch (Exception e) {
			e.printStackTrace();
		}
		return HttpUtil.makeHashToJsonModelAndView(msi.paging(param));
	}
	@RequestMapping(value = "/sellList", method = RequestMethod.GET)
	public ModelAndView sellListData(ModelAndView mav, HttpServletRequest req, HttpSession session){
		HashMap<String, Object> param = new HashMap<String, Object>();
		try {
			HashMap<String, Object> user = (HashMap<String, Object>) session.getAttribute("user");
			param.put("UserId", user.get("UserId"));
			int start = 0;
			int viewRow = 10;
			System.out.println("UserId");
			if(req.getParameter("start") != null){
				start = Integer.parseInt(req.getParameter("start"));
			}
			if(req.getParameter("viewRow") != null){
				viewRow = Integer.parseInt(req.getParameter("viewRow"));
			}
			param.put("start", start);
			param.put("viewRow", viewRow);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return HttpUtil.makeHashToJsonModelAndView(msi.sellpaging(param));
	}
	// 비밀번호 비교 후 페이지 이동
	@RequestMapping(value = "/PwSelectForm", method = RequestMethod.POST)
	public ModelAndView pwSelectForm(ModelAndView mav, HttpServletRequest req, HttpSession session) {
		try {
			HashMap<String, Object> user = (HashMap<String, Object>) session.getAttribute("user");
			HashMap<String, Object> form = HttpUtil.getParameterMap(req);
			
			if((form.get("UserPw")).equals(user.get("UserPw"))){
				mav.setViewName(PAGE + "UserUpdate");
				mav.addObject("user", user);
			}else{
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
	public ModelAndView userupDate(HttpServletRequest req, HttpServletResponse resp, ModelAndView mav) {
		HashMap<String, Object> param = HttpUtil.getParameterMap(req);
		boolean check = true;
		if(("").equals(param.get("UserPw1"))){
			System.out.println("1 비번이 없다.");
			check = false;
		}
		
		if(("").equals(param.get("UserPw2"))){
			System.out.println("2 비번이 없다.");
			check = false;
		}
		
		if(param.get("UserPw2").equals(param.get("UserPw1"))){
			if(check){
				param.put("UserPw", param.get("UserPw1"));
			}else{
				param.put("UserPw", null);
			}
			param = msi.userUpdate(param);
			System.out.println(param.get("state"));
			if(Integer.parseInt(param.get("state").toString()) == 1){
				mav.setViewName("redirect:/");
			}else{
				mav.setViewName(PAGE + "Error");
				System.out.println("비번이 잘못됬다");
				mav.addObject("msg", "수정이 잘못 되었습니다. 다시 수정 하시겠습니까?");
				mav.addObject("url", "UserUpdate");
			}
		}else{
			mav.setViewName(PAGE + "Error");
			mav.addObject("msg", "수정이 잘못 되었습니다. 다시 수정 하시겠습니까?");
			mav.addObject("url", "UserUpdate");
		}
				
		return mav;
	}
}