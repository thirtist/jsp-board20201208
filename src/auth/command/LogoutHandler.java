package auth.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mvc.command.CommandHandler;

public class LogoutHandler implements CommandHandler {
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		HttpSession session = req.getSession(false); //boolean파라미터가 없는건 세션이 없을 때 세션을 만듦 
		if (session != null) {						 //false면 session이 없으면 새로운 세션을 만들지 않음
			session.invalidate();  //세션이 날라감
		}
		res.sendRedirect(req.getContextPath() + "/index.jsp");
		return null;
	}
}
