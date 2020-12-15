package article.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import article.service.ArticleNotFoundException;
import article.service.DeleteArticleService;
import article.service.DeleteRequest;
import article.service.PermissionDeniedException;
import auth.service.User;
import mvc.command.CommandHandler;

public class DeleteArticleHandler implements CommandHandler {
	private DeleteArticleService deleteService = new DeleteArticleService();

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {

		String noVal = req.getParameter("no");
		int no = Integer.parseInt(noVal);

		
		User user = (User) req.getSession(false).getAttribute("authUser");
		DeleteRequest delReq = new DeleteRequest(no, user.getId());
		
		// 삭제실행
		try {
			deleteService.delete(delReq);
			return "deleteArticleSuccess";
		} catch (ArticleNotFoundException e) {
			res.sendError(HttpServletResponse.SC_NOT_FOUND);
			return null;
		} catch (PermissionDeniedException e) {
			res.sendError(HttpServletResponse.SC_FORBIDDEN);
			return null;
		}

	}
}
