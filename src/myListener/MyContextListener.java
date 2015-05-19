package myListener;

import java.util.Date;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import myBean.ApplicationConstants;

public class MyContextListener implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO �������ر�ʱ����
		ApplicationConstants.START_DATE=null;
		ApplicationConstants.MAX_ONLINE_COUNT_DATE=null;
	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		// TODO ����������ʱ����
		ApplicationConstants.START_DATE=new Date();//��¼����������ʱ��
	}

}
