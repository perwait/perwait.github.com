package com.zsz.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.zsz.jdbc.Dao;


public class checkLogin extends HttpServlet {

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
		HttpSession session = request.getSession(); 
		String name=request.getParameter("uname");
		String pw=request.getParameter("upw");
		if(name!=null){
			if(pw!=null){
				if(name.trim()!=""){
					if(pw.trim()!=""){
						if(new Dao().getUserName(name)>0){
							if(new Dao().getUserInPw("upw", pw)>0){
								session.setAttribute("uname", name);
								response.setHeader("refresh", "0;url=index.jsp");
							}else{
								out.print("<h2>T_T 亲 账号或者密码不正确&#12288;<a href='index.jsp'>返回主页</a></h2>");
							}
						}else {
							out.print("<h2>QAQ亲 账号或者密码不正确&#12288;<a href='index.jsp'>点此返回主页</a></h2>");
						}
					}else{
						out.print("<h2>PassWord not Null&#12288;<a href='index.jsp'>点此返回主页</a></h2>");
					}
				}else{
					out.print("<h2>ID not Null&#12288;<a href='index.jsp'>点此返回主页</a></h2>");
				}
				
			}else{
				out.print("<h2>Sorry PassWord Error&#12288;<a href='index.jsp'>点此返回主页</a></h2>");
			}
		} else {
			out.print("<h2>Sorry ID Error&#12288;<a href='index.jsp'>点此返回主页</a></h2>");
		}
		
		
		
		out.flush();
		out.close();
	}

}
