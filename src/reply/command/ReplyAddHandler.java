package reply.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import auth.service.User;
import mvc.command.CommandHandler;
import reply.service.ReplyAddService;

public class ReplyAddHandler implements CommandHandler {
	private ReplyAddService addService = new ReplyAddService();
	
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("authUser");
		
		int articleNo = Integer.parseInt(req.getParameter("no"));	
		String userId = user.getId();
		String body = req.getParameter("body");
		addService.add(userId, articleNo, body);
		
		return "replyAddSuccess";
	}

}
