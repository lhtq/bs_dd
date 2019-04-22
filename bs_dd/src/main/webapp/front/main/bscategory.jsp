<%@page contentType="text/html;charset=utf-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="${pageContext.request.contextPath}/statics/boot/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/boot/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/statics/boot/css/bootstrap.min.css">
<div class="book_l_border1" id="__FenLeiLiuLan">
	<div class="book_sort_tushu">
		<h2>
			分类浏览
		</h2>
		<!--创建手风琴实例-->
		<div class="panel-group" id="panelgroup">


			<!--创建面板-->
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="panel-title">
						<!--使用连接完成折叠效果-->
						<a href="#aa" data-toggle="collapse" data-parent="#panelgroup" ><h5>用户管理</h5></a>
					</div>
				</div>

				<div class="panel-collapse collapse" id="aa">
					<ul class="list-group">
						<li class="list-group-item"><a href="">用户列表</a></li>
						<li class="list-group-item"><a href="">用户添加</a></li>
					</ul>
				</div>
			</div>


			<!--创建另一个面板-->
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="panel-title">
						<!--使用连接完成折叠效果-->
						<a href="#bb" data-toggle="collapse" data-parent="#panelgroup" ><h5>类别管理</h5></a>
					</div>
				</div>

				<div class="panel-collapse collapse" id="bb">
					<ul class="list-group">
						<li class="list-group-item">类别列表</li>
						<li class="list-group-item">添加类别</li>
					</ul>
				</div>
			</div>

		</div>
		
		<div class="bg_old">
			<h3>
				&nbsp;
			</h3>
		</div>
	</div>
</div>
