package org.zerock.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@Log4j
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class SampletxServiceTests {
	@Autowired
	private SampleTxService service;
	
	@Test
	public void testLong() {
		String str = "Starry\r\n"+
				"Starry night1111\r\n"+
				"Patin your palette blue and grey1111\r\n"+
				"Look out on a summer's day1111";
		log.info(str);
		service.addData(str);
	}

}
