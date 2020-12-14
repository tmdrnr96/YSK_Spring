package com.korea.fileupload;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import vo.PhotoVO;

@Controller
public class FileuploadController {
	
	//@Autowired : 자동 주입(자동연결 , 자동injection)
	//Spring의 4개 영역을 객체 생성 없이 가져와 사용할 수 있도록 처리
	@Autowired
	ServletContext application; //Autowired에 의해 new를 하지 않고 사용이 가능하다 .(객체생성을 하지 않고)
	
	//이밖에도
	@Autowired
	HttpSession session;//세션 영역을 자동으로 생성한다던지..
	
	@Autowired
	HttpServletRequest request;//request영역을 자동으로 생성할 수 있다.!!
	

	
	public static final String VIEW_PATH = "/WEB-INF/views/";
	
	//입력 폼 띄우기
	@RequestMapping(value={"/","/insert_form.do"})
	public String insert_form() {
		return VIEW_PATH + "insert_form.jsp";
		
	}
	
	//파일 업로드
	@RequestMapping("/upload.do")
	public String upload( PhotoVO vo ) {
		
		request.getRemoteAddr(); //위의 Autowired로 인해 파라미터 없이 바로 사용할 수 있다.
		String webPath = "/resources/upload/";
		
		//절대경로의 위치 구하려면 ServletContext객체가 필요하다!!
		//이 객체를 Autowired라는 자동주입 기능으로 컨트롤러에 등록해 사용한다!!
		//webPath를 절대경로로 변경!
		String savePath = application.getRealPath(webPath);
		System.out.println(savePath);
		
//		String savePath = "c:/myupload";
		
		//업로드가 완료된 파일의 정보
		MultipartFile photo = vo.getPhoto();
		
		String filename = "no-file";
		
		//업로드 된 파일이 실제로 존재한다면..
		if(!photo.isEmpty()) {
			//업로드 된 실제 파일명을 가져와보자
			filename = photo.getOriginalFilename();
			System.out.println("파일명  :" + filename );
			
			//저장할 파일의 경로를 생성("c:/myupload/aa.jpg")
			File saveFile = new File(savePath, filename);
			
			//saveFile의 경로가 존재하지 않는다면!//파일클래스는 폴더만 만든다.
			if(!saveFile.exists()) {
				saveFile.mkdirs();//폴더 생성!
			}else {
				//이미 폴더가 있는 경우, 동일한 파일명이 존재할 경우
				//동일 파일명이 존재할 경우 업로드 시간을 붙여서 이름이 중복되는 것을 방지해 준다.
				
				//currentTimeMillis() : 1970년 1월 1일부터 현재까지 경과시간을 1/1000단위로 돌려준다.
				long time = System.currentTimeMillis();
				
				// 파일이름이 겹친다면 .. 시간_사진이름으로 filename을 변경한다.
				filename = String.format("%d_%s",time,filename);
				
				//filename이 바꼈으니 바뀐 파일이름으로 다시 저장!
				saveFile = new File(savePath, filename);
			}
			
			//myupload까지 접속
			try {
				//업로드를 위한 파일은 MultipartResolver라는 클래스가 지정해둔
				//임시저장소에 있는데, 임시저장소의 파일은 일정시간이 지나면 자동으로 삭제되기 떄문에
				//이를 방지하기 위해 개발자가 지정해둔 경로로 물리적으로 복사(Output)작업을 수행해야 한다.
				photo.transferTo(saveFile);
				//transferTo : 폴더를 실제 이미지파일로 바꿔준다.
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}//if( !photo.isEmpty() )
		
		//vo에 업로드가 완료된  실제 이미지명을 저장 
		vo.setFilename(filename);
		return "";
	}
}
