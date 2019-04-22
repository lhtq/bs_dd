<%@page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>生成订单 - 当当网</title>
		<link href="/dd/front/css/login.css" rel="stylesheet" type="text/css" />
		<link href="/dd/front/css/page_bottom.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="/dd/front/js/jquery-1.8.3.min.js"></script>
		<script type="text/javascript">
			function changeAddress(address_id) {
				window.location.href="/dd/address/selectById?id="+address_id;
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
			生成订单骤: 1.确认订单 >
			<span class="red_bold"> 2.填写送货地址</span> > 3.订单成功
		</div>
		<div class="fill_message">
			<p>
				选择地址：
				<select id="address" onchange="changeAddress(this.value)">
					<option value="">
						填写新地址
					</option>
					<c:forEach var="addr" items="${addresses }">
						<c:if test="${address.id == addr.id }">
							<option value="${addr.id }" selected>${addr.local }</option>
						</c:if>
						<c:if test="${address.id != addr.id }">
							<option value="${addr.id }">${addr.local }</option>
						</c:if>
					</c:forEach>
				</select>
			</p>
			<form name="ctl00" method="get" action="/dd/order/addOrder" id="f" onsubmit="return check()">
				<input type="hidden" name="address.id" id="address.id" value="${address.id }"/>
				<input type="hidden" name="address.user_id" id="address.user_id" value="${address.user_id }"/>

				<table class="tab_login">
					<tr>
						<td valign="top" class="w1">
							收件人姓名：
						</td>
						<td>
							<input type="text" class="text_input" name="address.name" id="name" value="${address.name }" onblur="checkname()"/>
							<script type="text/javascript">
								function checkname() {
									var name = $("#name").val();
									var realLength = 0;
									var charCode = -1;
									//遍历昵称字符串
									for (var i = 0; i < name.length; i++) {
										//获取昵称字符串中的每一个字符
										charCode = name.charCodeAt(i);
										//判断字符是否是汉字
										if (charCode >= 0 && charCode <= 127) {
											//不是汉字长度+1
											realLength += 1;
										} else {
											//汉字 长度+2
											realLength += 2;
										}
									}
									if (realLength >= 3 && realLength <= 15) {
										$("#nameInfo").html("<img width='15px' src='/dd/front/images/label3.gif'/>   <font color='green'>姓名长度正确！</font>");
										return true;
									} else {
										$("#nameInfo").html("<img width='15px' src='/dd/front/images/wrong.gif'/>   <font color='red'>姓名长度错误！</font>");
										return false;
									}
								};
							</script>
							<div class="text_left" id="nameValidMsg">
								<p>
									请填写有效的收件人姓名
								</p>
								<span id="nameInfo"></span>
							</div>
						</td>
					</tr>
					<tr>
						<td valign="top" class="w1">
							收件人详细地址：
						</td>
						<td>
							<input type="text" name="address.local" class="text_input" id="address" value="${address.local }" onblur="checkaddress()"/>
							<script type="text/javascript">
								function checkaddress() {
									var address = $("#address").val();
									var realLength = 0;
									var charCode = -1;
									//遍历昵称字符串
									for (var i = 0; i < address.length; i++) {
										//获取昵称字符串中的每一个字符
										charCode = address.charCodeAt(i);
										//判断字符是否是汉字
										if (charCode >= 0 && charCode <= 127) {
											//不是汉字长度+1
											realLength += 1;
										} else {
											//汉字 长度+2
											realLength += 2;
										}
									}
									if (realLength >= 0 && realLength <= 300) {
										$("#addressInfo").html("<img width='15px' src='/dd/front/images/label3.gif'/>   <font color='green'>地址长度正确！</font>");
										return true;
									} else {
										$("#addressInfo").html("<img width='15px' src='/dd/front/images/wrong.gif'/>   <font color='red'>地址长度错误！</font>");
										return false;
									}
								};
							</script>
							<div class="text_left" id="addressValidMsg">
								<p>
									请填写有效的收件人的详细地址
									<span id="addressInfo"></span>
								</p>
							</div>
						</td>
					</tr>
					<tr>
						<td valign="top" class="w1">
							邮政编码
						</td>
						<td>
							<input type="text" class="text_input" name="address.zip_code" id="postalCode" value="${address.zip_code }" onblur="checkcode()"/>
							<script type="text/javascript">
								function checkcode() {
									var code = $("#postalCode").val();
									var realLength = 0;
									var charCode = -1;
									//遍历昵称字符串
									for (var i = 0; i < code.length; i++) {
										//获取昵称字符串中的每一个字符
										charCode = code.charCodeAt(i);
										//判断字符是否是汉字
										if (charCode >= 0 && charCode <= 127) {
											//不是汉字长度+1
											realLength += 1;
										} else {
											//汉字 长度+2
											realLength += 2;
										}
									}
									if (realLength == 5 ) {
										$("#postalCodeInfo").html("<img width='15px' src='/dd/front/images/label3.gif'/>   <font color='green'>邮编长度正确！</font>");
										return true;
									} else {
										$("#postalCodeInfo").html("<img width='15px' src='/dd/front/images/wrong.gif'/>   <font color='red'>邮编长度错误！</font>");
										return false;
									}
								};
							</script>
							<div class="text_left" id="codeValidMsg">
								<p>
									请填写有效的收件人的邮政编码
									<span id="postalCodeInfo"></span>
								</p>
							</div>
						</td>
					</tr>
					<tr>
						<td valign="top" class="w1">
							电话
						</td>
						<td>
							<input type="text" class="text_input" name="address.phone" id="phone" value="${address.phone }" onblur="checkphone()"/>
							<script type="text/javascript">
								function checkphone() {
									var phone = $("#phone").val();
									var realLength = 0;
									var charCode = -1;
									//遍历昵称字符串
									for (var i = 0; i < phone.length; i++) {
										//获取昵称字符串中的每一个字符
										charCode = phone.charCodeAt(i);
										//判断字符是否是汉字
										if (charCode >= 0 && charCode <= 127) {
											//不是汉字长度+1
											realLength += 1;
										} else {
											//汉字 长度+2
											realLength += 2;
										}
									}
									if (realLength == 11 ) {
										$("#phoneInfo").html("<img width='15px' src='/dd/front/images/label3.gif'/>   <font color='green'>电话长度正确！</font>");
										return true;
									} else {
										$("#phoneInfo").html("<img width='15px' src='/dd/front/images/wrong.gif'/>   <font color='red'>电话长度错误！</font>");
										return false;
									}
								};
							</script>
							<div class="text_left" id="phoneValidMsg">
								<p>
									请填写有效的收件人的电话
									<span id="phoneInfo"></span>
								</p>
							</div>
						</td>
					</tr>
				</table>

				<div class="login_in">
					<a href="/dd/front/order/order_info.jsp">
						<input id="btnClientRegister" class="button_1" name="submit" type="button" value="取消" />
					</a>			
				<input id="btnClientRegister" class="button_1" name="submit" type="submit" value="下一步" />
				</div>
			</form>
		</div>
		<%@include file="../common/foot1.jsp"%>
	</body>
</html>

