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

import net.sf.json.util.JSONStringer;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml","file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@WebAppConfiguration

public class Case1 {
   @Autowired // WebContext Bean 받아오기
    private WebApplicationContext wac;
    // MockMVC 변수 생성
      private MockMvc mock;
      private String start = "0";
      private String viewRow = "10";
      
      private String code = "000G-1818";
      private String sname = "MALTE";
      private String name = "4500S";
      private String introduce = "33172는 최초이자 최고의 컬렉션입니다.";
      private String img = "resources/img/000R-9300.png";
      private String mshape = "또노";
      private String mkind = "쿼츠";
      private String price = "18,800,000";

      private String URI1 = "/userlistData";
      private String URI2 = "/stocklistData";
      private String URI3 = "/clockupData";

   @Before
   public void init(){// MockMVC 에게 WebContext 정보 받아 오기
       mock = MockMvcBuilders.webAppContextSetup(wac).build();
   }   
   @Test
   public void userCon() throws Exception{
      mock.perform(post(URI1)           // get방식 : get("주소"), post방식 : post("주소") 
          .param("start", start) // paramater값 설정 : .param("key", "value")
          .param("viewRow", viewRow))
         .andDo(new ResultHandler() {// 처리 내용을 출력합니다.
         @Override
         public void handle(MvcResult arg) throws Exception {
          ModelAndView mav = arg.getModelAndView();
          Map<String, Object> map = mav.getModel();
          System.out.println(map);
         
          String message = map.get("message").toString();
          System.out.println(message);
          JsonParser parser = new JsonParser();
          JsonElement element = parser.parse(message);
      
          JsonObject jobject = element.getAsJsonObject();           
          JsonArray list = jobject.get("data").getAsJsonArray();          
          System.out.println("list1 : " + list.size());          
         }
      }).andExpect(status().isOk())// 상태값은 OK가 나와야 합니다.
        .andExpect(model().attributeExists("message"));// "message"이라는 attribute가 존재해야 합니다.
   }
   
   @Test
   public void stockCon() throws Exception{
      mock.perform(post(URI2)           // get방식 : get("주소"), post방식 : post("주소") 
          .param("start", start) // paramater값 설정 : .param("key", "value")
          .param("viewRow", viewRow)
      	  .param("storeSearchType", "1972"))
         .andDo(new ResultHandler() {// 처리 내용을 출력합니다.
         @Override
         public void handle(MvcResult arg) throws Exception {
          ModelAndView mav = arg.getModelAndView();
          Map<String, Object> map = mav.getModel();
          System.out.println(map);
         
          String message = map.get("message").toString();
          System.out.println(message);
          JsonParser parser = new JsonParser();
          JsonElement element = parser.parse(message);
      
          JsonObject jobject = element.getAsJsonObject(); 
          JsonArray list = jobject.get("data").getAsJsonArray();
          System.out.println("list2 : " + list.size());
         }
      }).andExpect(status().isOk())// 상태값은 OK가 나와야 합니다.
        .andExpect(model().attributeExists("message"));// "message"이라는 attribute가 존재해야 합니다.
   }
   
   @Test
   public void clockupCon() throws Exception{
      mock.perform(post(URI3)          // get방식 : get("주소"), post방식 : post("주소") 
           .param("code", code)// paramater값 설정 : .param("key", "value")
           .param("name", name)
           .param("sname", sname)
           .param("price", price)
           .param("introduce", introduce)
           .param("mkind", mkind)
           .param("mshape", mshape)
           .param("img", img))
         .andDo(new ResultHandler() {// 처리 내용을 출력합니다.
         @Override
         public void handle(MvcResult arg) throws Exception {
          ModelAndView mav = arg.getModelAndView();
          Map<String, Object> map = mav.getModel();
          System.out.println(map);
         
          String message = map.get("message").toString();
          System.out.println(message);
          JsonParser parser = new JsonParser();
          JsonElement element = parser.parse(message);
      
          JsonObject jobject = element.getAsJsonObject(); 
          JsonArray list = jobject.get("status").getAsJsonArray();
          System.out.println("list3 : " + list.size());
         }
      }).andExpect(status().isOk())// 상태값은 OK가 나와야 합니다.
        .andExpect(model().attributeExists("message"));// "message"이라는 attribute가 존재해야 합니다.
   }

}