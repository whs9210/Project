package com.champion.mvc01;
import java.sql.DriverManager;
import java.sql.SQLException;

public class connect {

	public static void main(String[] args) {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String user = "root";
		String password = "1234";
		
		try {
			Class.forName(driver);
			System.out.println("jdbc driver 로딩 성공");
			DriverManager.getConnection(url, user, password);
			System.out.println("오라클 연결 성공");
			
		}catch (ClassNotFoundException e) {
			System.out.println("jdbc driver 로딩 실패");
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println("오라클 연결 실패");
		}
	}

}
