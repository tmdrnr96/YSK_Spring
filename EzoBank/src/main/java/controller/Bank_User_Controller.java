package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.BankDAO;
import vo.BankVO;

@Controller
public class Bank_User_Controller {

BankDAO bank_dao;
	
	@Autowired
	HttpSession session;
	
	public void setBank_dao(BankDAO bank_dao) {
		this.bank_dao = bank_dao;
	}
	
	public static final String WEB_PATH = "/WEB-INF/views/bank_user/";
	
	//회원 정보 수정 폼으로 이동
	@RequestMapping("/user_info.do")
	public String user_info_update(Model model) {
		
		BankVO vo = (BankVO) session.getAttribute("user");
		
		//주민번호
		String ssn1 = vo.getSsn().substring(0,6); 
		String ssn2 = vo.getSsn().substring(7,14); 
		
		model.addAttribute("ssn1",ssn1);
		model.addAttribute("ssn2",ssn2);
		
		//전화 번호
		String tel1 = vo.getTel().substring(0,3);
		String tel2 = vo.getTel().substring(4,8);
		String tel3 = vo.getTel().substring(9,13);
		
		model.addAttribute("tel1", tel1);
		model.addAttribute("tel2", tel2);
		model.addAttribute("tel3", tel3);
		
		//이메일
		String email1 = vo.getEmail().substring(0,vo.getEmail().indexOf('@'));
		String email2 = vo.getEmail().substring(vo.getEmail().indexOf('@')+1,vo.getEmail().length());
		
		model.addAttribute("email1",email1);
		model.addAttribute("email2",email2);
		
		//계좌번호
		String account1 = vo.getAccount().substring(0,3);
		String account2 = vo.getAccount().substring(4,6);
		String account3 = vo.getAccount().substring(7,12);
		
		model.addAttribute("account1",account1);
		model.addAttribute("account2",account2);
		model.addAttribute("account3",account3);
		
		//주소
		String addr1 = vo.getAddr().substring(0,vo.getAddr().indexOf('/'));
		String addr2 = vo.getAddr().substring(vo.getAddr().indexOf('/')+1,vo.getAddr().length()); 
		
		model.addAttribute("addr1",addr1);
		model.addAttribute("addr2",addr2);
		
		return WEB_PATH + "bank_user_update.jsp";
	}
	
	@RequestMapping("user_modified.do")
	@ResponseBody
	public String user_modified(BankVO vo, String ssn, String account, String tel, String email) {
		
		vo.setSsn(ssn);
		vo.setAccount(account);
		vo.setTel(tel);
		vo.setEmail(email);

		int res = bank_dao.user_modified(vo);
		
		String result = "no";
		
		if(res > 0) {
			
			result = "yes";
		}
		
		return result;
	}
	
}
