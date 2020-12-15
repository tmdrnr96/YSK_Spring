package com.korea.param;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import vo.PersonVO;

@Controller
public class ParamController {

	public static final String VIEW_PAHT = "/WEB-INF/views/person/";
	
	@RequestMapping("/insert_form.do")
	public String insert_form() {
		
		return VIEW_PAHT + "insert_form.jsp";
	}
	
	@RequestMapping("/insert1.do") 
	//파라미터는 반드시 넘어오는 순서대로 받는다.(변수 이름도 넘어오는 파라미터와 이름을 똑같이 써준다)
	public String insert1(Model model, String name, int age, String tel) {
						//insert.do?name=홍길동&age=11&tel=010-2222-1211
	//받아온 파라미터를 바인딩 포워딩 하기위해 Model객체를 생성한다.(내장객체)
	//name, age, tel이 insert1() 메서드의 파라미터로 자동으로 넘어온다.
	//int형식은 형변환까지 자동으로 처리된다.
	PersonVO vo = new PersonVO();
	vo.setName(name);
	vo.setAge(age);
	vo.setTel(tel);
	
	model.addAttribute("vo", vo);
	
	return VIEW_PAHT + "insert_result.jsp";
		
	}
	
	@RequestMapping("/insert2.do")
	//파라미터로 넘어오는 데이터를 객체에 묶어서 보내기
	//vo에 변수명과 맞춰서 파라미터로 받는다.(파라미터를 vo로 통째로 받을 수 있다.)
	public String insert2(Model model, PersonVO vo) {
				//insert.do?name=홍길동&age=11&tel=010-2222-1211
		//파라미터로 넘어온 값을 vo에 속성이 일치하는 변수에 자동으로 추가해 준다.
		//(setter와 getter가 없으면 값을 저장하고 가져올 수 없음..)
		
		//만약에 vo에 있는 갯수와 파라미터의 갯수가 다르다면..? 받을 수 있다.
		//ex) vo에는 addr이 있는데 파라미터에는 addr이 없어도 값을 vo에 저장할 수 있다.
		
		model.addAttribute("vo",vo);
		
		return VIEW_PAHT + "insert_result.jsp";
		
	}
}
