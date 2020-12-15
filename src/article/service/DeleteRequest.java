package article.service;

public class DeleteRequest {
	private int articleNumber;
	private String userId;
	
	public DeleteRequest(int articleNumber, String userId) {
		super();
		this.articleNumber = articleNumber;
		this.userId = userId;
	}

	public int getArticleNumber() {
		return articleNumber;
	}

	public String getUserId() {
		return userId;
	}	
	
}
