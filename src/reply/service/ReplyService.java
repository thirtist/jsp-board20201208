package reply.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import jdbc.ConnectionProvider;
import reply.dao.ReplyDao;
import reply.model.Reply;

public class ReplyService {
	private ReplyDao dao = new ReplyDao();
	
	public List<Reply> getReplyList(int articleNum) throws SQLException {
		Connection con = ConnectionProvider.getConnectin();
		List<Reply> list = dao.listReply(con, articleNum);
		return list;
	}

}
