<%@page contentType="text/html;charset=utf-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="${pageContext.request.contextPath}/statics/boot/js/jquery-3.3.1.min.js"></script>

<script>
	$(function () {
		$.ajax({
			url:"${pageContext.request.contextPath}/book/recommend",
			type:"POST",
			dataType:"JSON",
			success:function (result) {
				$.each(result,function (i, book) {
					//第一个div
					var f = $("<div class='second_c_02_b1_1'/>");
					var id = book.id;
					var a = $("<a href='${pageContext.request.contextPath}/front/main/book_detail.jsp?id="+id+"' target='_blank'>");
					a.html("<img class='aa' src='${pageContext.request.contextPath}/cover/"+book.cover_name+"' width=70 border=0 />")
					f.append(a);
					//第二个div
					var s = $("<div class=second_c_02_b1_2/>");
					var s1 = $("<h3/>").html("<a href='${pageContext.request.contextPath}/front/main/book_detail.jsp?id="+book.id+"' target='_blank' title='输赢'>"+book.name+"</a>");
					<%--//出版时间：<fmt:formatDate value='"+book.pub_date+"' pattern='yyyy-MM-dd'/>--%>
					var s2 = $("<h4/>").html("作者："+book.author+" 著 <br /> 出版社："+book.press+"&nbsp;&nbsp;&nbsp;&nbsp; ");
					var s3 = $("<h5/>").html("简介:"+book.book_abstract+"");
					var s4 = $("s4").html("定价：￥"+book.price+"&nbsp;&nbsp; 当当价：￥"+book.dd_price+" 销量：<font color='red'>"+book.sales+"</font>");
					var s5 = $("<div class=line_xx/>");
					s.append(s1).append(s2).append(s3).append(s4).append(s5);
					$("#al").append(f).append(s);
				})

			}
		})
	})
</script>

<h2>编辑推荐</h2>
<div id=__bianjituijian/danpin>
	<div class=second_c_02>
		<div id="al" class=second_c_02_b1>

			<%--<c:forEach var="book" items="${recommends }">--%>
				<%--<div class="second_c_02_b1_1">--%>
					<%--<a href='/dd/book/bookDetail?id=${book.id }' target='_blank'> <img class="aa" src="/dd/cover/${book.cover_name }" width=70 border=0 />--%>
					<%--</a>--%>
				<%--</div>--%>
				<%--<div class=second_c_02_b1_2>--%>
					<%--<h3>--%>
						<%--<a href='/dd/book/bookDetail?id=${book.id }' target='_blank' title='输赢'>${book.name }</a>--%>
					<%--</h3>--%>
					<%--<h4>--%>
						<%--作者：${book.author } 著 <br /> 出版社：${book.press }&nbsp;&nbsp;&nbsp;&nbsp; 出版时间：<fmt:formatDate value='${book.pub_date}' pattern='yyyy-MM-dd'/>--%>
					<%--</h4>--%>
					<%--<h5>简介:${book.book_abstract }</h5>--%>
					<%--<h6>--%>
						<%--定价：￥${book.price }&nbsp;&nbsp; 当当价：￥${book.dd_price } 销量：<font color="red">${book.sales }</font>--%>
					<%--</h6>--%>
					<%--<div class=line_xx></div>--%>
				<%--</div>--%>

			<%--</c:forEach>--%>


		</div>
	</div>
</div>
