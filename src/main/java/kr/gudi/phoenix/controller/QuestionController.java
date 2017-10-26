package kr.gudi.phoenix.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import kr.gudi.phoenix.service.QuestionServiceInterface;
import kr.gudi.util.HttpUtil;


@Controller
public class QuestionController {

	@RequestMapping("/MasterPage1") //List 보여주기 
	public ModelAndView masterPage1(ModelAndView mav){
		mav.setViewName("/Question/MasterPage1");
		return mav;
	}
	
	@RequestMapping("/Detail") //게시판안에 있는 글 상세보기 
	public ModelAndView detail(ModelAndView mav){
		mav.setViewName("/Question/Detail"); //경로설정 확인
		return mav;
	}
	
	
	@RequestMapping("/Write") //글작성하기
	public ModelAndView write(ModelAndView mav){
		mav.setViewName("/Question/Write");
		return mav;
	}
	
	
	
	@Autowired
	QuestionServiceInterface tsi;

	@RequestMapping("/MasterPageData") //List 보여주기 
	public ModelAndView masterPageData(ModelAndView mav){ 
		HashMap<String, Object> map = new HashMap<String, Object>();  //데이터를 요청하는게 필요없으면 안적어줌 req 
		map = tsi.getData();
		/*map = tsi.getData();*/
		return HttpUtil.makeHashToJsonModelAndView(map);
	}

	@RequestMapping("/DetailData") //게시판안에 있는 글 상세보기 
	public ModelAndView detailData(ModelAndView mav, HttpServletRequest req){
		HashMap<String, Object> param = new HashMap<String, Object>(); // 요청하는 데이터면 담는 그릇은 parameter 
		param.put("Qno", req.getParameter("Qno"));
		HashMap<String, Object> map = tsi.getDetailData(param);
		return HttpUtil.makeHashToJsonModelAndView(map);
	}
	
	@RequestMapping("/WriteData") //글 작성하기
	public ModelAndView writeData(ModelAndView mav, HttpServletRequest req){ 
		HashMap<String, Object> param = new HashMap<String, Object>();
		param = HttpUtil.getParameterMap(req);
		param.put("UserId", "admin");
		param = tsi.setWriteData(param);
		return HttpUtil.makeHashToJsonModelAndView(param);
	}
		
}
	
	
	

