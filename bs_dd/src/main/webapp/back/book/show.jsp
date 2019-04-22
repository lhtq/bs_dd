<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
  <head>
    <title>index.html</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/statics/boot/css/bootstrap.min.css">
	<%--引入jqgrid中主题css--%>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/statics/jqgrid/css/trirand/ui.jqgrid-bootstrap.css">
	<%--引入js文件--%>
	<script src="${pageContext.request.contextPath}/statics/boot/js/jquery-3.3.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/statics/boot/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/statics/jqgrid/js/trirand/i18n/grid.locale-cn.js"></script>
	<script src="${pageContext.request.contextPath}/statics/jqgrid/js/trirand/jquery.jqGrid.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/back/css/btn.css" />
    <meta charset="utf-8">
    
	<style type="text/css">
		table {
			border-right: 1px solid black;
			border-bottom: 1px solid black;
		}
		
		table td {
			padding: 10px;
			text-align:center;
			border-left: 1px solid black;
			border-top: 1px solid black;
		}
    </style>
	<script>
		$(function () {
			$("#list").jqGrid({
				url:"${pageContext.request.contextPath}/book/selectByPage",
				datatype:"json",
				styleUI : 'Bootstrap',//使用bootstrap风格样式
				colNames:["名称","作者","定价","当当价","出版社","出版时间","封面图","销量","库存","操作"],
				//cellEdit:true,//开启单元格编辑
				autowidth:true,//自适应父容器
				pager:'#pager',//用来指定分页的工具栏
				rowNum:4, //用来指定每页显示的条数  建议:最好是rowList中一个子元素
				viewrecords:true,//是否显示总记录数
				editurl:"${pageContext.request.contextPath}/book/edit",
				colModel:[
					{name:"name"},
					{name:"author",editable:true},
					{name:"price",editable:true},
					{name:"dd_price",editable:true},
					{name:"press",editable:true},
					{name:"pub_date",editable:true},
					{name:"cover_name",editable:true,
						formatter:function(value,options,row){
							if(row.cover_name){
								return "<img width='50px' height='65px' src='${pageContext.request.contextPath}/cover/"+row.cover_name+"'>";
							}
							return "";
						}
					},
					{name:"sales",editable:true},
					{name:"stock",editable:true},
					{name:"options",
						formatter:function (value,options,row) {
							var content = "<a class='btn btn-danger' onclick=\"javascript:del('"+row.id+"');\">删除</a> " +
									"<a class='btn btn-primary' onclick=\"javascript:edit('"+row.id+"')\">修改</a>";
							return content;
						}
					}
				],
				width:"100%",
				height:"100%"
			});

		})
		function edit(id){
			window.location.href="${pageContext.request.contextPath}/book/beforeUpdate?id="+id;
		}

		function del(id) {
			$("#list").jqGrid('delGridRow',id, {
				reloadAfterSubmit : true
			});
		}
	</script>

  </head>
  
  <body style="background-color: #f0f9fd;">
  	
  	<div align=center style="font-size:25px">图书管理</div><hr/>  	
  	<div style="margin: 0 auto;text-align:center;">
  		<form action="${pageContext.request.contextPath}/book/selectByKey" method="post">
  			<input onclick="location.href='${pageContext.request.contextPath}/back/book/add.jsp'" class="button btn-p" value="添加图书&raquo;" />&emsp;&emsp;
		  	<select name="key" class="el-select__inner inner2">
		  		<option value="name">书名</option>
		  		<option value="author">作者</option>
		  		<option value="press">出版社</option>
		  	</select>
		  	<input class="el-input__inner" type="text" placeholder="请输入查询条件" name="content"/>
		  	<input class="el-search-content" type="submit" value="搜索"/>
	  	</form>
  	</div>
	<div class="container">
		<table id="list"></table>
		<div id="pager"></div>
	</div>
  </body>
</html>
