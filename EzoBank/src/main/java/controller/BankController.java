package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BankController {

	public static final String WEB_PATH = "/WEB-INF/views/bank/";
	
	@RequestMapping(value = {"/","login.do"})
	public String login() {
		
		return WEB_PATH + "bank_login_form.jsp";
	}
	
	@RequestMapping("join_form.do")
	public String join_form(){
		return WEB_PATH + "bank_join_form.jsp";
		
	}
}
