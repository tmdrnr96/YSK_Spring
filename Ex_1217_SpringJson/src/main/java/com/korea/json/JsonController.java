package com.korea.json;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JsonController {

	public static final String VIEW_PATH = "/WEB-INF/views/";
	
	@RequestMapping(value = {"/","list.do"})
	public String start() {
		
		return VIEW_PATH + "api_json.jsp";
	}
	
}
