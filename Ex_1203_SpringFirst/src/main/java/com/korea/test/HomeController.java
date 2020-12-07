package com.korea.test;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		//바인딩
		//requestScope영역 setAttribute와 같은 역할을 한다.
		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("hello","Spring을 시작한다.");
		
		//포워딩 home.jsp로 serverTime값을 전달한다.
		//컨트롤러에서 저장한 serverTime을 home.jsp로 전달한다.
		return "home";
		
		//클래스를 수정했으면.. 새로고침으로 수정이 안되기 때문에 Run As -> Run on server다시 실행한다.
	}
	
}
