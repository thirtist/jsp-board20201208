package jdbc;

import java.sql.Connection;
import java.sql.SQLException;

public class JdbcUtil {

	public static void rollback(Connection con) {
		try {
			if(con != null) {
				con.rollback();				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void close(AutoCloseable... ins) {
		for (AutoCloseable i : ins) {
			if (i != null) {
				try {
					i.close();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}
}
