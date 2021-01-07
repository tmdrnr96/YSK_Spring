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
		
		//전체조회
	    public List<DetailVO> selectView(){
		List<DetailVO> list = sqlSession.selectList("d.detail");
		return list;
        }
	
		//오버로드
		public List<DetailVO> selectView(int detail){
		List<DetailVO> list = sqlSession.selectList("d.detail_list", detail);
		return list;
		}
	
	    //계좌 입금, 출금, 이체 시에 데이터 저장
		public int insert_detail(DetailVO vo) {
			
		int res = sqlSession.insert("d.detail_insert",vo);
					
			return res;
		}
		
}
