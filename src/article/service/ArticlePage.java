package article.service;

import java.util.List;

import article.model.Article;

public class ArticlePage {
	private int total; //전체 게시물 수
	private int currentPage; //현재 페이지
	private List<Article> content; // select한 데이터들
	private int totalPages; // 총 페이지 수
	private int startPage; // 시작 페이지  //페이지가 8정도에 있으면 6페이지가 시작페이지
	private int endPage; // 마지막 페이지  //페이지가 8정도에 있으면 10페이지가 마지막페이지
	
	public ArticlePage(int total, int currentPage, int size, List<Article> content) {
		this.total = total;
		this.currentPage = currentPage;
		this.content = content;
		
		if(total !=0) {
			this.totalPages = total / size;
			if (total % size >0) {
				this.totalPages++;
			}
			
			this.startPage = (currentPage-1) / 5 * 5 +1;
			this.endPage = Math.min(startPage + 4, totalPages);
		}
	}
	
	public boolean hasNoArticles() {
		return total == 0;
	}
	
	public boolean hasArticles() {
		return total > 0;
	}

	public int getTotal() {
		return total;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public List<Article> getContent() {
		return content;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}
	
	
	
}
