package controller;


import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BankController {
	
	public static final String WEB_PATH = "/WEB-INF/views/bank/";
	
	@RequestMapping(value = {"/","login.do"})
	public String login() {
		
		return WEB_PATH + "bank_login_form.jsp";
	}
	
	@RequestMapping("join_form.do")
	public String join_form(Model model){
	
	//회원 가입시 동의 사항 텍스트 파일을 가져온다.  
	//resource 폴더 안에 있는 text/agree_text.txt의 위치
	ClassPathResource resource = new ClassPathResource("text/agree_text.txt");
	
	try {
		//text/agree_text.txt의 위치를 path에 저장
		Path path = Paths.get(resource.getURI());
		//Files.readAllLines : paht에 존재하는 파일의 내용을 읽어 list로 반환
		List<String> content = Files.readAllLines(path);
		model.addAttribute("content",content);
		
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	
		return WEB_PATH + "bank_join_form.jsp";
		
	}
}
