package member.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import member.dao.MemberDao;
import member.model.Member;

public class JoinService {
	private MemberDao memberDao = new MemberDao();
	
	public void join(JoinRequest joinReq) {
		
		Connection con = null;
		try {
			con = ConnectionProvider.getConnectin();
			con.setAutoCommit(false);
			//try-resource는 아래에서 써야해서 못씀
			//try-resource는 try()안쪽에서 Connection을 선언해야함
		
		Member m = memberDao.selectById(con, joinReq.getId());
		//아이디중복검사
		//아이디중복검사와 아래의 insert가 같은 트랜잭션으로 일어나야함
		// = 같은 커넥션사용
		
		if (m != null) {
			JdbcUtil.rollback(con);
			throw new DuplicateIdException();
			// 중복된아이디가 있을때 사용자정의 예외발생해서 그쪽에서 처리(같은폴더내에 예외클래스파일)
		}
		
		Member member = new Member();
		member.setId(joinReq.getId());
		member.setName(joinReq.getName());
		member.setPassword(joinReq.getPassword());
		
		memberDao.insert(con, member);
		
		con.commit();
		// memberDao에게 일을 시킬 때 member를 담아서 시킴(그림에 있던거)
		// 위에 아이디 검사와 같은 커넥션을 사용해야함(트랜잭션)
		} catch (SQLException e) {
			JdbcUtil.rollback(con);
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}
}
