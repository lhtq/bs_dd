<%@page contentType="text/html;charset=utf-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="${pageContext.request.contextPath}/statics/boot/js/jquery-3.3.1.min.js"></script>
<script>
	$(function () {
		$.ajax({
			url:"${pageContext.request.contextPath}/book/hotBoard",
			type:"POST",
			dataType:"JSON",
			success:function (result) {
				$.each(result,function (i, book) {
					var i = i + 1;
					var u = $("<ul/>");
					var l = $("<li/>").html("<span>"+i+".</span>&nbsp; <a target='_blank' href='${pageContext.request.contextPath}/front/main/book_detail.jsp?id="+book.id+"'> "+book.name+" </a>");
					u.append(l);
					$("#NewProduct_1_o_t").append(u);
				})
				var $h3 = $("<h3 class='second'/>").html("<span class='dot_r'> </span><a href='#' target='_blank'>更多&gt;&gt;</a>");
				$("#NewProduct_1_o_t").append($h3);
			}
		})
	})
</script>
<h2 class="t_xsrm">新书热卖榜</h2>
<div id="NewProduct_1_o_t" onmouseover="">
	<%--<c:forEach var="book" items="${bookByCreate_dateAndSales }" varStatus="stu">--%>
		<%--<ul>--%>
			<%--<li><span>${stu.count }.</span>&nbsp; <a target='_blank' href="/dd/book/bookDetail?id=${book.id }"> ${book.name } </a>--%>
			<%--</li>--%>
		<%--</ul>--%>
	<%--</c:forEach>--%>
	<%--<h3 class="second">--%>
		<%--<span class="dot_r"> </span><a href="#" target="_blank">更多&gt;&gt;</a>--%>
	<%--</h3>--%>
</div>