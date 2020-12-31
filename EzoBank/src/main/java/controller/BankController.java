package controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import common.MyCommon;
import dao.BankDAO;
import vo.BankVO;


@Controller
public class BankController {

	BankDAO bank_dao; //bank table DAO
	
	public void setBank_dao(BankDAO bank_dao) {
		this.bank_dao = bank_dao;
	}
	
	//메인페이지
	//@RequestMapping(value= {"/","/main_page.do"})
	//public String main_page() {
	//	return MyCommon.MainPage.VIEW_PATH + "main_page.jsp";
	//}
	
	
	//로그인을 완료했으면 idx를 파라미터로 반드시 받아야 함
	//로그인을 하지 않고 클릭하면 로그인 페이지로 이동해야 함
	//@RequestMapping("/account_info.do")
	//public String account_info(Model model) {
	//	BankVO vo = bank_dao.selectone(1);
	//	model.addAttribute("vo",vo);
	//	return MyCommon.Account.VIEW_PATH + "account_info_page.jsp";
	//}
	
	//입금 페이지
	//로그인을 완료했으면 idx를 파라미터로 반드시 받아야 함
	//로그인을 하지 않고 클릭하면 로그인 페이지로 이동해야 함
	@RequestMapping("/deposit_page.do")
	public String deposit_page(Model model,int idx) {
		BankVO vo = bank_dao.selectone(idx);
		model.addAttribute("vo",vo);
		return MyCommon.Deposit.VIEW_PATH + "deposit_page.jsp";
	}
	
	//출금 페이지
	//로그인을 완료했으면 idx를 파라미터로 반드시 받아야 함
	//로그인을 하지 않고 클릭하면 로그인 페이지로 이동해야 함
	@RequestMapping("/withdrawal_page.do")
	public String withdrawal_page(Model model,int idx) {
		BankVO vo = bank_dao.selectone(idx);
		model.addAttribute("vo",vo);
		return MyCommon.Withdrawal.VIEW_PATH + "withdrawal_page.jsp";
	}
	
	//입출금 성공 Ajax
	@RequestMapping("/depositandwithdraw.do")
	@ResponseBody
	public String depositandwithdraw(int idx,int amount,int check) {
		int res = 0;
		String result = "";
		
		if(check==1) { // 이 부분에서 accountIfo table에 data넣기(계좌 상세보기, 의미X)
			//입금 mapper
			res = bank_dao.update_deposit(idx, amount);
			
		}
		else{
			//출금 mapper
			res = bank_dao.update_withdrawal(idx, amount);
		}
		
		if(res>0) {
			result = "success";
		}
		
		
		return result;
	}
	
	//이체 페이지
	//로그인을 완료했으면 idx를 파라미터로 반드시 받아야 함
	//로그인을 하지 않고 클릭하면 로그인 페이지로 이동해야 함
	@RequestMapping("/transfer_page.do")
	public String transfer_page(int idx, Model model) {
		BankVO vo = bank_dao.selectone(idx);
		
		//전체 회원 list 가져오기
		List<BankVO> list = bank_dao.select();
		
		//전체 회원의 계좌를 저장하기 위한 list
		List<String> account = new ArrayList<String>();
		
		//전체 회원의 계좌 저장하기
		for(int i=0;i<list.size();i++) {
			account.add(list.get(i).getAccount());
		} 
		
		model.addAttribute("vo",vo);
		model.addAttribute("account",account);
		
		return MyCommon.Transfer.VIEW_PATH + "transfer_page.jsp";
	}
	
	//이체 페이지의 Ajax
	@RequestMapping("/transfer_account.do")
	@ResponseBody
	public String transfer_account(int idx,String acc) {
		String result = "";
			
		BankVO vo = bank_dao.selectone(acc); //입력받은 계좌 vo받기
		
		if(vo==null) { // 입력한 계좌가 존재하지 않다면 null을 return
			return null;
		}
		
		int idxYou = vo.getIdx();
		String name = vo.getName();
		//이체를 위한 return
		result = String.format("[{'idxMe':'%d','idxYou':'%d','name':'%s'}]", idx, idxYou,name);
		
		
		return result;
	}
	
	//이체하기를 완료하기 위한 idxMe : 내 idx , idxYou : 이체하기 위한 상대방 idx
	@RequestMapping("/transfer_money_page.do")
	public String transfer_money_page(Model model, int idxMe, int idxYou) {
		BankVO voMe = bank_dao.selectone(idxMe);
		model.addAttribute("voMe",voMe);
		
		BankVO voYou = bank_dao.selectone(idxYou);
		model.addAttribute("voYou",voYou);
		
		return MyCommon.Transfer.VIEW_PATH + "transfer_money_page.jsp";
	}
	
	//이체 페이지의 Ajax
	@RequestMapping("/transfer_amount.do")
	@ResponseBody
	public String transfer_amount(int idxMe, int idxYou, int amount) {
		int res = 0;
		
		res = bank_dao.update_deposit(idxYou, amount); // 상대방 계좌 입금
		res = bank_dao.update_withdrawal(idxMe, amount); // 내 계좌 출금
		
		String result = "";
		
		if(res>0) {
			result = "success";
		}
		
		return result;
	}
	
	

}
