package com.zsz.jdbc;
import java.util.Date;
import java.text.SimpleDateFormat;
public class getDate {
	public String time()
	 {	
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//�������ڸ�ʽ
		String time=df.format(new Date());
		System.out.println(df.format(new Date()));
	  return time;
	 }
}
