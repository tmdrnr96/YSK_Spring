package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.GogekVO;

public class GogekDAO {

	SqlSession sqlSession;
	//sqlSession 없으면 맵퍼를 공유하지 못한다.
	/*
	 * public void setSqlsession(SqlSession sqlsession) { this.sqlSession =
	 * sqlsession; }
	 */
	
	//sqlsession은 context-2-mybatis에 만들어져 있음..
	public GogekDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//고객 정보 조회
	public List<GogekVO> selecList(){		
		List<GogekVO> list = sqlSession.selectList("gogek.gogek_list");
		return list;
	}
}
