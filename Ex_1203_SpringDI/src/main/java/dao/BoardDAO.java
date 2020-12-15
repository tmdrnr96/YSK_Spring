package dao;

import java.util.List;

public interface BoardDAO {

	//DAO에서 썻으면 하는 것을 추상메서드로 만들어준다.
	int insert(Object ob);
	List selectList();
	int update(Object ob);
	int delete(int idx);
	
	
}
