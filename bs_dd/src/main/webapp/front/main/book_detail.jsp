<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<html>
	<head>
		<title>图书详情</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/front/css/book_detail.css"/>
		<link href="${pageContext.request.contextPath}/front/css/public_footer.css" rel="stylesheet" type="text/css" />
		<script src="${pageContext.request.contextPath}/statics/boot/js/jquery-3.3.1.min.js"></script>
		<script>
			$(function () {
				var id = '${param.id}';
				$.ajax({
					url:"${pageContext.request.contextPath}/book/bookDetail",
					data:{"id":id},
					type:"POST",
					dataType:"JSON",
					success:function (book) {
						var d = $("<div/>");
						var h1 = $("<h1/>").html("丛书名："+book.name+"");
						var hr0 = $("<hr/>");
						d.append(h1).append(hr0);
						var tr1 = $("<tr/>").html("<td rowspan='9' width='20%' valign='top'><img src='${pageContext.request.contextPath}/cover/"+book.cover_name+"' width='240px' height='340px' /></td><td colspan='2'>作者："+book.author+"</td>");
						var tr2 = $("<tr/>").html("<td colspan='2'>出版社："+book.press+"</td>");
						var tr3 = $("<tr/>").html("<td>出版时间： "+book.pub_date+"</td><td>字数："+book.word_number+"</td>");
						var tr4 = $("<tr/>").html("<td>版次："+book.edition+"</td><td>页数："+book.page+"</td>");
						var tr5 = $("<tr/>").html("<td>印刷时间："+book.printing_time+"</td><td>开本："+book.book_size+"</td>");
						var tr6 = $("<tr/>").html("<td>印次："+book.imperssion+"</td><td>纸张："+book.paper_size+"</td>");
						var tr7 = $("<tr/>").html("<td>ISBN："+book.isbn+"</td><td>包装："+book.packing+"</td>");
						var tr8 = $("<tr/>");
						var cha = book.price - book.dd_price;
						var td = $("<td colspan='2'/>").html("定价：￥"+book.price+"&nbsp;&nbsp;&nbsp;&nbsp;\n" +
								"\t\t\t\t<font color=\"red\">当当价：￥"+book.dd_price+"</font>&nbsp;&nbsp;&nbsp;&nbsp;\n" +
								"\t\t\t\t节省：￥"+cha+"");
						tr8.append(td);
						var tr9 = $("<tr/>").html("<td colspan='2'><a href='${pageContext.request.contextPath}/cartItem/add?bookId="+book.id+"'><img src='${pageContext.request.contextPath}/front/images/buttom_goumai.gif' /></a></td>");
						var table = $("<table/>").append(tr1).append(tr2).append(tr3).append(tr4).append(tr5).append(tr6).append(tr7).append(tr8).append(tr9);
						var hr1 = $("<hr style='border:1px dotted #666'/>");
						var hr2 = $("<hr style='border:1px dotted #666'/>");
						var hr3 = $("<hr style='border:1px dotted #666'/>");
						var hr4 = $("<hr style='border:1px dotted #666'/>");
						var hr5 = $("<hr style='border:1px dotted #666'/>");
						var h21 = $("<h2/>").html("编辑推荐");
						var p1 = $("<p/>").html(book.editor_writer+"&nbsp;&nbsp;");

						var h22 = $("<h2/>").html("内容简介");
						var p2 = $("<p/>").html(book.book_abstract+"&nbsp;&nbsp;");

						var h23 = $("<h2/>").html("作者简介");
						var p3 = $("<p/>").html(book.author_introduct+"&nbsp;&nbsp;");

						var h24 = $("<h2/>").html("目录");
						var p4 = $("<p/>").html(book.catelog+"&nbsp;&nbsp;");

						var h25 = $("<h2/>").html("媒体评论");
						var p5 = $("<p/>").html(book.media_revie+"&nbsp;&nbsp;");
						$("#bd").append(d).append(table).append(hr1).append(h21).append(p1).append(hr2).append(h22).append(p2).append(hr3).append(h23).append(p3).append(hr4).append(h24).append(p4).append(hr5).append(h25).append(p5);
					}
				})
			})
		</script>
	</head>
	<body>
		<br/>
		<div id="bd"></div>
		<!--页尾开始 -->
		<div class="public_footer">
			<div class="public_footer_bottom">
				<div class="public_footer_icp" style="line-height: 48px;">
					Copyright (C) 当当网 2004-2008, All Rights Reserved
					<a href="#" target="_blank"><img src="${pageContext.request.contextPath}/front/images/bottom/validate.gif" border="0" align="middle" /> </a>
					<a href="#" target="_blank" style="color: #666;">京ICP证041189号</a>
				</div>
			</div>
		</div>
		<!--页尾结束 -->
	</body>
</html>
