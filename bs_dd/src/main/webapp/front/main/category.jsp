<%@page contentType="text/html;charset=utf-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="${pageContext.request.contextPath}/statics/boot/js/jquery-3.3.1.min.js"></script>
<script>
	$(function () {
		$.ajax({
			url:"${pageContext.request.contextPath}/category/allFirstIncludeSecond",
			type:"POST",
			dataType:"JSON",
			success:function (result) {
				$.each(result,function (i, first) {
					var fis = $("<div class='bg_old' onmouseover=this.className = 'bg_white'; onmouseout=this.className = 'bg_old';/>");
					var h3 = $("<h3/>").html("[<a href='${pageContext.request.contextPath}/book/secondCategoryPage?fid="+first.id+"'>"+first.category_name+"</a>]");
					var ul = $("<ul class='ul_left_list'/>");
					var e = $("<div class='empty_left'/>");
					var m = $("<div class='more2'/>");
					$.each(first.seconds,function (j, second) {
						var li = $("<li/>").html("<a href='${pageContext.request.contextPath}/book/secondCategoryPage?sid="+second.id+"&fid="+second.top_id+"'>"+second.category_name+"</a>");
						ul.append(li);
					})
					fis.append(h3).append(ul).append(e);
					$("#all").append(fis).append(m);
				})
				var bg = $("<div id='bg' class='bg_old'/>").append($("<h3/>").html("&nbsp"));
				$("#all").append(bg);
			}
		})
	})
</script>
<div class="book_l_border1" id="__FenLeiLiuLan">
	<div id="all" class="book_sort_tushu">
		<h2>
			分类浏览
		</h2>
	</div>
</div>
