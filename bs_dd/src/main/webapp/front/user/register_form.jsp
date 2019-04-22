<%@page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>用户注册 - 当当网</title>
<link href="${pageContext.request.contextPath}/front/css/login.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/front/css/page_bottom.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/front/js/jquery-1.8.3.min.js"></script>
<script src="${pageContext.request.contextPath}/front/js/validate.min.js"></script>
<script type="text/javascript">
	function changeImage() {
		$("#imgVcode").prop("src", '${pageContext.request.contextPath}/user/code?r=' + Math.random())
		console.log($("#imgVcode").prop("src"))
	}
	function check() {
		if (checkEmail() && checkNickname() && checkPassword() && checkPassword1() && checkCode()) {
			return true;
		} else {
			return false;
		}
	}
</script>
</head>
<body>
	<%@include file="../common/head1.jsp"%>
	<div class="login_step">
		注册步骤: <span class="red_bold">1.填写信息</span> > 2.验证邮箱 > 3.注册成功
	</div>
	<div class="fill_message">

		<form name="ctl00" method="post" action="${pageContext.request.contextPath}/user/regist" id="f"
			onsubmit="return check()">
			<h2>以下均为必填项&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${registMessage }</h2>
			<table class="tab_login">
				<tr>
					<td valign="top" class="w1">请填写您的Email地址：</td>
					<td><input name="email" type="text" id="email"
						class="text_input" onblur="checkEmail()" /> 
						<script type="text/javascript">
							function checkEmail() {
								var email = $("#email").val();
								var ok = new RegExp("^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z0-9]{2,6}$");
								if (ok.test(email)) {
									$("#emailInfo").html("<img width='15px' src='${pageContext.request.contextPath}/front/images/label3.gif'/>   <font color='green'>邮箱格式正确！</font>");
									return true;
								} else {
									$("#emailInfo").html("<img width='15px' src='${pageContext.request.contextPath}/front/images/wrong.gif'/>   <font color='red'>邮箱格式错误！</font>");
									return false;
								}
							};
						</script>

						<div class="text_left" id="emailValidMsg">
							<p>请填写有效的Email地址，在下一步中您将用此邮箱接收验证邮件。</p>
							<span id="emailInfo"></span>
						</div></td>
				</tr>
				<tr>
					<td valign="top" class="w1">设置您在当当网的昵称：</td>
					<td><input name="nickname" type="text" id="nickname"
						class="text_input" onblur="checknickname()" /> 
						<script type="text/javascript">
							function checknickname() {
								var nickname = $("#nickname").val();
								var realLength = 0;
								var charCode = -1;
								//遍历昵称字符串
								for (var i = 0; i < nickname.length; i++) {
									//获取昵称字符串中的每一个字符
									charCode = nickname.charCodeAt(i);
									//判断字符是否是汉字
									if (charCode >= 0 && charCode <= 127) {
										//不是汉字长度+1
										realLength += 1;
									} else {
										//汉字 长度+2
										realLength += 2;
									}
								}
								if (realLength >= 4 && realLength <= 20) {
									$("#nameInfo").html("<img width='15px' src='${pageContext.request.contextPath}/front/images/label3.gif'/>   <font color='green'>昵称长度正确！</font>");
									return true;
								} else {
									$("#nameInfo").html("<img width='15px' src='${pageContext.request.contextPath}/front/images/wrong.gif'/>   <font color='red'>昵称长度错误！</font>");
									return false;
								}
							};
						</script>

						<div class="text_left" id="nickNameValidMsg">
							<p>您的昵称可以由小写英文字母、中文、数字组成，</p>
							<p>长度4－20个字符，一个汉字为两个字符。</p>
							<span id="nameInfo"></span>
						</div></td>
				</tr>
				<tr>
					<td valign="top" class="w1">设置密码：</td>
					<td><input name="password" type="password" id="password"
						class="text_input" onblur="checkPassword()" /> <script
							type="text/javascript">
							function checkPassword() {
								var password = $("#password").val();
								for (var i = 0; i < password.length; i++) {
									//获取密码中的每一个字符
									if (password.charCodeAt(i) < 0 || password.charCodeAt(i) > 128) {
										//密码中包含汉字
										$("#passwordInfo").html("<img width='15px' src='${pageContext.request.contextPath}/front/images/wrong.gif'/>   <font color='red'>密码中包含非法字符！</font>");
										return false;
									}
									;
								}
								;
								if (password.length >= 6 && password.length <= 20) {
									$("#passwordInfo").html("<img width='15px' src='${pageContext.request.contextPath}/front/images/label3.gif'/>   <font color='green'>密码格式正确！</font>");
									return true;
								} else {
									$("#passwordInfo").html("<img width='15px' src='${pageContext.request.contextPath}/front/images/wrong.gif'/>   <font color='red'>密码长度错误！</font>");
									return false;
								}
							}
							;
						</script>

						<div class="text_left" id="passwordValidMsg">
							<p>您的密码可以由大小写英文字母、数字组成，长度6－20位。</p>
							<span id="passwordInfo"></span>
						</div></td>
				</tr>
				<tr>
					<td valign="top" class="w1">再次输入您设置的密码：</td>
					<td><input name="rptPassword" type="password" id="rptPassword"
						class="text_input" onblur="checkPassword1()" /> <script
							type="text/javascript">
							function checkPassword1() {
								var password1 = $("#rptPassword").val();
								//获取第一次输入的密码
								var password = $("#password").val();
								if (password == password1) {
									$("#password1Info").html("<img width='15px' src='${pageContext.request.contextPath}/front/images/label3.gif'/>   <font color='green'>两次输入的密码一致！</font>");
									return true;
								} else {
									$("#password1Info").html("<img width='15px' src='${pageContext.request.contextPath}/front/images/wrong.gif'/>   <font color='red'>两次输入的密码不一致！</font>");
									return false;
								}
							}
							;
						</script>


						<div class="text_left" id="repeatPassValidMsg">
							<span id="password1Info"></span>
						</div></td>
				</tr>
				<tr>
					<td valign="top" class="w1">验证码：</td>
					<td><img class="yzm_img" id='imgVcode' src="${pageContext.request.contextPath}/user/code"/>
						<input name="ucode" type="text" id="txtVerifyCode"
						class="yzm_input" />
						<div class="text_left t1">
							<p class="t1">
								<span id="vcodeValidMsg">请输入图片中的四个字母。</span> <a href="#"
									id="change" onClick="changeImage()">看不清楚？换个图片</a> <br /> <span
									id="codeInfo"></span>
							</p>
						</div></td>
				</tr>
			</table>
			<div class="login_in">
				<input id="btnClientRegister" class="button_1" name="submit"
					type="submit" value="注 册" />
			</div>
		</form>

	</div>
	<%@include file="../common/foot1.jsp"%>
</body>
</html>

