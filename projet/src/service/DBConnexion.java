	package service;

	import java.sql.Connection;
	import java.sql.DriverManager;
	import java.sql.PreparedStatement;
	import java.sql.SQLException;

	public class DBConnexion {
		private final static String urlConnection = "jdbc:mysql://localhost:3306/sitemarchand?serverTimezone=UTC";
		private final static String login = "root";
		private final static String pwd = "abc123...";
		private static Connection connexion;
		public static PreparedStatement getPs(String query) {
			PreparedStatement ps = null;
			try {
				if (connexion == null || connexion.isClosed()) {
					Class.forName("com.mysql.cj.jdbc.Driver");
					connexion = DriverManager.getConnection(urlConnection, login, pwd);
					ps = connexion.prepareStatement(query);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return ps;
		}
		
		public static void close() {
			try {
				connexion.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	

