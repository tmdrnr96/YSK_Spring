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
import dao.DetailDAO;
import vo.BankVO;
import vo.DetailVO;


@Controller
public class BankController {
	
	@Autowired
	BankDAO bdao; //bank table DAO
	
	@Autowired
	DetailDAO detaildao; //detail table DAO
	
	//입금 페이지
	//로그인을 완료했으면 idx를 파라미터로 반드시 받아야 함
	//로그인을 하지 않고 클릭하면 로그인 페이지로 이동해야 함
	@RequestMapping("/deposit_page.do")
	public String deposit_page(Model model,int idx) {
		
		BankVO vo = bdao.selectone(idx);
		model.addAttribute("vo",vo);
		return MyCommon.Deposit.VIEW_PATH + "deposit_page.jsp";
	}
	
	//출금 페이지
	//로그인을 완료했으면 idx를 파라미터로 반드시 받아야 함
	//로그인을 하지 않고 클릭하면 로그인 페이지로 이동해야 함
	@RequestMapping("/withdrawal_page.do")
	public String withdrawal_page(Model model,int idx) {
		BankVO vo = bdao.selectone(idx);
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
			res = bdao.update_deposit(idx, amount);
		
		}
		else{
			//출금 mapper
			res = bdao.update_withdrawal(idx, amount);
			
			//거래내역에 쓰일 DB 추가
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
		BankVO vo = bdao.selectone(idx);
		
		//전체 회원 list 가져오기
		List<BankVO> list = bdao.select();
		
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
			
		BankVO vo = bdao.selectone(acc); //입력받은 계좌 vo받기
		
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
		BankVO voMe = bdao.selectone(idxMe);
		model.addAttribute("voMe",voMe);
		
		//거래내역에 쓰일 DB 추가
		
		BankVO voYou = bdao.selectone(idxYou);
		model.addAttribute("voYou",voYou);
		
		return MyCommon.Transfer.VIEW_PATH + "transfer_money_page.jsp";
	}
	
	//이체 페이지의 Ajax
	@RequestMapping("/transfer_amount.do")
	@ResponseBody
	public String transfer_amount(int idxMe, int idxYou, int amount) {
		int res = 0;
		
		res = bdao.update_deposit(idxYou, amount); // 상대방 계좌 입금
		res = bdao.update_withdrawal(idxMe, amount); // 내 계좌 출금
		
		String result = "";
		
		if(res>0) {
			result = "success";
		}
		
		return result;
	}
	
	//거래내역(상세보기)

	@Autowired
	DetailDAO detail_dao;
		
	@RequestMapping("/aac_view.do")
	public String bank_view(int idx, Model model) {

		BankVO vo = bdao.all_selectOne(idx);
		
		if (vo != null) {
			//idx에 해당되는 객체를 정상적으로 가져온 경우
			model.addAttribute("vo",vo);
		}
	
		if (vo==null) {			
			System.out.println("정보 없음");
		}
		
		return MyCommon.Detail.VIEW_PATH + "bank_view.jsp";
	}
	
	
	@RequestMapping("/det.do")
	public String bank_detail(Model model) {
		List<DetailVO> list = detail_dao.selectView();	
		model.addAttribute("list", list);
		return MyCommon.Detail.VIEW_PATH+ "bank_detail.jsp";
	}

	
	
	@RequestMapping("/detail_view.do")
	public String detail_view(Model model, int detail) {
		
		//거래내역 조회
		List<DetailVO> list=null;
		
		if (detail == 0) {
			list = detail_dao.selectView();
		} else {
			list = detail_dao.selectView(detail);
		}
				
		model.addAttribute("list", list);
		
		return MyCommon.Detail.VIEW_PATH + "bank_detail.jsp";
	}
	
	
	

}
