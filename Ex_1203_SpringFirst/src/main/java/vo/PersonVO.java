package vo;

public class PersonVO {

	private String name;
	private int age;
	private String tel;

	public PersonVO() {
		System.out.println("---PersonVO가 생성됨---");
	}

	public PersonVO(String name, int age, String tel) {
		System.out.println("--- 파라미터를 세 개 받는 생성자 ---");
		this.name = name;
		this.age = age;
		this.tel = tel;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		System.out.println("setName 호출됨...");
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}


}
