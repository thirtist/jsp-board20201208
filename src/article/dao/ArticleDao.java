package article.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import article.model.Article;

public class ArticleDao {

	public Article insert(Connection conn, Article article) throws SQLException {
		PreparedStatement pstmt = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		String sql = "INSERT INTO article "
				+ "(writer_id, writer_name, title, regdate, moddate, read_cnt) "
				+ "values (?,?,?,?,?,0)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, article.getWriter().getId());
		pstmt.setString(2, article.getWriter().getName());
		pstmt.setString(3, article.getTitle());
		pstmt.setTimestamp(4, toTimestamp(article.getRegDate()));
		pstmt.setTimestamp(5, toTimestamp(article.getModifiedDate()));
		
		
		
		if(insertedCount > 0) {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql2);
		}
		
	}
}
