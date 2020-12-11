package article.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import article.model.Article;
import article.model.Writer;
import jdbc.JdbcUtil;

public class ArticleDao {
	
	//
	public List<Article> select(Connection conn, int pageNum, int size) throws SQLException{
		/* mysql쿼리 시작행과 몇 개인지를 받아야함
		 * String sql = "SELECT * FROM article ORDER BY article_no DESC " +"LIMIT ?, ?";
		 * //시작 row_num(zerobase), 갯수 //첫번째/ 
		 */	
		String sql = "SELECT rn, article_no, writer_id, writer_name, title, regdate, moddate, read_cnt "
				+ "FROM (SELECT article_no, writer_id, writer_name, title, regdate, moddate, read_cnt, ROW_NUMBER() "
				+ "OVER (ORDER BY article_no DESC) rn FROM article ) WHERE rn BETWEEN ? AND ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (pageNum-1) * size + 1);
			pstmt.setInt(2, pageNum * size);
			
			rs = pstmt.executeQuery();
			List<Article> result = new ArrayList<>();
			while(rs.next()) {
				result.add(convertArticle(rs));
			}
			
			return result;
		} finally {
			JdbcUtil.close(rs, pstmt);
		}
	
	}
	
	private Article convertArticle(ResultSet rs) throws SQLException {
		return new Article(rs.getInt("article_no"),
				new Writer(
					rs.getString("writer_id"),
					rs.getString("writer_name")
					),
				rs.getString("title"),
				rs.getTimestamp("regdate"),
				rs.getTimestamp("moddate"),
				rs.getInt("read_cnt")
				);
	}
	
	
	//게시글수 파악 쿼리(페이지수를 나누기 위해서)
	public int selectCount(Connection conn) throws SQLException {
		String sql = "SELECT COUNT(*) FROM article";//내장함수 COUNT(*)로 알아낼 수 있음
		
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				return rs.getInt(1);
			}
			return 0;
		} finally {
			JdbcUtil.close(rs, stmt);
		}
		
	}
	

	public Article insert(Connection conn, Article article) throws SQLException {
		//쓸 때 article no는 자동생성이므로 안넣어도 됨
		String sql = "INSERT INTO article "
				+ "(writer_id, writer_name, title, regdate, moddate, read_cnt) "
				+ "VALUES (?,?,?,SYSDATE,SYSDATE,0)";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql, new String[] {"article_no", "regdate", "moddate"});
			//conn.prepareStatement가 두번째 파라미터를 갖으면 그 배열로 만들어진 행을 가지고있음
			//=>아래에 pstmt.getGeneratedKeys()로 ResultSet에서 불러올 수 있음(SELECT처럼)
			pstmt.setString(1, article.getWriter().getId());
			pstmt.setString(2, article.getWriter().getName());
			pstmt.setString(3, article.getTitle());
		
			int cnt = pstmt.executeUpdate();

			if (cnt == 1) {
				rs = pstmt.getGeneratedKeys();
				int key = 0;
				Date regDate = null;
				Date modDate = null;
				if (rs.next()) {
					key = rs.getInt(1);
					regDate = rs.getTimestamp(2);
					modDate = rs.getTimestamp(3);
					return new Article(key, article.getWriter(), article.getTitle(), regDate,
							modDate, 0);
				}
			} else {
				return null;				
			}
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		
		return null;
	}
}