	package myServlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.Writer;
import java.net.Socket;
import java.util.ArrayList;
import java.util.List;
import myBean.csInformation;
import myBean.position;

import java.util.Date;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.mail.iap.Response;

//import net.sf.json.JSONObject;


public class dealQuery extends HttpServlet {

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	private List<csInformation> csInf=new ArrayList<csInformation>();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}
	/* public boolean sendInf(String x,String y) throws IOException{
    	//String host = "219.242.251.168";  //Ҫ���ӵķ����IP��ַ
    	 String host="127.0.0.1";
    	// String host = "202.112.148.123";  //Ҫ���ӵķ����IP��ַ
	     int port = 10001;   //Ҫ���ӵķ���˶�Ӧ�ļ����˿�  
	     //�����˽�������  
	  //   System.out.println("�ȴ�����");
	     Socket client = new Socket(host, port); 
	      //�������Ӻ�Ϳ����������д������  
	     System.out.println("�����Ϸ�����");
	     Writer writer = new OutputStreamWriter(client.getOutputStream());  
	    
		 writer.write(x+","+y);	  
	     writer.flush();
	      //д���Ժ���ж�����  
	     try{
	      	 BufferedReader br = new BufferedReader(new InputStreamReader(client.getInputStream()));  
	         StringBuilder sb = new StringBuilder();  
	         String temp;  
	         int index;  
	         while ((temp=br.readLine()) != null) {  
	             System.out.println(temp);  
	             if ((index = temp.indexOf("eof")) != -1) {//����eofʱ�ͽ�������  
	            	sb.append(temp.substring(0, index));  
	                break;  
	            }  
	            sb.append(temp);  
	         }  
	      System.out.println("from z: " + sb);
	      SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//�������ڸ�ʽ
	      System.out.println(df.format(new Date()));// new Date()Ϊ��ȡ��ǰϵͳʱ��
	      
	      writer.close();   
	      br.close();
	      client.close(); 
	      if(sb.toString().equals("error"))
	      {
	    	  return false;
	      }else{
		    	String[] names = sb.toString().split("\\@"); 
		  		List<String> al=new ArrayList<String>();
		  		for (int i = 0; i < names.length; i++) {  
		  			al.add(names[i]);  
		  		}
		  		String[] str=new String[al.size()];
		  		try{
		  			for(int i=0;i<al.size();i++)
		  			{
		  				str[i]=al.get(i);
		  				String[] pos = str[i].split("\\/"); 
		  				//System.out.println(pos[0]+"  , "+pos[1]+"  ,  "+pos[2]);//�ָ����γ��
		  				csInformation buf=new csInformation(pos[0],pos[1],pos[7],pos[8],pos[5],pos[6],pos[2],pos[3],pos[4],"");//���͵����ݸ�ʽ��  ����/γ��/�����վ�ľ���/���վ�ĳ��׮��/���г��׮��/����/��ַ/�����/������
		  				csInf.add(buf);
		  				
		  			}
		  			return true;
		  		}catch(Exception e){
		  			System.out.print("�ָ����"+e);
		  			return false;
		  		}
	      }
	     }catch(Exception e){
	    	 System.out.println("�����ַ�������:"+e);
	    	 return false;
	     }
    }*/
    
  
    
	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*csInf.clear();
	    String x=request.getParameter("lng");
		String y=request.getParameter("lat");
		//System.out.println(x+","+y);
		if(sendInf(x,y))
			{
				position p=new position(x,y);
				request.setAttribute("oPosition", p);
				request.setAttribute("cslist", csInf);
				request.setAttribute("errorMessage", "true");
			}else{
				request.setAttribute("errorMessage", "false");
			}
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/char_nav.jsp");
		requestDispatcher.forward(request, response);*/
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
