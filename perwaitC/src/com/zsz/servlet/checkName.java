package com.zsz.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zsz.jdbc.Dao;


public class checkName extends HttpServlet {

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
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
		
	}

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

		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		String name=request.getParameter("uname");
		if(name!=null){
		if(name.trim()!=""){
			if(new Dao().getUserName(name)>0){
				out.print(" (;￢д￢)来晚一步，已被抢先注册  ");
			}else {
				out.print(" O(∩_∩)O 这个名字可以使用 ");
			}
		}else{
			out.println(" (|||￢ω￢) 账号不能为空");
			
		}
		}else {
			out.println(" o(￣ヘ￣o error ");
		}
		
		//request.getRequestDispatcher("article.jsp?tid="+atid+"&pid="+rPid).forward(request, response);
		//response.setHeader("refresh", "0;list.jsp?tid="+"atid");
		out.flush();
		out.close();
	}

}
