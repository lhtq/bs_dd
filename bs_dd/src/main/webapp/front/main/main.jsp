<%@page contentType="text/html;charset=utf-8" isELIgnored="false" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>当当图书 – 全球最大的中文网上书店</title>
		<link href="${pageContext.request.contextPath}/front/css/book.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/front/css/second.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/front/css/secBook_Show.css" rel="stylesheet" type="text/css" />
		<script src="${pageContext.request.contextPath}/statics/boot/js/jquery-3.3.1.min.js"></script>
		<script>
			$(function(){
				$(".aa").mouseover(function(e){
					//1.获取图片大小
					var width = this.width;
					var height = this.height;
					
					//2.获取鼠标的当前位置
					var x = e.pageX + 10;
					var y = e.pageY + 10;
					
					//3.创建一个div
					var div = $("<div id='bigImg'/>").css({
												"position":"absolute",
												"width":width * 1.5,
												"height":height * 1.5,
												"top":y,
												"left":x,
												"display":"none",
												"border":"4px solid orange",
												"border-radius":10
											});
					//4.创建一个img
					var img = $("<img/>").attr({
												"src":this.src
											}).css({
													"width":width * 1.5,
													"height":height * 1.5,
													"border-radius":6													
												});
					//5.将img放到div当中
					div.append(img);
					//6.将div放入到body中
					$("body").append(div);
					//7.将img展示出来
					div.show(1000);
				}).mousemove(function(e){
					//获取鼠标当前的位置
					var x = e.pageX + 10;
					var y = e.pageY + 10;
					//改变div的位置
					$("#bigImg").css({
										"top":y,
										"left":x
									});
				}).mouseout(function(){
					$("#bigImg").remove();
				});
			});
		</script>
		
	</head>
	<body>
		&nbsp;
		<!-- 头部开始 -->
		<%@include file="../common/head.jsp"%>
		<!-- 头部结束 -->
		<div style="width: 962px; margin: auto;">
			<a href="#" target="_blank">
			<img src="${pageContext.request.contextPath}/front/images/default/book_banner_081203.jpg" border="0" /> </a>
		</div>

		<div class="book">

			<!--左栏开始-->
			<div id="left" class="book_left">
				<%@include file="category.jsp"%>
			</div>
			<!--左栏结束-->

			<!--中栏开始-->
			<div class="book_center">

				<!--推荐图书开始-->
				<div class=second_c_border1 id="recommend">
					<%@include file="recommend.jsp"%>
				</div>

				<!--推荐图书结束-->

				<!--热销图书开始-->
				<div class="book_c_border2" id="hot">
					<%@include file="hot.jsp"%>
				</div>
				<!--热销图书结束-->

				<!--最新上架图书开始-->
				<div class="book_c_border2" id="new">
					<%@include file="new.jsp"%>
				</div>

				<!--最新上架图书结束-->

				<div class="clear">
				</div>
			</div>
			<!--中栏结束-->



			<!--右栏开始-->
			<div class="book_right">
				<div class="book_r_border2" id="__XinShuReMai">
					<div class="book_r_b2_1x" id="new_bang">
						<div id="NewProduct_1_o_t" onmouseover="">
							<%@include file="hotBoard.jsp"%>
						</div>
					</div>
				</div>
			</div>
			<!--右栏结束-->
			<div class="clear"></div>
		</div>

		<!--页尾开始 -->
		<%@include file="../common/foot.jsp"%>
		<!--页尾结束 -->
	</body>
</html>
