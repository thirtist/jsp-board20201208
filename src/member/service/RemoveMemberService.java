package member.service;

import java.sql.Connection;
import java.sql.SQLException;

import auth.service.User;
import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import member.dao.MemberDao;
import member.model.Member;

public class RemoveMemberService {
	private MemberDao memberDao = new MemberDao();

	public void removeMember(User user, String password) {
		
		Connection conn = null;
		try {
			//0.커넥션얻기
			conn = ConnectionProvider.getConnectin();
			conn.setAutoCommit(false);
			//1. dao의 selectById로 member객체 얻기
			Member member = memberDao.selectById(conn, user.getId());
			//  1.1 member없으면 MemberNotFoundException 발생
			if (member == null) {
				throw new MemberNotFoundException();
			}
			//  1.2 패스워드가 맞지 않으면 InvalidPasswordException 발생
			if (!member.matchPassword(password)) {
				throw new InvalidPasswordException();
			}
			//2. delete() 실행
			memberDao.delete(conn, user.getId());
			conn.commit();
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn);
		}

	}

}
