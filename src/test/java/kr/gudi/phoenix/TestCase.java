package kr.gudi.phoenix;

import static org.junit.Assert.*;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import kr.gudi.phoenix.controller.ModelController;
import kr.gudi.phoenix.dao.ModeldaoInterface;
import kr.gudi.phoenix.service.ModelServiceInterface;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration (locations={"file:src/main/webapp/WEB-INF/spring/root-context.xml","file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
public class TestCase {

	@Autowired
	ModelController mc;
	
	@Autowired
	ModeldaoInterface mdi;
	
	@Autowired
	ModelServiceInterface msi;
	
	@Test
	public void abc() {
	
	}

}
