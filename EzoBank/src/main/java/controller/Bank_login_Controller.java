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
import org.springframework.validation.BindingResult;
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
	
	@RequestMapping("/find_id_form.do")
	public String find_form_id() {
		
		return WEB_PATH + "bank_find_id_form.jsp";
	}
	
	@RequestMapping("/find_id.do")
	@ResponseBody
	public String find_id(String name, String ssn) {
		
		BankVO bankvo = bank_dao.find_id_selectOne(ssn);
		
		String result = "no";
		
		if(bankvo != null) {
			result = bankvo.getId();
		}
		
		return result;
	}
	
	@RequestMapping("/find_pwd_form.do")
	public String find_form_pwd() {
		return WEB_PATH + "bank_find_pwd_form.jsp";
	} 
	
	@RequestMapping("/find_pwd.do")
	@ResponseBody
	public String find_pwd(Model model, BankVO vo, String name, String id, String ssn) {
		
		vo.setName(name);
		vo.setId(id);
		vo.setSsn(ssn);
		
		BankVO bankvo = bank_dao.find_pwd_selectOne(vo);
		
		String result = "no";
		
		//DB검색 결과 해당 정보에 대한 조회가 없다면 
		if(bankvo != null) {
			result = "yes";			
		}					
		return result;
				
	}
	
	@RequestMapping("/bank_new_pwd.do")
	public String bank_new_pwd(Model model, String ssn) {

		
		model.addAttribute("ssn",ssn);
		
		return WEB_PATH + "bank_new_pwd.jsp";
	}
	
	@RequestMapping("change_password.do")
	@ResponseBody
	public String change_password(BankVO vo, String ssn, String pwd) {
				
		vo.setSsn(ssn);
		vo.setPwd(pwd);
				
		int res = bank_dao.password_update(vo);
		
		String result = "no";
		
		if(res > 0) {
			result = "yes";
		}		
		return result;
	}
	
	
	
}

