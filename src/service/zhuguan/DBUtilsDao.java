package service.zhuguan;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import dbutils.C3p0Utils;
import entity.User;
import entity.Task;
import entity.Plan;

public class DBUtilsDao {
	
	public List findAll() throws SQLException{
		QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
		String sql = "select * from t_task";
		List list = (List)runner.query(sql, new BeanListHandler(Task.class));
		return list;
	}
	
	public List findAll_wss() throws SQLException{
		QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
		String sql = "select * from t_task where task_state = 'δʵʩ' ";
		List list = (List)runner.query(sql, new BeanListHandler(Task.class));
		return list;
	}
	
	public List findWorker() throws SQLException{
		QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
		String sql = "select * from t_emp where flag = 3";
		List list = (List)runner.query(sql, new BeanListHandler(User.class));
		return list;
	}
	
	public User findWorker(String username) throws SQLException{
		QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
		String sql = "select * from t_emp where username = ?";
		User user = (User)runner.query(sql, new BeanHandler(User.class),username);
		return user;
	}
	
	public Task findTask(String id) throws SQLException{
		QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
		String sql = "select * from t_task where id = ?";
		Task task = (Task)runner.query(sql, new BeanHandler(Task.class),new Object[] {id});
		return task;
	}
	
	public List<Plan> findPlan(String id) throws SQLException{
		QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
		String sql = "select * from t_plan where task_id = ?";
		List<Plan> list = (List<Plan>)runner.query(sql, new BeanListHandler(Plan.class), id);
		return list;
	}
	
	public List<Plan> findPlan() throws SQLException{
		QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
		String sql = "select * from t_plan ";
		List<Plan> list = (List<Plan>)runner.query(sql, new BeanListHandler(Plan.class));
		return list;
	}
	
	public Plan findPlan_more(String id) throws SQLException{
		QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
		String sql = "select * from t_plan where id = ?";
		Plan plan = (Plan)runner.query(sql, new BeanHandler(Plan.class), id);
		return plan;
	}
	
	public List<Plan> query_plan(String plan_name, String task_id, String feedback, String begin, String end) throws SQLException{
		QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
		String sql = "select * from t_plan where plan_name like ? and task_id like ? and feedback like ? and plan_begin_date  like ? and  plan_end_date like ?";
		List<Plan> list = (List<Plan>)runner.query(sql, new BeanListHandler(Plan.class),plan_name, task_id, feedback, begin, end);
		return list;
	}
	
	public Boolean insert(Task task)throws SQLException{
		QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
		String sql = "insert into t_task(id, task_name,  task_begin_time,  task_end_time,  task_description,  task_state, staff_id,  emp_id) values(?,?,?,?,?,?,?,?)";
		int num = runner.update(sql,new Object[] {task.getId(), task.getTask_name(), task.getTask_begin_time(), task.getTask_end_time(),
				task.getTask_description(),task.getTask_state(), task.getStaff_id(), task.getEmp_id()});
		if(num>0) 
			return true;
		else 
			return false;
	}
	
	public Boolean update(String id,String state)throws SQLException{
		QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
		//System.out.println(username+super_id);
		String sql = "update t_task set task_state = ? where id = ?";
		int num = runner.update(sql,new Object[] {state, id});
		if(1>0) 
			return true;
		else 
			return false;
	}
	
	public Boolean delete(String id) throws SQLException{
		QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
		String sql = "delete from t_task where id = ?";
		int num = runner.update(sql,id);
		if(num>0) 
			return true;
		else 
			return false;
	}
}
