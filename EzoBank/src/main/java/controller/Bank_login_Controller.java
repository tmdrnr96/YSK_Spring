package controller;


import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.swing.JOptionPane;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.BankDAO;
import vo.BankVO;

@Controller
public class Bank_login_Controller {
	
	BankDAO bank_dao;
	
	public void setBank_dao(BankDAO bank_dao) {
		this.bank_dao = bank_dao;
	}
	
	public static final String WEB_PATH = "/WEB-INF/views/bank_login/";
	
	
	//로그인 페이지
	@RequestMapping(value = {"/","/login.do"})
	public String login() {
		
		return WEB_PATH + "bank_login_form.jsp";
	}
	
	
	@RequestMapping("/join_form.do")
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
		
		e.printStackTrace();
	}
		return WEB_PATH + "bank_join_form.jsp";
	}
	
	//아이디 중복 확인
	@RequestMapping("/id_check.do")
	@ResponseBody
	public String id_check(String id) {
		
		BankVO bankvo = bank_dao.selectOne(id);
		
		String res = "no";
		
		if(bankvo == null) {
			res = "yes";
		}
		
		return res;
		
	}
	
	@Autowired
	HttpServletRequest request;
	
	//회원 정보 DB에 저장
	@RequestMapping("/insert.do")
	@ResponseBody
	public String member_insert(BankVO vo, String ssn, String tel, String email, Model model) {
		
		vo.setSsn(ssn);
		vo.setTel(tel);
		vo.setEmail(email);
			
		//vo에 ip 등록
		String ip = request.getRemoteAddr();		
		vo.setIp(ip);
		
		//vo에 계좌 생성 및 등록		
		 String str = String.valueOf(System.currentTimeMillis());
		
		 String account1 = str.substring(0,3);
		 String account2 = str.substring(4,6);
		 String account3 = str.substring(7,12);
		 
		 String account = account1 + "-" + account2 + "-" + account3; 		
		 vo.setAccount(account);
		 
		 int res = bank_dao.insert(vo);
		 
		 model.addAttribute("res", res);
		 String result = "no";

		if(res != 0) {
			result = "yes";
		} 
		
		return result;		
	}
	
	@RequestMapping("/forgot_id.do")
	public String forgot_id() {
		
		return "";
	}
	
	
	
	
	
	
	
	
	
	
}

