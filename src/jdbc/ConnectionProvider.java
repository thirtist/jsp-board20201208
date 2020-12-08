package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionProvider {
	private static String url;
	private static String user;
	private static String password;
	
	static void setUrl(String url) {
		ConnectionProvider.url = url;
	}

	static void setUser(String user) {
		ConnectionProvider.user = user;
	}

	static void setPassword(String password) {
		ConnectionProvider.password = password;
	}

	public static Connection getConnectin() {
		Connection con = null;
		
		try {
			con = DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return con;
	}
}
