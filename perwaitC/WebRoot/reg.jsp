<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">
<head>
<title>登记蒲苇账户</title>
<%@ include file="link.jsp"%>
<link rel="stylesheet" href="css/bodyBG.css">

</head>
<body>
<body>
	<div class="area">
		<div class="container">
			<div class="row">
				<div
					class=" col-lg-6  col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2 col-xs-12">
					<!-- InstanceBeginEditable name="EditReg" -->
					<form action="chkReg.jsp" method="post"
						onsubmit="return Rregistration()">
						<div class="bg_and_border mar-div-20px ">
							<div class="text-center">
								<label class="sr-only">LOGO</label> <img class="img-circle "
									width="15%" height="15%" src="image/ico.png">
								<h3 class="h3">登记</h3>
							</div>
							<div class="form-group">
								<label class="sr-only">账号</label> <input id="reg_uname" type="text" onblur="zsz_ajax('reg_UnameWarming','checkName?uname=','reg_uname')"
									name="uname" class="form-control"
									placeholder="必填-请输入账号 长度为2-16字符 不能有空格 特殊字符">
								<p id="reg_UnameWarming">&#12288;</p>
							</div>
							<div class="form-group">
								<label class="sr-only">密码</label> <input id="reg_upw"
									type="password" name="upw" class="form-control"
									placeholder="必填-请输入密码 长度为2-16字符 不能有空格 特殊字符 汉字">
								<p id="reg_PasswordWarming">&#12288;</p>
							</div>
							<div class="form-group">
								<label class="sr-only">密码确认</label> <input id="reg_upw2"
									type="password" name="upw2" class="form-control"
									placeholder="必填-请再次输入密码">
								<p id="reg_Password2">&#12288;</p>
							</div>
							<div class="form-group">
								<label class="sr-only"></label> <input id="reg_uemail" type="text"
									name="uemail" class="form-control" placeholder="选填-请输入邮箱 ">
								<p id="reg_EmailWarming">&#12288;</p>
							</div>
							<div class="form-group">
								<input type="submit" class="btn btn-info form-control"
									value="注册，并登陆">
							</div>
						</div>
					</form>
				

				</div>
			</div>
		</div>

	</div>

<script src="js/reg.js"></script>
<script type="text/javascript" src="js/ajax.js"></script>
</body>
</html>