package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.DeptVO;
import vo.GogekVO;

public class DeptDAO {

	//sqlSession.selectList();
	//context-3 번에서 값을 채워 넣음..
	SqlSession sqlsession;
	
	//어떤 DB로 연결할지에 대한 정보를 context-2에 SqlsessionBean에서 받는다.
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}
	
	//부서정보 조회
	public List<DeptVO> selectList(){
		List<DeptVO> list = sqlsession.selectList("dept.dept_list");
		//jsp에선 sqlsession을 close를 수동으로 써줬지만 spring에서는 자동으로 
		//닫아주기 때문에 close;를 따로 해줄 필요가 없다.
		return list;
	}
	

	
}
