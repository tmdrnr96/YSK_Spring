package com.korea.bbs;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import common.Common;
import common.Paging;
import dao.BoardDAO;
import vo.BoardVO;


@Controller
public class BoardController {
	
	BoardDAO board_dao;
	public void setBoard_dao(BoardDAO board_dao) {
		this.board_dao = board_dao;
	}
	
	@Autowired
	HttpServletRequest request;
	
	//게시글 전체목록 조회
	@RequestMapping(value = {"/","/list.do"})
	public String list(Model model, Integer page) {
		
		int nowPage = 1;//기본페이지는 1페이지로!!
		
		if( page != null) {
			nowPage = page;
		}
		
		//한 페이지에 표시될 게시물의 시작과 끝번호를 계산
		int start = (nowPage - 1) * Common.Board.BLOCKLIST + 1;
		int end = start + Common.Board.BLOCKLIST - 1;
		
		//start와 end를 map에 저장 //Spring에서는 제너릭 타입을 넣어줘야한다.(new HashMap<String, Integer>)
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put( "start", start );
		map.put( "end", end );
		
		List<BoardVO> list = board_dao.selectList( map );
		
		//전체 게시물의 갯수
		int row_total = board_dao.getRowTotal();
		
		//페이지 하단 메뉴 생성하기
		String pageMenu = Paging.getPaging(
				"list.do", nowPage, row_total, 
				Common.Board.BLOCKLIST, 
				Common.Board.BLOCKPAGE);
		
		model.addAttribute("list", list);
		model.addAttribute("pageMenu", pageMenu);
		
		//조회수 증가를 위해 세션에 저장해뒀던 데이터를 삭제
		request.getSession().removeAttribute("show");
		
		return Common.Board.VIEW_PATH + "board_list.jsp";
	}//list()
	
	//게시글 상세보기
	@RequestMapping("/view.do")
	public String view(Model model, int idx) {
		
		//idx에 해당하는 게시글 정보 한건 얻어오기(vo로 받기)
		BoardVO vo = board_dao.selectOne(idx);
		
		//세션에 저장된 값이 있는지 조회
		HttpSession session = request.getSession();
		String show = (String)session.getAttribute("show");
		
		if(show == null) {
			//idx에 해당하는 게시글의 조회수를 증가
			board_dao.update_readhit(idx);
			session.setAttribute("show", "a");
		}
		
		model.addAttribute("vo", vo);
		
		return Common.Board.VIEW_PATH + "board_view.jsp";
	}//view()
	
	//답글작성을 위한 페이지로 이동
	@RequestMapping("/reply_form.do")
	public String reply_form() {
		return Common.Board.VIEW_PATH + "board_reply.jsp";
	}
	
	//댓글작성하기
	@RequestMapping("/reply.do")
	public String reply(BoardVO vo, String page) {
		
		//댓글을 달고싶은 idx에 해당하는 원본 게시글의 정보를 얻어오기
		BoardVO baseVO = board_dao.selectOne(vo.getIdx());
		
		//기준글의 step보다 큰 값은 step+1처리
		int res = board_dao.update_step( baseVO );
		
		//댓글을 VO로 포장
		String ip = request.getRemoteAddr();
		
		vo.setIp(ip);
		vo.setRef(baseVO.getRef());
		vo.setStep(baseVO.getStep() + 1);
		vo.setDepth(baseVO.getDepth() + 1);
		
		//댓글등록
		res = board_dao.reply(vo);

		return "redirect:list.do?page="+page;
	}
	
	//새글등록을 위한 페이지로 전환
	@RequestMapping("/insert_form.do")
	public String insert_form() {		
		return Common.Board.VIEW_PATH + "board_write.jsp";
	}
	
	//게시글 등록(새글)
	@RequestMapping("/insert.do")
	public String insert(BoardVO vo) {
		
		//접속자의 ip
		String ip = request.getRemoteAddr();
		
		//DAO로 전달할 파라미터들을 vo에 포장	
		vo.setIp(ip);
		
		board_dao.insert(vo);
		
		return "redirect:list.do"; 
	}
	
	//게시글 삭제
	@RequestMapping("/del.do")
	@ResponseBody//Ajax 호출시 콜백메서드로 결과값을 보내는 어노테이션
	public String del(BoardVO vo) {
		
		//삭제를 위한 게시글의 정보를 얻어온다
		BoardVO baseVO = board_dao.selectOne(vo.getIdx());
		
		baseVO.setSubject("이미 삭제된 게시글 입니다");
		baseVO.setName("unknown");
		//게시글이 삭제된 것 처럼 업데이트
		int res = board_dao.del_update(baseVO);
		
		String result = "no";
		if( res == 1 ) {
			result = "yes";
		}
		
		//@ResponseBody를 명시해놨기 때문에 result값이 콜백메서드로 전달된다.
		return result;
		
	}
}
