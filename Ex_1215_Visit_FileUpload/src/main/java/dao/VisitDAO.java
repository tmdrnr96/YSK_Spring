package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.VisitVO;

public class VisitDAO {

	SqlSession sqlSession;
		
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//방명록 조회
	public List<VisitVO> selectList(){
	List<VisitVO> list = sqlSession.selectList("v.visit_list");
	
	return list;
	}
	
	//방명록 추가
	public int insert(VisitVO vo) {
	
		int res = sqlSession.insert("v.visit_insert", vo);
		
		return res;
	}
	
	//방명록 삭제
	public int delete(int idx) {
		
		int res = sqlSession.delete("v.visit_delete",idx);
	
		return res;
	}
	
	//게시글 수정을 위한 데이터 한 건 조회
	public VisitVO selectOne(int idx) {
		VisitVO vo = sqlSession.selectOne("v.visit_one",idx);
		return vo;
	}
	
	//해당 게시물 수정
	public int update(VisitVO vo) {
		int res = sqlSession.update("v.visit_update",vo);
		return res; 
	}
	
	
	
}
