<%@page contentType="text/html;charset=utf-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="${pageContext.request.contextPath}/statics/boot/js/jquery-3.3.1.min.js"></script>
<script>
	$(function () {
		$.ajax({
			url:"${pageContext.request.contextPath}/book/hot",
			type:"POST",
			dataType:"JSON",
			success:function (result) {
				$.each(result,function (i, book) {
					//第一个div
					var hf = $("<div id='hf' class='second_d_wai'/>");
					var hf1 = $("<div class='img'/>");
					var a = $("<a href='${pageContext.request.contextPath}/front/main/book_detail.jsp?id="+book.id+"' target='_blank'/>");
					a.html("<img class='aa' src='${pageContext.request.contextPath}/cover/"+book.cover_name+"' border=0 />")
					hf1.append(a);
					var hf2 = $("<div class='shuming'/>").html("<a href='${pageContext.request.contextPath}/front/main/book_detail.jsp?id="+book.id+"' target='_blank'>"+book.name+"</a><a href='#' target='_blank'></a>");
					var hf3 = $("<div class='price'/>").html("定价："+book.price+"");
					var hf4 = $("<div class='price'/>").html("当当价："+book.dd_price+"");
					var hf5 = $("<div class='price'/>").html("销量：<font color='red'>"+book.sales+"</font>");
					hf.append(hf1).append(hf2).append(hf3).append(hf4).append(hf5);
					var hs = $("<div class='book_c_xy_long'/>");
					$("#h").append(hf).append(hs);
				})

			}
		})
	})
</script>

<h2>
	<span class="more"><a href="#" target="_blank">更多&gt;&gt;</a> </span>热销图书
</h2>
<div id="h" class="book_c_04">

	<%--<c:forEach var="book" items="${bySales }">--%>
		<%--<!--热销图书A开始-->--%>
		<%--<div id="hf" class="second_d_wai">--%>
			<%--<div class="img">--%>
				<%--<a href="/dd/book/bookDetail?id=${book.id }" target='_blank'> --%>
				<%--<img class="aa" src="/dd/cover/${book.cover_name }" border=0 />--%>
				<%--</a>--%>
			<%--</div>--%>
			<%--<div class="shuming">--%>
				<%--<a href="/dd/book/bookDetail?id=${book.id }" target="_blank">${book.name }</a><a href="#" target="_blank"></a>--%>
			<%--</div>--%>
			<%--<div class="price">定价：${book.price }</div>--%>
			<%--<div class="price">当当价：${book.dd_price }</div>--%>
			<%--<div class="price">--%>
				<%--销量：<font color="red">${book.sales }</font>--%>
			<%--</div>--%>
		<%--</div>--%>
		<%--<div class="book_c_xy_long"></div>--%>
		<%--<!--热销图书A结束-->--%>
	<%--</c:forEach>--%>

</div>
<div class="clear"></div>