<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>index --test</title>

<%@ include file="link.jsp"%>
</head>

<body>
	<%@ include file="head.jsp"%>
	<div class="container ">
		<div class="row bg_and_border">
			<div class="text-center">
				<h1 class="h1">
					Sorry <span class=" glyphicon glyphicon-exclamation-sign"
						aria-hidden="true"> </span> 基础版 还在完善中
				</h1>
				<div class="progress">
					<div class="progress-bar progress-bar-striped active"
						role="progressbar" aria-valuenow="45" aria-valuemin="0"
						aria-valuemax="100" style="width:62%">
						<span> 62% </span>
					</div>
				</div>
				<p class="lead ">感谢您的访问</p>
			</div>
		</div>
	</div>
	<%@ include file="foot.jsp"%>
	<%@ include file="js.jsp"%>
	<script type="text/javascript">
		jQuery(function($) {
			$('#nav_ul li').prop("class", "");
			$('#nav_ul li[date-title="title"]').prop("class", "active");
		});
	</script>
</body>
</html>
