package dbutils;

import java.sql.*;

public class JDBCUtils {
	//�����������������ݿ�����
	public static Connection getConnection() throws SQLException,
	ClassNotFoundException{
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/test?serverTimezone=UTC";
		String username = "root";
		String password = "123";
		Connection conn = DriverManager.getConnection(url,username,password);
		return conn;
	}
	//�ر����ݿ����ӣ��ͷ���Դ
	public static void relese(Statement stmt, Connection conn){
		if(stmt!=null){
			try{
				stmt.close();
			} catch(SQLException e){
				e.printStackTrace();
			}
		} 
		if(conn!=null){
			try{
				conn.close();
			} catch(SQLException e){
				e.printStackTrace();
			}
		} 	
	}
	public static void release(ResultSet rs,Statement stmt, Connection conn){
		if(rs!=null){
			try{
				rs.close();
			} catch(SQLException e){
				e.printStackTrace();
			}
		} 
		relese(stmt,conn);
	}
}
