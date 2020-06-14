package service.admin;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import dbutils.C3p0Utils;
import entity.User;

public class DBUtilsDao {
	
	public List findAll() throws SQLException{
		QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
		String sql = "select * from t_emp";
		List list = (List)runner.query(sql, new BeanListHandler(User.class));
		return list;
	}
	
	public List findSuper() throws SQLException{
		QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
		String sql = "select * from t_emp where flag=3 and super_id is null";
		List list = (List)runner.query(sql, new BeanListHandler(User.class));
		return list;
	}
	
	public User find(String username) throws SQLException{
		QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
		String sql = "select * from t_emp where username = ?";
		User user = (User)runner.query(sql, new BeanHandler(User.class),new Object[] {username});
		return user;
	}
	
	public List findManager() throws SQLException{
		QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
		String sql = "select * from t_emp where flag = 2";
		List list = (List)runner.query(sql, new BeanListHandler(User.class));
		return list;
	}
	
	public Boolean insert(User user)throws SQLException{
		QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
		String sql = "insert into t_emp(username, name,  password,  sex,  birthday,  hire_date,  position,  qualification,  experience,  flag,  super_id) values(?,?,?,?,?,?,?,?,?,?,?)";
		int num = runner.update(sql,new Object[] {user.getUsername(),user.getName(),user.getPassword(),user.getSex(),user.getBirthday(),user.getHire_date(),
				user.getPosition(),user.getQualification(),user.getExperience(),user.getFlag(),user.getSuper_id()  });
		if(num>0) 
			return true;
		else 
			return false;
	}
	
	public Boolean update(String username,String super_id)throws SQLException{
		QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
		//System.out.println(username+super_id);
		String sql = "update t_emp set super_id=? where username=?";
		int num = runner.update(sql,new Object[] {super_id, username});
		if(1>0) 
			return true;
		else 
			return false;
	}
	
	public Boolean delete(String username) throws SQLException{
		QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
		String sql = "delete from t_emp where username = ?";
		int num = runner.update(sql,username);
		if(num>0) 
			return true;
		else 
			return false;
	}
}
