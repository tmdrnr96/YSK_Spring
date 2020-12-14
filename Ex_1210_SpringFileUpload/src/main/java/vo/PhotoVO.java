package vo;

import org.springframework.web.multipart.MultipartFile;

public class PhotoVO {

	//	제목 : <input name = "title">
	//	사진 : <input type = "file" name = "photo">
	// 반드시 각 input의 name속성인 title과 photo라는 이름으로 변수를 지정해줘야한다.
	private String title; //제목
	
	//파일을 받아서 저장하기 위한 클래스
	//사진 클래스를 저장하기 위해서는 MultipartFile로 받아준다.
	private MultipartFile photo;
	
	private String filename;//업로드가 완료된 파일의 이름 

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public MultipartFile getPhoto() {
		return photo;
	}

	public void setPhoto(MultipartFile photo) {
		this.photo = photo;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	
}
