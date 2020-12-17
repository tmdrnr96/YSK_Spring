package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import vo.BoardVO;

public class BoardDAO {
	
	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
		
	//전체게시물 조회
	public List<BoardVO> selectList(){
		List<BoardVO> list = null;
		list = sqlSession.selectList("b.board_list");		
		return list;
		
	}
	
	//새글 추가
		public int insert(BoardVO vo) {
			
			//SqlSession sqlSession = factory.openSession(true); ture : 오토 커밋
			//ture를 안 넣고 sqlSession.commit();으로 대신할 수 있음..
			int res = sqlSession.insert("b.board_insert", vo);
			//sqlSession.commit();//select를 제외하고 commit을 해줘야한다.
			
			//sqlSession.commit();-->
			//factory.openSession(true); 이 코드로 대체 가능!!

			return res;
		}
	//상세보기를 위한 게시물 조회
		public BoardVO selectOne(int idx){
			BoardVO vo = null;
			vo = sqlSession.selectOne("b.board_one",idx);									
			return vo;
			
		}
	//조회수 증가
			public int update_readhit(int idx) {				
			int res = sqlSession.update("b.board_update_readhit",idx);
			return res;
		
			}
	//댓글처리를 위한 step값 증가
			public int update_step(BoardVO baseVO) {				
				int res = sqlSession.update("b.board_update_step", baseVO);
				return res;
			}
		
			//댓글달기
			public int reply(BoardVO vo) {
				int res = sqlSession.insert("b.board_reply",vo); 
				return res;
			}
			
			//게시글 삭제
			public int del_update(BoardVO baseVO){
				int res = sqlSession.update("b.board_del",baseVO); 
				return res;
			}
			
			//페이지별 게시물 조회
			public List<BoardVO> selectList( Map<String, Integer> map ){
				
				List<BoardVO> list = null;
				list = sqlSession.selectList("b.board_list_condition", map);			
				return list;
			}
			
			//전체 게시물 수 구하기
			public int getRowTotal() {
				int count = sqlSession.selectOne("b.board_count");
				return count;
			}

			
}
