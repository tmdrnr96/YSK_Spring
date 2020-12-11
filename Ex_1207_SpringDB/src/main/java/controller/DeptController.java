package controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.DeptDAO;
import vo.DeptVO;

@Controller
public class DeptController {
	//jsp의 서블릿 대신에 쓰이는 controller
//controller에서 DAO를 가지고 있어야한다.
	
	//jsp실행 경로 준비!
	public static final String VIEW_PATH="/WEB-INF/views/dept/";
	
	
	DeptDAO dept_dao;
	
	//Source- > constructor Using filds (생성자 자동생성)
	//생성자 인젝션
	public DeptController(DeptDAO dept_dao) {
		this.dept_dao = dept_dao;
	}
	
	//셋터 인젝션 (Setter Injection)
//	public void setDept_dao(DeptDAO dept_dao) {
//		this.dept_dao = dept_dao;
//	}
	//컨트롤러는 맵핑을 여러개 잡을 수 있다.
	//맵핑을 중복되면 안된다..
	@RequestMapping(value={"/","/list.do"})
	public String list(Model model) {
		//dao로 부터 부서 목록을 요청
		List<DeptVO> list = dept_dao.selectList();
		
		//model을 통해 list를 바인딩
		model.addAttribute("list", list);
		
		//포워딩
		return VIEW_PATH + "dept_list.jsp";//포워딩
	}
	
	
}
