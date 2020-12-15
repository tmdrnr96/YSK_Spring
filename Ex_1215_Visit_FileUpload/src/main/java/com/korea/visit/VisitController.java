package com.korea.visit;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import common.MyCommon;
import dao.VisitDAO;
import vo.VisitVO;

@Controller
public class VisitController {	

	@Autowired
	//절대경로를 구하기 위한 객체
	ServletContext application; 
	
	@Autowired
	HttpServletRequest reqeust;
	
	VisitDAO visit_dao;
	
	public void setVisit_dao(VisitDAO visit_dao) {
		this.visit_dao = visit_dao;
	}
	
	//방명록 전체 조회
	@RequestMapping(value={"/","/list.do"})
	public String list(Model model) {
		
		List<VisitVO> list = visit_dao.selectList();
				
		model.addAttribute("list",list);
		
		return MyCommon.Visit.VIEW_PATH + "visit_list.jsp";
	}
	
	//새글쓰기 폼으로 이동
	@RequestMapping("/insert_form.do")
	public String insert_form() {
		
		return MyCommon.Visit.VIEW_PATH + "visit_insert_form.jsp";
	}
	
	//새글 작성
	@RequestMapping("insert.do")
	public String insert(VisitVO vo) {
				
		//ip구하기
		String ip = reqeust.getRemoteAddr();
		vo.setIp(ip); //vo에 ip셋팅
		
		//업로드 될 파일의 정보를 가져오기 및 경로잡기
		String webPath = "/resources/upload/";
		
		String savePath = application.getRealPath(webPath);//이미지를 저장할 절대경로
		System.out.println(savePath);
		
		//업로드된 파일의 정보
		MultipartFile photo = vo.getPhoto();
		
		String filename = "no_file";
		
		//업로드 된 파일이 실제로 존재하는지 확인
		if(!photo.isEmpty()) {
			//방명록에 사진을 등록할 예정
			filename = photo.getOriginalFilename();
			
			//저장할 파일의 경로잡기
			File saveFile = new File(savePath, filename);
			
			if(!saveFile.exists()) {
				saveFile.mkdirs();//없는 폴더를 생성
			}else {
				//동일 파일명 방지
				long time = System.currentTimeMillis();
				filename = String.format("%d_%s",time,filename);
				
				//바뀐 파일명으로 경로 재설정
				saveFile = new File(saveFile,filename); 
			}
				//멀티파트 리졸버가 임시저장소에 넣어둔 파일을 내가 지정한 경로로 복사
			try {
				photo.transferTo(saveFile);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 			
		}
		
		vo.setFilename(filename);
		
		//vo를 통해 DB에 데이터를 추가
		visit_dao.insert(vo);
			
		//jsp와 같은 view가 아닌 url매핑을 호출하고 싶은 경우
		return "redirect:list.do";//jsp의 sendRedirect("list.do")와 같다고 보면 된다!	
	}
	
	//방명록 삭제
	@RequestMapping("/delete.do")
	@ResponseBody //return값을 jsp등의 view로 인식하지 않고 Ajax의 콜백 메서드로 돌려주기 위한 어노테이션(return resultStr;)(Ajax시 필수!)
	public String delete(int idx) {
		//delete.do?idx=2
		//res가 잘 지워졌으면 1 아니면 0
		int res = visit_dao.delete(idx);
		
		//제이슨ㅇ
		String result = "no";
		String resultStr = String.format("[{'res':'%s'}]",result);
		
		if(res != 0) {//삭제성공시 들어오는 if문
			result = "yse";
			resultStr = String.format("[{'res':'%s'}]", result); 
		}
		//return "[{'res':'no'}]";
		return resultStr;
	}
	
	//방명록 수정을 위한 폼으로 이동
	@RequestMapping("/modify_form.do")
	public String modify_form(Model model, int idx) {
		//파라미터로 넘어온 idx에 해당하는 게시물의 정보를 조회
		VisitVO vo = visit_dao.selectOne(idx);
		
		//vo가 정상적으로 조회가 안되었다면 null로 반환
		
		if(vo != null) {
			//idx에 해당되는 객체를 정상적으로 가져온 경우
			model.addAttribute("vo",vo);
		}
		
		return MyCommon.Visit.VIEW_PATH + "visit_modify_form.jsp";	
	}
	
	@RequestMapping("/modify.do")
	@ResponseBody
	public String modify(VisitVO vo, HttpServletRequest request) {
		
		//visit_modify_form.jsp에서 넘겨준
		//idx, name, context, pwd를 파라미터 vo가 한번에 받는다.
		
		String ip = request.getRemoteAddr();
		vo.setIp(ip);
		
		int res = visit_dao.update(vo);
		
		//제이슨 x
		String result = "no";
		
		if(res != 0) {//정상적으로 수정되었다면!
			result = "yes";
		}
		
		//yes, no라는 문장을 콜백메서드로 전송
		return result;
		
	}
	
}
