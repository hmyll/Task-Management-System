package service.yuangong;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import dbutils.C3p0Utils;
import entity.Plan;
import entity.Task;
import entity.User;

public class DBUtilsDao {
	
	/*public List<Plan> findAll(String username) throws SQLException{
		QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
		String sql = "select * from t_plan where staff_id = ?";
		List<Plan> list = (List<Task>)runner.query(sql, new BeanListHandler(Task.class),username);
		return list;
	}*/
	
	public List<Task> findAll(String username) throws SQLException{
		QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
		String sql = "select * from t_task where staff_id = ?";
		List<Task> list = (List<Task>)runner.query(sql, new BeanListHandler(Task.class),username);
		return list;
	}	
	
	public List<Plan> findPlan() throws SQLException{
		QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
		String sql = "select * from t_plan ";
		List<Plan> list = (List<Plan>)runner.query(sql, new BeanListHandler(Plan.class));
		return list;
	}
	
	public Task findTask(String id) throws SQLException{
		QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
		String sql = "select * from t_task where id = ?";
		Task task = (Task)runner.query(sql, new BeanHandler(Task.class),new Object[] {id});
		return task;
	}
	
	public User findWorker(String username) throws SQLException{
		QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
		String sql = "select * from t_emp where username = ?";
		User user = (User)runner.query(sql, new BeanHandler(User.class),username);
		return user;
	}
	
	public List<Plan> query_plan(String plan_name, String task_id, String feedback, String begin, String end) throws SQLException{
		QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
		String sql = "select * from t_plan where plan_name like ? and task_id like ? and feedback like ? and plan_begin_date  like ? and  plan_end_date like ?";
		List<Plan> list = (List<Plan>)runner.query(sql, new BeanListHandler(Plan.class),plan_name, task_id, feedback, begin, end);
		return list;
	}
	
	public Plan findPlan_more(String id) throws SQLException{
		QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
		String sql = "select * from t_plan where id = ?";
		Plan plan = (Plan)runner.query(sql, new BeanHandler(Plan.class), id);
		return plan;
	}
	
	public String find_plan_worker(String plan_id) throws SQLException{
		Task task = findTask(plan_id);
		String staff_id = task.getStaff_id();
		User user = findWorker(staff_id);
		return user.getName();
	}
	
	public List findManager() throws SQLException{
		QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
		String sql = "select * from t_emp where flag = 2";
		List list = (List)runner.query(sql, new BeanListHandler(User.class));
		return list;
	}
	
	public List<Plan> findPlan(String id) throws SQLException{
		QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
		String sql = "select * from t_plan where task_id = ?";
		List<Plan> list = (List<Plan>)runner.query(sql, new BeanListHandler(Plan.class), id);
		return list;
	}
	
	public Boolean insert(Plan plan)throws SQLException{
		QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
		String sql = "insert into t_plan(id, plan_name,  plan_state,  feedback,  plan_begin_date,  plan_end_date,  plan_description,  plan_feedback,  task_id) values(?,?,?,?,?,?,?,?,?)";
		int num = runner.update(sql,new Object[] {plan.getId(), plan.getPlan_name(), plan.getPlan_state(), plan.getFeedback(), plan.getPlan_begin_date(),
				 plan.getPlan_end_date(), plan.getPlan_description(), plan.getPlan_feedback(), plan.getTask_id()});
		if(num>0) 
			return true;
		else 
			return false;
	}
	
	public Boolean update(String state,String feedback, String id)throws SQLException{
		QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
		String sql = "update t_plan set plan_state=?,feedback=? where id =? ";
		int num = runner.update(sql,new Object[] {state,feedback, id});
		if(num>0) 
			return true;
		else 
			return false;
	}
	
	public Boolean update(String state, String id)throws SQLException{
		QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
		String sql = "update t_task set task_state=? where id = ?";
		int num = runner.update(sql,new Object[] {state, id});
		if(num>0) 
			return true;
		else 
			return false;
	}
	public Boolean delete(String id) throws SQLException{
		QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
		String sql = "delete from t_plan where id = ?";
		int num = runner.update(sql,id);
		if(num>0) 
			return true;
		else 
			return false;
	}
}
