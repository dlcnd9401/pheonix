package kr.gudi.phoenix;

import static org.junit.Assert.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.util.Collection;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.AsyncContext;
import javax.servlet.DispatcherType;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.ServletOutputStream;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

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
public class Case2 {
	
	@Autowired // WebContext Bean 받아오기
    private WebApplicationContext wac;
	 // MockMVC 변수 생성
	   private MockMvc mock;
	   private String BuyNo = "6";
	   @Before
		public void init(){// MockMVC 에게 WebContext 정보 받아 오기
			 mock = MockMvcBuilders.webAppContextSetup(wac).build();
		}	
		@Test
		public void cartCon() throws Exception{
			mock.perform(post("/sellListdata")           // get방식 : get("주소"), post방식 : post("주소") 
			    .param("start", "0") // paramater값 설정 : .param("key", "value")
			    .param("viewRow", "10"))
				.andDo(new ResultHandler() {// 처리 내용을 출력합니다.
				@Override
				public void handle(MvcResult arg0) throws Exception {
					ModelAndView mav = arg0.getModelAndView();
				    Map<String, Object> map = mav.getModel();
				    System.out.println(map);
				    
				   
				    String message = map.get("message").toString();
				    System.out.println(message);
				    JsonParser parser = new JsonParser();
				    JsonElement element = parser.parse(message);
				    
				    JsonObject jobject = element.getAsJsonObject(); 
				    JsonArray list = jobject.get("data2").getAsJsonArray();
				    System.out.println(list);
				    assertEquals(3, list.size());
					}
				});
			}
}
