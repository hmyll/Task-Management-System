package dbutils;

import java.sql.SQLException;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class C3p0 {
	public static DataSource ds = null;
	static {
		ComboPooledDataSource cpds = new ComboPooledDataSource();
		try{
			cpds.setDriverClass("com.mysql.jdbc.Driver");
			cpds.setJdbcUrl("jdbc:mysql://localhost:3306/task?serverTimezone=UTC");
			cpds.setUser("root");
			cpds.setPassword("123");
			cpds.setInitialPoolSize(5);
			cpds.setMaxPoolSize(15);
			ds=cpds;
		} catch (Exception e){
			throw new ExceptionInInitializerError(e);
		}
	}
	public static void main(String[] args) throws SQLException {
		System.out.println(ds.getConnection());
	}

}
