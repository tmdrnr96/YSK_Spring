package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.DetailVO;

public class DetailDAO {
	SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
		//
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
