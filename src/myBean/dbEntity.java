package myBean;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import myTools.dbUtil;

public class dbEntity {
	
	private dbUtil db;
	public dbEntity(){
		 db= new dbUtil();
	}
	
	public int dbResu(){
		return db.getResu();
	}
	public ResultSet getResultSet(){
		return db.getResultSet();
	}
	/**
	 * 保存预约订单
	 * @param pras CSID,USid,USOrdDate,USOrdStartTime,USOrdEndTime,USOrdStatue,USOrdType,USOrdCsName,USOrdCsAddr
	 * @return
	 */
	public boolean SaveOrder(String...pras){
		String checkConditon = "INSERT INTO UserOrderInf(CSID,USid,USOrdDate,USOrdStartTime,USOrdEndTime,USOrdStatue,USOrdType,USOrdCsName,USOrdCsAddr) VALUES(?,?,?,?,?,?,?,?,?)";
		db.update(checkConditon, pras);
		if(this.dbResu()!=0) { //�������ɹ�
			System.out.println("---------SaveOrder:保存订单成功");
	    	return true;
		}
		else {
			System.out.println("---------SaveOrder:保存订单失败");
			 return false;
		}
	}
	
	/**
	 * 保存订单消息;
	 * @param pras
	 * @return
	 */
	public boolean saveMsg(String...pras){
		String checkConditon = "INSERT INTO UserMessageInf(MsgType,MsgValue,MsgCreatTime,USid,MsgState) VALUES(?,?,?,?,'1')";
		db.update(checkConditon, pras);
		if(this.dbResu()!=0) { //�������ɹ�
			System.out.println("---------SaveMsg:生成消息成功");
	    	return true;
		}
		else {
			System.out.println("---------SaveMsg:生成消息失败");
			 return false;
		}
	}
	

	/**
	 * 查询订单消息
	 * @param 
	 * @param pras "createOrd" 查询生成的订单消息
	 * @return
	 */
	public List<messageAlert> checkOrdMsg(String... pras){
		 String checkConditon = "SELECT * from UserMessageInf where MsgType = ? and USid = ?";
		 List<messageAlert> msgList = null;
		 try {
			 ResultSet rs =  db.query(checkConditon, pras);
			 messageAlert msg ;
				while(rs.next()) { 
					msg = new messageAlert(rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5) );
					msgList.add(msg);
				}
			    
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return null;
			}
		 return msgList;
	}
	

	/**
	 * 查询订单ID
	 * @param 
	 * @param pras
	 * @return
	 */
	public boolean checkOrdId(String... pras){
		 String checkConditon = "SELECT USOrdId from UserOrderInf where CSID = ? and USid = ? and USOrdDate = ?";
		 try {
			 db.query(checkConditon, pras);
				if(db.getResultSet().next()) { 
					return true;
				}
				else {
					 return false;
				}
			    
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return false;
			}
	}
	
	/**
	 * 
	 * @param checkConditon
	 * @param pras
	 * @return
	 */
	public boolean checkPhone(String... pras){
		 String checkConditon = "SELECT TELEPHONE FROM ((SELECT TELEPHONE FROM teacher) UNION (SELECT TELEPHONE FROM student)) AS NEWPHONE WHERE TELEPHONE = ? ";
		 try {
			 db.query(checkConditon, pras);
				if(db.getResultSet().next()) { //����������
					return true;
				}
				else {
					 return false;
				}
			    
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return false;
			}
	}
	public boolean checkEmail(String... pras){
		 String checkConditon = "SELECT EMAIL FROM ((SELECT EMAIL FROM teacher) UNION (SELECT EMAIL FROM student)) AS NEWEMAIL WHERE EMAIL = ? ";
		 try {
	        	db.query(checkConditon, pras);
				if(db.getResultSet().next()) { //����������
					return true;
				}
				else {
					 return false;
				}
			    
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return false;
			}
	}
	/**
	 * ��ʦע��
	 * @param pras
	 * @return
	 */
	public boolean registerTeacher(String...pras){
		String checkConditon = "INSERT INTO teacher (TID,REALNAME,TELEPHONE,PASSWORD) VALUES(?,?,?,?)";
		db.update(checkConditon, pras);
		if(this.dbResu()!=0) { //���ע��ɹ�
	    	return true;
		}
		else {
			 return false;
		}
	}
	
	public ResultSet findIdByAll(){ 
		String checkConditon = "select * from UniqueId";
		db.query(checkConditon);
		return db.getResultSet();
	}
	
	public ResultSet findIdByName(String name){
		String checkConditon = "select * from UniqueId where unique_id_name = ?";
		db.query(checkConditon, name);
		return db.getResultSet();
	}

	
}
