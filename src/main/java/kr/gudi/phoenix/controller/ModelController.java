package kr.gudi.phoenix.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ModelController {
	
	@RequestMapping("/model")
	public String model(){
		return "Model/Model";
	}
	@RequestMapping("/modeldetail")
	public String modeldetail(){
		return "Model/Modeldetail";
	}
	@RequestMapping("/modelList")
	public String modelList(){
		return "Model/ModelList";
	}
	
	
}
