package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.DetailVO;

@Repository
public class DetailDAO {

	@Autowired
	SqlSession sqlSession;

	    public List<DetailVO> selectView(){
		List<DetailVO> list = sqlSession.selectList("d.detail");
		return list;
        }
	
		//오버로드
		public List<DetailVO> selectView(int detail){
		List<DetailVO> list = sqlSession.selectList("d.detail_list", detail);
		return list;
		}
	
}
