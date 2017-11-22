package kr.gudi.phoenix;

import static org.junit.Assert.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.util.ArrayList;
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
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionContext;
import javax.servlet.http.HttpUpgradeHandler;
import javax.servlet.http.Part;

import org.aspectj.lang.annotation.Before;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.mockito.internal.stubbing.answers.ThrowsException;
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

import kr.gudi.phoenix.controller.ModelController;
import kr.gudi.phoenix.dao.ModeldaoInterface;
import kr.gudi.phoenix.service.ModelServiceInterface;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration (locations={"file:src/main/webapp/WEB-INF/spring/root-context.xml","file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
public class CMTest {
	
	
	public HashMap<String,Object> map;
	public HashMap<String,Object> param;
	ModelAndView mav;
	HttpSession session = new HttpSession() {
		
		@Override
		public void setMaxInactiveInterval(int arg0) {
			// TODO Auto-generated method stub
			
		}
		
		@Override
		public void setAttribute(String arg0, Object arg1) {
			// TODO Auto-generated method stub
			
		}
		
		@Override
		public void removeValue(String arg0) {
			// TODO Auto-generated method stub
			
		}
		
		@Override
		public void removeAttribute(String arg0) {
			// TODO Auto-generated method stub
			
		}
		
		@Override
		public void putValue(String arg0, Object arg1) {
			// TODO Auto-generated method stub
			
		}
		
		@Override
		public boolean isNew() {
			// TODO Auto-generated method stub
			return false;
		}
		
		@Override
		public void invalidate() {
			// TODO Auto-generated method stub
			
		}
		
		@Override
		public String[] getValueNames() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public Object getValue(String arg0) {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public HttpSessionContext getSessionContext() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public ServletContext getServletContext() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public int getMaxInactiveInterval() {
			// TODO Auto-generated method stub
			return 0;
		}
		
		@Override
		public long getLastAccessedTime() {
			// TODO Auto-generated method stub
			return 0;
		}
		
		@Override
		public String getId() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public long getCreationTime() {
			// TODO Auto-generated method stub
			return 0;
		}
		
		@Override
		public Enumeration<String> getAttributeNames() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public Object getAttribute(String arg0) {
			// TODO Auto-generated method stub
			return null;
		}
	};
	HttpServletRequest req = new HttpServletRequest() {
		
		@Override
		public AsyncContext startAsync(ServletRequest arg0, ServletResponse arg1) throws IllegalStateException {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public AsyncContext startAsync() throws IllegalStateException {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public void setCharacterEncoding(String arg0) throws UnsupportedEncodingException {
			// TODO Auto-generated method stub
			
		}
		
		@Override
		public void setAttribute(String arg0, Object arg1) {
			// TODO Auto-generated method stub
			
		}
		
		@Override
		public void removeAttribute(String arg0) {
			// TODO Auto-generated method stub
			
		}
		
		@Override
		public boolean isSecure() {
			// TODO Auto-generated method stub
			return false;
		}
		
		@Override
		public boolean isAsyncSupported() {
			// TODO Auto-generated method stub
			return false;
		}
		
		@Override
		public boolean isAsyncStarted() {
			// TODO Auto-generated method stub
			return false;
		}
		
		@Override
		public ServletContext getServletContext() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public int getServerPort() {
			// TODO Auto-generated method stub
			return 0;
		}
		
		@Override
		public String getServerName() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String getScheme() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public RequestDispatcher getRequestDispatcher(String arg0) {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public int getRemotePort() {
			// TODO Auto-generated method stub
			return 0;
		}
		
		@Override
		public String getRemoteHost() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String getRemoteAddr() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String getRealPath(String arg0) {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public BufferedReader getReader() throws IOException {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String getProtocol() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String[] getParameterValues(String arg0) {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public Enumeration<String> getParameterNames() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public Map<String, String[]> getParameterMap() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String getParameter(String arg0) {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public Enumeration<Locale> getLocales() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public Locale getLocale() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public int getLocalPort() {
			// TODO Auto-generated method stub
			return 0;
		}
		
		@Override
		public String getLocalName() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String getLocalAddr() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public ServletInputStream getInputStream() throws IOException {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public DispatcherType getDispatcherType() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String getContentType() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public long getContentLengthLong() {
			// TODO Auto-generated method stub
			return 0;
		}
		
		@Override
		public int getContentLength() {
			// TODO Auto-generated method stub
			return 0;
		}
		
		@Override
		public String getCharacterEncoding() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public Enumeration<String> getAttributeNames() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public Object getAttribute(String arg0) {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public AsyncContext getAsyncContext() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public <T extends HttpUpgradeHandler> T upgrade(Class<T> arg0) throws IOException, ServletException {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public void logout() throws ServletException {
			// TODO Auto-generated method stub
			
		}
		
		@Override
		public void login(String arg0, String arg1) throws ServletException {
			// TODO Auto-generated method stub
			
		}
		
		@Override
		public boolean isUserInRole(String arg0) {
			// TODO Auto-generated method stub
			return false;
		}
		
		@Override
		public boolean isRequestedSessionIdValid() {
			// TODO Auto-generated method stub
			return false;
		}
		
		@Override
		public boolean isRequestedSessionIdFromUrl() {
			// TODO Auto-generated method stub
			return false;
		}
		
		@Override
		public boolean isRequestedSessionIdFromURL() {
			// TODO Auto-generated method stub
			return false;
		}
		
		@Override
		public boolean isRequestedSessionIdFromCookie() {
			// TODO Auto-generated method stub
			return false;
		}
		
		@Override
		public Principal getUserPrincipal() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public HttpSession getSession(boolean arg0) {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public HttpSession getSession() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String getServletPath() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String getRequestedSessionId() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public StringBuffer getRequestURL() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String getRequestURI() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String getRemoteUser() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String getQueryString() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String getPathTranslated() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String getPathInfo() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public Collection<Part> getParts() throws IOException, ServletException {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public Part getPart(String arg0) throws IOException, ServletException {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String getMethod() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public int getIntHeader(String arg0) {
			// TODO Auto-generated method stub
			return 0;
		}
		
		@Override
		public Enumeration<String> getHeaders(String arg0) {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public Enumeration<String> getHeaderNames() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String getHeader(String arg0) {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public long getDateHeader(String arg0) {
			// TODO Auto-generated method stub
			return 0;
		}
		
		@Override
		public Cookie[] getCookies() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String getContextPath() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String getAuthType() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String changeSessionId() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public boolean authenticate(HttpServletResponse arg0) throws IOException, ServletException {
			// TODO Auto-generated method stub
			return false;
		}
	};
	

	
	
	@Autowired
	ModelController mc;
	
	@Autowired // WebContext Bean 받아오기
    private WebApplicationContext wac;
	private MockMvc mock;
	
	@Autowired
	ModeldaoInterface mdi;
	
	@Autowired
	ModelServiceInterface msi;
	
	private List<HashMap<String,Object>> List = new ArrayList<HashMap<String,Object>>();
	private String URI = "/modellist";

//

	@Test
	public void test3modelController() {
	ModelAndView mav = mc.model(new ModelAndView());	
	HashMap<String,Object> map = (HashMap<String,Object>)mav.getModel();
	System.out.println("mav : " + mav.getModel());
	System.out.println("map : " + map);
	assertEquals(map,mav.getModel());
	List<HashMap<String,Object>> List = (List<HashMap<String,Object>>)map.get("model");
	System.out.println(List.get(2).get("sname"));
	assertEquals("1972", List.get(0).get("sname"));
	
//	assertEquals(tc.md(mav),mav);
	}
	
//	@Test
	public void test5modellistdao(){
//		HashMap<String,Object> user = new HashMap<String,Object>();
//		user.put("UserId", "admin");
//		user.put("Userpw", "1234");
//		System.out.println(user);
		HashMap<String,Object> param = new HashMap<String,Object>();
		param.put("scode", 2);
		System.out.println(param);
		List = (List<HashMap<String,Object>>) mdi.modellist(param);
//		param.put("scode", 1);
		System.out.println(List);

		
	}
	private String scode = "1";	
	
	@org.junit.Before
	public void init(){
		mock = MockMvcBuilders.webAppContextSetup(wac).build();
//		session.setAttribute("user", "test"); 
//		session.setAttribute("user2", "ATest");
//		System.out.println("user session " + session.getAttribute("user"));
//		mav = new ModelAndView();	
//		HashMap<String, HashMap<String, Object>> user = new HashMap<String,HashMap<String,Object>>();
//		user.put("UserId", app);
	}
//		System.out.println("user" + session.getAttribute("user"));
//		
//	
//	}
	
	
////	@Test
//	public void modellist(){
//		HashMap<String,Object> param = new HashMap<String,Object>();
//		param.put("scode", 1);
//		System.out.println(mdi.modellist(param));
//	ModelAndView mav = (ModelAndView)mc.modellist(new ModelAndView(),req,session);
//	List<HashMap<String,Object>> map = (List<HashMap<String,Object>>)mdi.modellist(param);
//	System.out.println("mav : " + map);
//	assertEquals("칼리버-1003", map.get(0).get("mKind"));
//	}
//	
	
	
	
	 @Test
	   public void ModelList() throws Exception {
	      mock.perform(get(URI)          // get방식 : get("주소"), post방식 : post("주소") // paramater값 설정 : .param("key", "value")
	    		 .param("scode", "1")
	    		 .param("user", "admin")
	    		  )
	      .andDo(new ResultHandler() {
			@Override
			public void handle(MvcResult arg0) throws Exception {
				
//	    		ModelAndView mav = (ModelAndView)mc.modellist(new ModelAndView(),req,session);
//	    		HashMap<String,Object> map = (HashMap<String,Object>)mav.getModel();
//	    		System.out.println(map);
	    	        ModelAndView mav = arg0.getModelAndView();
	    	        HashMap<String, Object> map = (HashMap<String, Object>)mav.getModel();
	    	        System.out.println(map);
	    	        System.out.println("1 + " + map.get("data"));
	    	        
	    	        assertEquals(map, mav.getModel());
	    	        List<HashMap<String,Object>> List = (ArrayList<HashMap<String,Object>>)map.get("data");
	    	        System.out.println("List " + List);
	    	        System.out.println(List.get(0).get("code"));
	    	        assertEquals("000G-9775", List.get(0).get("code"));
				}

	      });
////	      .andExpect(status().isOk())// 상태값은 OK가 나와야 합니다.
////	      .andExpect(model().attributeExists("message"));// "message"이라는 attribute가 존재해야 합니다.
//	      
	   }
	}
