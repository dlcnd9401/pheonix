package kr.gudi.phoenix.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.gudi.phoenix.service.MyPageServiceInterface;
import kr.gudi.util.HttpUtil;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

@Controller
public class MyPageController {
	@Autowired
	MyPageServiceInterface msi;
	//장바구니
	@RequestMapping("/Cart")
	public ModelAndView cartpage(ModelAndView mav) {
		mav.setViewName("MyPage/Cart");
		return mav;
	}//구매목록
	@RequestMapping("/SellList")
	public ModelAndView sellList(ModelAndView mav) {
		mav.setViewName("MyPage/SellList");
		return mav;
	}
	@RequestMapping("/PwSelect")
	public ModelAndView pwSelect(ModelAndView mav) {
		mav.setViewName("MyPage/PwSelect");
		return mav;
	}
	@RequestMapping("/UserUpdate")
	public ModelAndView userUpdate(ModelAndView mav) {
		mav.setViewName("MyPage/UserUpdate");
		return mav;
	}
	
	//Cart 페이지 데이터페이징, 삭제버튼
	@RequestMapping("/listData2")
	public ModelAndView listData(HttpServletRequest req) {
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("start", Integer.parseInt(req.getParameter("start")));
		param.put("viewRow", Integer.parseInt(req.getParameter("viewRow")));
		return HttpUtil.makeHashToJsonModelAndView(msi.paging(param));
	}
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
}
