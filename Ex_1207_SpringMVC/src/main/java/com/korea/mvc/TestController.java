package com.korea.mvc;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller //반드시 어노테이션은 만들어 놔야한다..
public class TestController {
	
	//servlet-context에 있는 경로대로 설정하게 되면 파일을 나눌수 없음으로.. 
	//아래처럼  상수로 경로를 지정해 준다.
	public static final String VIEW_PATH="/WEB-INF/views/test/";
	
	//부모 자식 관계
	//@Component
	//  ㄴ@Controller
	//		ㄴ@Service
	//			ㄴ@Repository
	
	//servlet-context에 
	//<context:component-scan base-package="com.korea.mvc" />
	//로 인해 생성된다.
	public TestController() {		
		System.out.println("---TestController의 생성자---");
	}
	
	@RequestMapping("/test.do")
	//Model은 자동으로 객체생성이 된다.(내장 객체) 
	//HttpServletRequest request jsp에서 request에서 쓰는 방법(ip구하기)
	public String test(Model model, HttpServletRequest request) {
	
		String[] msg = {"사과", "배","포도","오렌지","바나나" }; 
		
		//model을 통해서 msg를 바인딩
		//model에 저장하던 request에 저장하던 상관없음..
		//하지만 model이 request보다 가볍기 때문에 대부분 model에 저장한다.
		model.addAttribute("msg",msg);
		
		//model로는 ip를 구할 수 없기 때문에 request로 구해준다.
		String ip = request.getRemoteAddr();
		request.setAttribute("ip", ip);
		
		
		//포워딩(상수값으로 지정한 경로를 넣어준다.)
		return VIEW_PATH + "test.jsp";
	}
	
	//msg와 ip를 묶어서 바인딩하기..
	@RequestMapping("/test2.do")
	public ModelAndView test2(HttpServletRequest request) {
	//데이터와 뷰 정보를 하나로 포장해서 전달하기 위한 클래스
		ModelAndView mv = new ModelAndView();
		String ip = request.getRemoteAddr();
		
		String[] msg = {"홍길동","박길동","김길동"};
		
		//mv에 데이터를 담는다(정보를 묶어서 저장!)(바인딩)
		mv.addObject("ip",ip);//바인딩
		mv.addObject("msg",msg);//바인딩
		
		//mv를 담은 데이터를 포워딩
		mv.setViewName(VIEW_PATH + "test.jsp");//포워딩
		
		//담은 정보를 가지고 이동!
		return mv;
	}
	//(기본적으로는 잘 쓰질 않으나.. 기억은 해놓자)
	//한번에 묶어서 바인딩을 하는 방법도 있으나 코드 길이 상으로는 차이가 없기 때문에
	//묶어서 바인딩해도 되고, 따로따로 하나씩 바인딩해서 포워딩해도 된다.
	
	
}









