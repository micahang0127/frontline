package com.frontline.newssummary;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
//		logger.info("Welcome home! The client locale is {}.", locale);
//		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		
//		String formattedDate = dateFormat.format(date);
//		
//		model.addAttribute("serverTime", formattedDate );
//		
//		// insert 구문
//		HashMap<String, String> input = new HashMap<String, String>();
//		input.put("keyword", "example1");
//		input.put("description", "example2");
//		sqlSession.insert("userControlMapper.exInsert", input);
//
//		// select 구문
//		HashMap<String, String> input2 = new HashMap<String, String>();
//		input2.put("keyword", "example1");
//		List<HashMap<String, String>> output = sqlSession.selectList("userControlMapper.exSelect", input2);
//		System.out.print(output);
//		
//		
		
		return "home";
	}
	
}
