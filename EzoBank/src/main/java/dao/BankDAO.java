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
		BankVO vo = null;
		vo = sqlSession.selectOne("bank.bank_id_check",id);		
		return vo;
	}
	
	//회원 정보 추가
	public int insert(BankVO vo) {
		System.out.println(vo.getEmail());
		int res = sqlSession.insert("bank.bank_account_insert",vo);		
		return res;
	}
}
