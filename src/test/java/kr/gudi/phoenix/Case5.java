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

public class Case5 {
   @Autowired // WebContext Bean 받아오기
    private WebApplicationContext wac;
    // MockMVC 변수 생성
      private MockMvc mock;
      private String UserId = "ico";
      private String URI = "/LoginData";

   @Before
   public void init(){// MockMVC 에게 WebContext 정보 받아 오기
       mock = MockMvcBuilders.webAppContextSetup(wac).build();
   }   
   @Test
   public void cartCon() throws Exception{
      mock.perform(post(URI)           // get방식 : get("주소"), post방식 : post("주소") 
    		  .param("UserId", UserId )
				 .param("UserPw", "1234")
				 .param("UserPost","일산탄현휴먼빌아파트 104동 102호")
				 .param("UserEmail","ico2604@naver.com")
				 .param("UserTel","01022320829")
				 .param("UserNo","2"))
         .andDo(new ResultHandler() {// 처리 내용을 출력합니다.
         @Override
         public void handle(MvcResult arg) throws Exception {
          ModelAndView mav = arg.getModelAndView();
          Map<String, Object> map = mav.getModel();
     
          String message = map.get("message").toString();

         }
      }).andExpect(status().isOk())// 상태값은 OK가 나와야 합니다.
        .andExpect(model().attributeExists("message"));// "message"이라는 attribute가 존재해야 합니다.
   }

}