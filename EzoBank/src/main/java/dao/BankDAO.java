package dao;

import java.util.List;

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
	public BankVO find_id_selectOne(BankVO vo) {		
		BankVO bankvo = sqlSession.selectOne("bank.bank_find_id",vo);
		return bankvo;
	}
	
	//회원 비밀번호 찾기
	public BankVO find_pwd_selectOne(BankVO vo){	
		BankVO list = sqlSession.selectOne("bank.bank_find_pwd", vo);
		return list;
	}
	
	//회원 비밀번호 변경
	public int password_update(BankVO vo) {	
		int res = sqlSession.update("bank.bank_change_password",vo);
		return res;
	}
	
	//로그인
	public BankVO login(BankVO vo) {
		BankVO bankvo = sqlSession.selectOne("bank.bank_login",vo);
		return bankvo;
	}

	
}
