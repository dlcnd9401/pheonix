package kr.gudi.phoenix.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
/*import javax.servlet.http.HttpServletResponse;*/

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import kr.gudi.phoenix.service.QuestionService;
import kr.gudi.phoenix.service.QuestionServiceInterface;
import kr.gudi.util.HttpUtil;

@Controller
public class QuestionController {

	@RequestMapping("/MasterPage1")
	public ModelAndView masterPage1(ModelAndView mav){
		mav.setViewName("Question/MasterPage1");
		return mav;
	}
	
	@RequestMapping("/Write")
	public ModelAndView write(ModelAndView mav){
		mav.setViewName("Question/Write");
		return mav;
	}

	@RequestMapping("/Detail")
	public ModelAndView detail(ModelAndView mav){
		mav.setViewName("Question/Detail");
		return mav;
	}
	
	@Autowired
	QuestionServiceInterface tsi;

	@RequestMapping("/MasterPageData") //List 보여주기 
	public ModelAndView masterPageData(ModelAndView mav){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map = tsi.getData();
		/*map = tsi.getData();*/
		return HttpUtil.makeHashToJsonModelAndView(map);
	}

	@RequestMapping("/DetailData") //게시판안에 있는 글 상세보기 
	public ModelAndView detailData(ModelAndView mav, HttpServletRequest req){
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("Qno", req.getParameter("Qno"));
		HashMap<String, Object> map = tsi.getDetailData(param);
		return HttpUtil.makeHashToJsonModelAndView(map);
	}
	

}
	
	

