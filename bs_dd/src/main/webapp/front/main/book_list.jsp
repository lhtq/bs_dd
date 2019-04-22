<%@page contentType="text/html;charset=utf-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>当当图书 – 全球最大的中文网上书店</title>
		<link href="${pageContext.request.contextPath}/front/css/book.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/front/css/second.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/front/css/secBook_Show.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/front/css/list.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="../js/prototype-1.6.0.3.js"></script>
		<script src="${pageContext.request.contextPath}/statics/boot/js/jquery-3.3.1.min.js"></script>
		<script>
			<%--$(function () {--%>
				<%--var sid = '${param.sid}';--%>
				<%--var fid = '${param.fid}';--%>
				<%--$.ajax({--%>
					<%--url:"",--%>
					<%--type:"POST",--%>
					<%--dataType:"JSON",--%>
					<%--data:"",--%>
					<%--success:function (category) {--%>
						<%--//您现在的位置--%>
						<%--var a = $("<a href='${pageContext.request.contextPath}/front/main/main.jsp'/>").html("当当图书");--%>
						<%--var font = $("<font style='color: #cc3300'/>").html("<strong>"+category.category_name+"</strong>");--%>
						<%--$("#location").append(a).append(font);--%>
						<%--$.each(category.seconds,function (i, c) {--%>
							<%--if(c.id == sid) {--%>
								<%--var gt = $("<span/>").html("&gt;&gt;");--%>
								<%--var now = $("<font style='color: #cc3300'/>").html("<strong>c.category_name</strong>");--%>
								<%--$("#location").append(gt).append(now);--%>
							<%--}--%>
						<%--})--%>
						<%--//您的位置结束--%>


					<%--}--%>
				<%--})--%>
			<%--})--%>
		</script>
	</head>
	<body>
		&nbsp;
		<!-- 头部开始 -->
		<%@include file="../common/head.jsp"%>
		<!-- 头部结束 -->
		<div style="width: 962px; margin: auto;">
			<a href="#"><img src="${pageContext.request.contextPath}/front/images/default/book_banner_081203.jpg" border="0" /> </a>
		</div>
		<%--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--%>
		<div id="location" class='your_position'>
			您现在的位置:&nbsp;
			<a href='${pageContext.request.contextPath}/front/main/main.jsp'>当当图书</a> &gt;&gt;
			<font style='color: #cc3300'><strong>${oneFirstIncludeSecond.category_name }</strong> </font>
			<c:forEach var="second" items="${oneFirstIncludeSecond.seconds }">
				<c:if test="${second.id == sid }">
					&gt;&gt;
					<font style='color: #cc3300'><strong>${second.category_name}</strong> </font>
				</c:if>
			</c:forEach>
		</div>
	
		<div class="book">

			<!--左栏开始-->
			<div id="left" class="book_left">
				<div id="__fenleiliulan">
					<div class=second_l_border2>
						<h2>
							分类浏览
						</h2>
						<ul>
							<li>
								<div>
									<div class=second_fenlei>
									<c:if test="${sid == null }">
										<a href="${pageContext.request.contextPath}/book/secondCategoryPage?fid=${oneFirstIncludeSecond.id }"><span style="color:red">&middot;全部&nbsp;(${allCount })</span></a>
									</c:if>
									<c:if test="${sid != null }">
										<a href="${pageContext.request.contextPath}/book/secondCategoryPage?fid=${oneFirstIncludeSecond.id }">&middot;全部&nbsp;(${allCount })</a>
									</c:if>
									</div>
								</div>
							</li>
							<div class="clear"></div>
							
							<!--2级分类开始-->
							<li>
								<div>
									<div class=second_fenlei>
										&middot;
									</div>
									
									<c:forEach var="second" items="${oneFirstIncludeSecond.seconds }">
										<div class=second_fenlei>
											<c:if test="${second.id == sid}">
												<font style='color:#cc3300'><strong>
													<a href="${pageContext.request.contextPath}/book/secondCategoryPage?sid=${second.id }&fid=${second.top_id}">
														<span style='color:red'>
															${second.category_name }&nbsp;
															(<c:forEach var="map" items="${bookCount }">
																<c:if test="${map.key == sid }">${map.value }</c:if>
															</c:forEach>)
														</span>
													</a>
												</strong> </font>
											</c:if>
											<c:if test="${second.id != sid}">
												<a href="${pageContext.request.contextPath}/book/secondCategoryPage?sid=${second.id }&fid=${second.top_id}">${second.category_name }&nbsp;
													(<c:forEach var="map" items="${bookCount }">
														<c:if test="${map.key == second.id }">${map.value }</c:if>
													</c:forEach>)
												</a>
											</c:if>
										</div>
									    <div class="clear"></div>
									</c:forEach>
								
								</div>
							</li>
							<!--2级分类结束-->
							
							<li>
								<div></div>
							</li>
						</ul>
					</div>
				</div>
			</div>

			<!--左栏结束-->

			<!--中栏开始-->
			<div class="book_center">

				<!--图书列表开始-->
				<div id="divRight" class="list_right">

					<div id="book_list" class="list_r_title">
						<div class="list_r_title_text">
							排序方式
						</div>
						<select onchange='' name='select_order' size='1'
							class='list_r_title_ml'>
							<option value="">
								按上架时间 降序
							</option>
						</select>
						<div id="divTopPageNavi" class="list_r_title_text3">

							<!--分页导航开始-->
							
							<div class='list_r_title_text3a'>
								<a name=link_page_next href="${pageContext.request.contextPath}/book/secondCategoryPage?sid=${sid}&fid=${fid}&page=1">
									<img src='${pageContext.request.contextPath}/front/images/page_up.gif' />
								</a>
							</div>
	
							<div class='list_r_title_text3a'>
								<a name=link_page_next href="${pageContext.request.contextPath}/book/secondCategoryPage?sid=${sid }&fid=${fid}&page=${page-1}">
									<c:if test="${page == 1 }">
										<img src='${pageContext.request.contextPath}/front/images/page_up_gray.gif' />
									</c:if>
									<c:if test="${page != 1 }">
										<img src='${pageContext.request.contextPath}/front/images/page_up.gif' />
									</c:if>
								</a>
							</div>
				
							<div class='list_r_title_text3b'>
								第${page}页/共${pageCount }页
							</div>
							
							<div class='list_r_title_text3a'>
								<a name=link_page_next href="${pageContext.request.contextPath}/book/secondCategoryPage?sid=${sid }&fid=${fid}&page=${page+1}">
									<c:if test="${page != pageCount }">
										<img src='${pageContext.request.contextPath}/front/images/page_down.gif' />
									</c:if>
									<c:if test="${page == pageCount }">
										<img src='${pageContext.request.contextPath}/front/images/page_down_gray.gif' />
									</c:if>
								</a>
							</div>
			
							<div class='list_r_title_text3a'>
								<a name=link_page_next href="${pageContext.request.contextPath}/book/secondCategoryPage?sid=${sid }&fid=${fid}&page=${pageCount}">
									<img src='${pageContext.request.contextPath}/front/images/page_down.gif' />
								</a>
							</div>

							<!--分页导航结束-->
						</div>
					</div>
					
					<!--商品条目开始-->
						<c:forEach var="book" items="${byCategory_idAndPage }">
							<div class="list_r_line"></div>
							<div class="clear"></div>
								<div class="list_r_list">
									<span class="list_r_list_book">
										<a name="link_prd_img" href='${pageContext.request.contextPath}/book/bookDetail?id=${book.id }'>
											<img src="${pageContext.request.contextPath}/cover/${book.cover_name }" />
										</a>
									</span>
									<h2>
										<a name="link_prd_name" href='${pageContext.request.contextPath}/book/bookDetail?id=${book.id }'>${book.name }</a>
									</h2>
									<h3>
										顾客评分：100
									</h3>
									<h4 class="list_r_list_h4">
										作 者:
										<a href='#' name='作者'>${book.author }</a>
									</h4>
									<h4>
										出版社：
										<a href='#' name='出版社'>${book.press }</a>
									</h4>
									<h4>
										出版时间：<fmt:formatDate value='${book.pub_date}' pattern='yyyy-MM-dd'/>
									</h4>
									<h5>
										${book.editor_writer }
									</h5>
									<div class="clear"></div>
									<h6>
										<span class="del">￥${book.price }</span>
										<span class="red">￥${book.dd_price }</span>
										节省：￥${book.price - book.dd_price }
									</h6>
									<span class="list_r_list_button"> 
									<a href="${pageContext.request.contextPath}/cartItem/add?bookId=${book.id }">
										<img src='${pageContext.request.contextPath}/front/images/buttom_goumai.gif' />
									</a>
									<span id="cartinfo"></span>
								</div>
							<div class="clear"></div>
						</c:forEach>
						<!--商品条目结束-->

					<div class="clear"></div>
					<div id="divBottomPageNavi" class="fanye_bottom">
					</div>

				</div>
				<!--图书列表结束-->

			</div>
			<!--中栏结束-->
			<div class="clear"></div>
		</div>

		<!--页尾开始 -->
		<%@include file="../common/foot.jsp"%>
		<!--页尾结束 -->
	</body>
</html>
		