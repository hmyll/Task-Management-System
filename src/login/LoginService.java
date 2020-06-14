package login;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import dbutils.C3p0Utils;
import entity.User;

public class LoginService {
	
	public String login(String username,String password,String flag) throws SQLException{
		C3p0Utils c3p0 = new C3p0Utils();
		User user = new User();
		QueryRunner runner = new QueryRunner(c3p0.getDataSource());
		String sql = "select * from t_emp where username = ? and password = ? and flag = ?";
		user = (User)runner.query(sql, new BeanHandler(User.class),new Object[] {username,password,flag});
		if(user!=null)
			return user.getName();
		else return null;
	}

}
