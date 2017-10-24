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

	@RequestMapping("/Cart")
	public ModelAndView cartpage(ModelAndView mav){
		 mav.setViewName("MyPage/Cart");
		return mav;
	}
	@RequestMapping("/SellList")
	public String sellList(){
		return "MyPage/SellList";
	}
	@RequestMapping("/listView")
	public ModelAndView listView(ModelAndView mav){
		mav.setViewName("Mypage/Cart");
		return mav;
	}
	
	
	   @RequestMapping("/cartData")
	   public ModelAndView cartData(ModelAndView mav){
	      HashMap<String, Object> map = new HashMap<String, Object>();
	      map = msi.cart();
	      return HttpUtil.makeHashToJsonModelAndView(map);
	   }
	   
	   @RequestMapping("/listData")
		public ModelAndView listData(HttpServletRequest req){
			HashMap<String, Object> param = new HashMap<String, Object>();
			param.put("start", Integer.parseInt(req.getParameter("start")));
			param.put("viewRow", Integer.parseInt(req.getParameter("viewRow")));
			System.out.println(param);
			return HttpUtil.makeHashToJsonModelAndView(msi.paging(param));
	   }
	   
	   @RequestMapping("/bagdel")
		public ModelAndView bagdel(HttpServletRequest req){
			HashMap<String, Object> param = new HashMap<String, Object>();
			param.put("BuyNo", Integer.parseInt(req.getParameter("BuyNo")));
			return HttpUtil.makeHashToJsonModelAndView(msi.bagdel(param));
	   }
	   
}
