package kr.gudi.phoenix;

import static org.junit.Assert.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
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

@RunWith(SpringJUnit4ClassRunner.class)
//jnit을 사용할수있도록 ?
@WebAppConfiguration
//웹 컨텍스트의 애플리케이션 컨텍스트를 생성하는데 사용
@ContextConfiguration (locations={"file:src/main/webapp/WEB-INF/spring/root-context.xml","file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
//자동으로 만들어줄 애플리케이션 컨텍스트를 만들어 관리하는 작업을 진행 
//xml 형태만 로딩 가능 
public class TestCase00 {
	
   @Autowired // WebContext Bean 받아오기
   private WebApplicationContext wac;
   // MockMVC 변수 생성
   private MockMvc mock;
	      
   @Before
   public void init(){// MockMVC 에게 WebContext 정보 받아 오기
      mock = MockMvcBuilders.webAppContextSetup(wac).build();
   }   
	
	@Test
	public void abc() throws Exception {
	      mock.perform(post("/MasterPage1") //perform -> 리턴 리턴객체는 ResultActions
	               ).andDo(new ResultHandler()  {// 처리 내용을 출력합니다.
		             @Override
		             public void handle(MvcResult arg) throws Exception {
			              ModelAndView mav = arg.getModelAndView(); 
			              System.out.println(mav.getViewName()); //console창에 뒤에 있는 값을 출력시킴 
			              assertEquals("/Question/MasterPage1", mav.getViewName());
			              //예상하는 값을 비교 앞에있는것과 뒤가 일치하나 확인  
		             }
	             });
	}

}
