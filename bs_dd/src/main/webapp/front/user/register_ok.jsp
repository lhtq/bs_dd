<%@page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>用户注册 - 当当网</title>
		<link href="${pageContext.request.contextPath}/front/css/login.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/front/css/page_bottom.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/front/js/jquery-1.8.3.min.js"></script>
		<!-- 百度出品，必属精品  -->
		<script type="text/javascript">
			$(function() {
				setInterval(changeTime,1000);
			});
			function changeTime() {
				var time;
				time = $("#js").text();
				time = parseInt(time);
				time--;
				if(time <= 0) {
					window.location.href="${pageContext.request.contextPath}/front/main/main.jsp";
				} else {
					$("#js").text(time);
				}
			}
		</script>
	</head>
	<body>
		<%@include file="../common/head1.jsp"%>
		<div class="login_step">
			注册步骤: 1.填写信息 > 2.验证邮箱 >
			<span class="red_bold">3.注册成功</span>
		</div>


		<div class="login_success">
			<div class="login_bj">
				<div class="succ">
					<img src="${pageContext.request.contextPath}/front/images/login_success.jpg" />
				</div>
				<h5>
					${loginUser.nickname }，欢迎加入当当网
				</h5>
				<h6>
					请牢记您的登录邮件地址：${loginUser.email }<br/>
					<span id="js">5</span>秒后自动跳转到当当网首页
				</h6>

				<ul>
					<li class="nobj">
						您现在可以：
					</li>
					<li>
						进入“
						<a href="#">我的当当</a>”查看并管理您的个人信息
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/book/mainPage">浏览并选购商品</a>
					</li>
				</ul>
			</div>
		</div>

		<%@include file="../common/foot1.jsp"%>
	</body>
</html>

