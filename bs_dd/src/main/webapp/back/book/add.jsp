<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<script src="${pageContext.request.contextPath}/back/js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/btn.css" />

<style type="text/css">
td {
	padding-top: 8px;
}

#file_upload1 {
	display: none;
}

#file_upload1_label {
	display: inline-block;
	border: 1px solid #aaa;
	width: 120px;
	height: 145px;
	margin-left: 20px;
	text-align: center;
	line-height: 145px;
	cursor: pointer;
}

</style>
	<script>
		$(function () {
			$.ajax({
				url:"${pageContext.request.contextPath}/category/selectAllSecond",
				type:"POST",
				dataType:"json",
				success:function (result) {
					$.each(result,function (i, second) {
						var option = $("<option/>").text(second.category_name).val(second.id);
						$("#category_id").append(option);
					})
				}
			})
		})
	</script>

</head>

<body
	style="background-color: #f0f9fd;text-align: center">
	<div style="font-size:25px">添加图书</div>
	<hr />
	<div align="center">
		<form action="${pageContext.request.contextPath}/book/add" method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<td>名称：</td>
					<td><input type="text" name="name" class="el-input__inner"></td>
					<td rowspan="14" style="width: 300px">
					<td>页数：</td>
					<td><input type="number" name="page" class="el-input__inner"></td>
				</tr>
				<tr>
					<td>所属分类：</td>
					<td>
						<select name="category_id" id="category_id" class="el-select__inner inner2">
						</select>
					</td>
					<td>字数：</td>
					<td><input type="number" name="word_number" class="el-input__inner"></td>
				</tr>
				
				<tr>
					<td>原价：</td>
					<td><input type="number" name="price" class="el-input__inner"></td>
					<td>封面：</td>
					<td rowspan="3">
						<label id="file_upload1_label" for="file_upload1">
							<span id="uploadtip">添加图书封面</span> 
							<img id="uploadimg" src="" alt="" width="118px" height="143px" />
						</label> 
						<input type="file" name="cover" class="" id="file_upload1"	onchange="upload_review()">
					</td>
				</tr>
				
				<tr>
					<td>当当价：</td>
					<td><input type=number name="dd_price" class="el-input__inner"></td>
					<td></td>
				</tr>
				<tr>
					<td>库存：</td>
					<td><input type="number" name="stock" class="el-input__inner"></td>
					<td></td>
				</tr>
				<tr>
					<td>作者：</td>
					<td><input type="text" name="author" class="el-input__inner"></td>
					<td>编辑推荐：</td>
					<td rowspan="2"><textarea class="el-textarea__inner" name="editor_writer"></textarea></td>
				</tr>
				<tr>
					<td>出版社：</td>
					<td><input type="text" name="press" class="el-input__inner"></td>
					<td></td>
				</tr>
				<tr>
					<td>出版时间：</td>
					<td><input type="date" name="pub_date" class="el-input__inner"></td>
					<td>内容简介：</td>
					<td rowspan="2"><textarea class="el-textarea__inner" name="book_abstract"></textarea></td>
				</tr>
				<tr>
					<td>版次：</td>
					<td><input type="text" name="edition" class="el-input__inner"></td>
					<td></td>
				</tr>
				<tr>
					<td>印刷时间：</td>
					<td><input type="date" name="printing_time" class="el-input__inner"></td>
					<td>作者简介：</td>
					<td rowspan="2"><textarea class="el-textarea__inner" name="author_introduct"></textarea></td>
				</tr>
				<tr>
					<td>印次：</td>
					<td><input type="text" name="imperssion" class="el-input__inner"></td>
					<td></td>
				</tr>
				<tr>
					<td>ISBN：</td>
					<td><input type="text" name="isbn" class="el-input__inner"></td>
					<td>基本目录：</td>
					<td rowspan="2"><textarea class="el-textarea__inner" name="catelog"></textarea></td>
				</tr>
				<tr>
					<td>开本：</td>
					<td><input type="text" name="book_size" class="el-input__inner"></td>
					<td></td>
				</tr>
				<tr>
					<td>纸张：</td>
					<td><input type="text" name="paper_size" class="el-input__inner"></td>
					<td>媒体评论：</td>
					<td rowspan="2"><textarea class="el-textarea__inner" name="media_revie"></textarea></td>
				</tr>
				<tr>
					<td>包装：</td>
					<td><input type="text" name="packing" class="el-input__inner"></td>
					<td></td>
				</tr>
			</table>
			<input type="submit" class="button btn-p" value="提交" />&emsp; 
			<input type="button" class="button btn-p" value="返回上级" onclick="history.go(-1);" />
		</form>
	</div>
	<script>
		function upload_review() {
			var img = document.getElementById("uploadimg");
			var input = document.getElementById("file_upload1");
			var tip = document.getElementById("uploadtip");			

			var file = input.files.item(0);
			var freader = new FileReader();
			freader.readAsDataURL(file);
			freader.onload = function(e) {
				img.src = e.target.result;
				tip.style.display = "none";
			};
		}
	</script>
</body>
</html>
