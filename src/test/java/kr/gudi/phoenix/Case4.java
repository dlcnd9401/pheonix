package kr.gudi.phoenix;

import static org.junit.Assert.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.util.Map;

import org.junit.Before;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.ResultHandler;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml","file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@WebAppConfiguration

public class Case4 {
	@Autowired // WebContext Bean 받아오기
    private WebApplicationContext wac;
	 // MockMVC 변수 생성
	   private MockMvc mock;
	   private String start = "0";
	   private String viewRow = "10";
	   private String UserId = "ico";
	   private String URI = "/cartList";

	@Before
	public void init(){// MockMVC 에게 WebContext 정보 받아 오기
		 mock = MockMvcBuilders.webAppContextSetup(wac).build();
	}	
	@Test
	public void cartCon() throws Exception{
		mock.perform(post(URI)           // get방식 : get("주소"), post방식 : post("주소") 
		    .param("start", start) // paramater값 설정 : .param("key", "value")
		    .param("viewRow", viewRow)
		    .param("UserId", UserId))
			.andDo(new ResultHandler() {// 처리 내용을 출력합니다.
			@Override
			public void handle(MvcResult arg) throws Exception {
		    ModelAndView mav = arg.getModelAndView();
		    Map<String, Object> map = mav.getModel();
	
		   
		    String message = map.get("message").toString();
		    System.out.println(message);
		    JsonParser parser = new JsonParser();
		    JsonElement element = parser.parse(message);
		
		    JsonObject jobject = element.getAsJsonObject(); 
		    JsonArray list = jobject.get("data").getAsJsonArray();

			}
		});
	}

}
