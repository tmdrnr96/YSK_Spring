package controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.GogekDAO;
import vo.GogekVO;

@Controller
public class GogekController {

	public static final String VIEW_PATH="/WEB-INF/views/gogek/";
	
	GogekDAO gogek_dao;

//	public GogekController(GogekDAO gogek_dao) {
//		this.gogek_dao = gogek_dao;
//	}
	
	//Setter Injection
	public void setGogek_dao(GogekDAO gogek_dao) {
		this.gogek_dao = gogek_dao;
	}
	
	@RequestMapping("/gogek.do")
	public String list(Model model) {
		
		//dao로 부터 고객목록을 가져온다.
		List<GogekVO> list = gogek_dao.selecList();
		
		//바인딩
		model.addAttribute("list",list);
		
		//포워딩
		return VIEW_PATH + "gogek_list.jsp";
	}
	
	
}
