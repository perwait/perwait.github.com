<%@ page language="java" contentType="text/html" import="java.util.*,com.zsz.test.Names,java.lang.*,java.sql.*,com.zsz.jdbc.*" pageEncoding="UTF-8"%>
	<%
	PreparedStatement stmt = null;
	ResultSet rs = null;
	Connection conn = null;
	String puname = (String) session.getAttribute("uname");

	int indexPosts = 0;
	String userid = null, myindex_uname = null, myindex_logo = null, myindex_usign = null, myindex_uqq = null;
	int myindex_article = 0;
	userid = request.getParameter("uid");
	
	myindex_uname = new Dao().getXXval("usr", "uid", userid, "uname");
	myindex_usign =new Dao().getXXval("usr", "uid", userid, "usign");
	myindex_logo = new Dao().getXXval("usr", "uid", userid, "uimg");
	myindex_uqq = new Dao().getXXval("usr", "uid", userid, "uqq");
	myindex_article =new Dao().getSqlAForB("posts", "pauthor", myindex_uname);
	if (myindex_logo == null) {
		myindex_logo = "image\\defaultlogo.jpg";
	} else if (myindex_logo.equals("")) {
		myindex_logo = "image\\defaultlogo.jpg";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=myindex_uname+new Names().getMyIndexName()+new Names().getIndexName()+new Names().getIndexNameLast() %></title>
<%@ include file="link.jsp"%>
</head>
<body>
	<%@ include file="head.jsp"%>
	<div id="myBody">
	
	<!-- nav -->
	<div class="container ">
		<div class="row bg_and_border">
			<div class="">
				<div class="col-md-9 col-sm-12 border-r">
					<div class="nav-tabs ">
						<h2 class=" h2"><%=myindex_uname%>的文章
						</h2>
						<ul class="nav nav-ul">
							
							<li class="active"><a href="javascript:;">最新</a></li>
						</ul>
					</div>
					<!--内容区 -->
					<div class="modal-body body-list ">
						<!-- 内容-->
						<%
							String plogo = null;
							List<Posts> test = new Dao().getList("posts", "pauthor",
									myindex_uname);

							for (Posts k : test) {
						%>
						<div class="col-sm-12 col-xs-12 ">
							<a href="javasript:;" class="hidden-xs"> <%
 	plogo = new Dao().getXXval("usr", "uname", k.getPauthor(),
 				"uimg");

 		if ((plogo + "").equals("") || plogo == "" || plogo == null) {
 			plogo = "image\\defaultlogo.jpg";
 		}
 %> <img src="<%=plogo%>" width="40px"
								height="40px" alt="img 40px ">
							</a>
							<div>
								<h4>
									<a href="article.jsp?tid=<%=k.getTid()%>&pid=<%=k.getPid()%>"><%=k.getPname()%></a>
								</h4>
								<p>
									<label><a href="list.jsp?tid=<%=k.getTid()%>"><%=new Dao().getXXval("theme", "tid", k.getTid(),
						"tname")%></a></label>
									<%=k.getPreplies()%>个回复
								</p>
							</div>
							<%
							if(false){
								if (puname != null) {

										if (puname.equals(k.getPauthor())) {
							%>
							<div class="last">
								<button class="btn btn-sm btn-primary">编辑</button>
								<button class="btn btn-sm btn-danger">删除</button>
							</div>
							<%
								}
									}
									}
							%>
						</div>
						<%
							}
							if (test.toString() == "[]") {
						%>
						<br>
						<h3 class=" text-center ">~此片场 空空如也 哟~</h3>
						<%
							}
						%>
						<!--  end -->
						<!-- 分页-->
						<%
							if (indexPosts / 15 > 1) {
						%>

						<div class="col-sm-12 ">
							<ul class="list-style">
								<li><a href="#">上一页</a></li>
								<li class="active"><a href="http://baidu.com">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li>...</li>
								<li><a href="#">111</a></li>
								<li><a href="#">下一页</a></li>
							</ul>
						</div>
						<%
							}
						%>
						<!--  fenye end -->
					</div>
				</div>
				<div class="col-md-3 hidden-xs hidden-sm body-list">
					<!-- 热门话题 -->
					<div class="col-sm-12 r_div_PaddingAndBorder">
						<div class="col-sm-12 ">
							<h4>资料</h4>
						</div>
					</div>
					<div class="col-sm-12 r_div_PaddingAndBorder">
						<a href="javascript:void(0)"> <img src="<%=myindex_logo%>"
							width="40px" height="40px" alt="img 40px ">
						</a>
						<div>
							<h4>
								<a href="#"><%=myindex_uname%></a>
							</h4>
							<p><%=myindex_article%>
								篇文章
							</p>
						</div>
					</div>
					<%
						if (myindex_uqq != null) {
					%>
					<div class="col-sm-12 r_div_PaddingAndBorder">
						<div>
							<h4 class="sr-only">档案</h4>
							<p>
								<label>ＱＱ</label><%=myindex_uqq%></p>
						</div>
					</div>
					<%
						}
						if (myindex_usign != null) {
					%>
					<div class="col-sm-12 r_div_PaddingAndBorder">
						<div>
							<h4 class="sr-only">签名</h4>
							<a href="javascript:void(0)"><%=myindex_usign%></a>
						</div>
					</div>
					<%
						}
					%>
				</div>
			</div>
		</div>
	</div>


	</div>
	<%@ include file="foot.jsp"%>
	<%@ include file="js.jsp"%>
	<script>
		jQuery(function($) {
			$('#nav_ul li').prop('class', '');
		})
	</script>
</body>
</html>
