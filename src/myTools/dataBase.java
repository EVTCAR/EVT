package myTools;

import java.sql.Connection;  
import java.sql.DriverManager;  
import java.sql.PreparedStatement;  
import java.sql.ResultSet;  
import java.sql.SQLException;  
 
//import org.apache.log4j.Logger;  
 
public class dataBase {  
   // ʹ��log4j��¼��־  
  // private static Logger logger = Logger.getLogger(BaseDao.class);  
   // ��������  
	   private static final String DRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";  
	   // ����·��  
	   private static final String URL = "jdbc:sqlserver://localhost:1433;databaseName=������ϵͳ5.18";  
	   // �û���  
	   private static final String USERNAME = "sa";  
	   // ����  
	   private static final String PASSWORD = "sa12345";  
   //��̬�����  
   static {  
       try {  
           // ��������  
           Class.forName(DRIVER);  
       } catch (ClassNotFoundException e) {  
           e.printStackTrace();  
       }  
   }  
 
   /* 
    * ��ȡ���ݿ����� 
    */  
   public Connection getConnection() {  
       Connection conn = null;  
     //  logger.debug("��ʼ�������ݿ�"); 
       System.out.println("��ʼ�������ݿ�");
       try{  
           conn=DriverManager.getConnection(URL, USERNAME, PASSWORD);  
       }catch(SQLException e){  
           e.printStackTrace();  
         //  logger.error("���ݿ�����ʧ�ܣ�");
           System.out.println("���ݿ�����ʧ�ܣ�");
       }  
      // logger.debug("���ݿ����ӳɹ�"); 
       System.out.println("���ݿ����ӳɹ���");
       return conn;  
   }  
 
   /* 
    * �ر����ݿ����ӣ�ע��رյ�˳�� 
    */  
   public void close(ResultSet rs, PreparedStatement ps, Connection conn) {  
       if(rs!=null){  
           try{  
               rs.close();  
               rs=null;  
           }catch(SQLException e){  
               e.printStackTrace();  
             //  logger.error("�ر�ResultSetʧ��");  
           }  
       }  
       if(ps!=null){  
           try{  
               ps.close();  
               ps=null;  
           }catch(SQLException e){  
               e.printStackTrace();  
              // logger.error("�ر�PreparedStatementʧ��");  
           }  
       }  
       if(conn!=null){  
           try{  
               conn.close();  
               conn=null;  
           }catch(SQLException e){  
               e.printStackTrace();  
              // logger.error("�ر�Connectionʧ��");  
           }  
       }  
   }  
}  