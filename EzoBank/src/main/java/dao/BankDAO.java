package dao;

import org.apache.ibatis.session.SqlSession;

import vo.BankVO;

public class BankDAO {

	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//아이디 중복 체크
	public BankVO selectOne(String id){
		BankVO vo = sqlSession.selectOne("bank.bank_id_check",id);	
		return vo;
	}
	
	//회원 정보 추가
	public int insert(BankVO vo) {		
		int res = sqlSession.insert("bank.bank_account_insert",vo);		
		return res;
	}
	
	//회원 아이디 찾기
	public BankVO find_id_selectOne(String ssn) {
		
		BankVO vo = sqlSession.selectOne("bank.bank_find_id",ssn);
		
		return vo;
	}
}
