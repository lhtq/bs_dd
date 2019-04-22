<%@page contentType="text/html;charset=utf-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="${pageContext.request.contextPath}/statics/boot/js/jquery-3.3.1.min.js"></script>
<script>
	$(function () {
		$.ajax({
			url:"${pageContext.request.contextPath}/book/new",
			type:"POST",
			dataType:"JSON",
			success:function (result) {
				$.each(result,function (i, book) {
					//第一个div
					var nf = $("<div id='nf' class='second_d_wai'/>");
					var nf1 = $("<div class='img'/>");
					var a = $("<a href='${pageContext.request.contextPath}/front/main/book_detail.jsp?id="+book.id+"' target='_blank'/>");
					a.html("<img class='aa' src='${pageContext.request.contextPath}/cover/"+book.cover_name+"' border=0 />")
					nf1.append(a);
					var nf2 = $("<div class='shuming'/>").html("<a href='${pageContext.request.contextPath}/front/main/book_detail.jsp?id="+book.id+"' target='_blank'>"+book.name+"</a><a href='#' target='_blank'></a>");
					var nf3 = $("<div class='price'/>").html("定价："+book.price+"");
					var nf4 = $("<div class='price'/>").html("当当价："+book.dd_price+"");
					var nf5 = $("<div class='price'/>").html("销量：<font color='red'>"+book.sales+"</font>");
					nf.append(nf1).append(nf2).append(nf3).append(nf4).append(nf5);
					var ns = $("<div class='book_c_xy_long'/>");
					$("#n").append(nf).append(ns);
				})

			}
		})
	})
</script>
<h2>
	<span class="more"><a href="#" target="_blank">更多&gt;&gt;</a> </span>最新上架图书
</h2>
<div id="n" class="book_c_04">
</div>
<div class="clear"></div>