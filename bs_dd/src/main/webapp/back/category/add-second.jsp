<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
  <head>
    <title>index.html</title>
    <meta name="keywords" content="keyword1,keyword2,keyword3">
    <meta name="description" content="this is my page">
    <meta name="content-type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="../css/btn.css" />
    <script src="${pageContext.request.contextPath}/back/js/jquery-3.3.1.min.js"></script>
    <script>
        $(function () {
            $.ajax({
                url:"${pageContext.request.contextPath}/category/selectAllFirst",
                type:"POST",
                dataType:"json",
                success:function (result) {
                    $.each(result,function (i, first) {
                        var option = $("<option/>").text(first.category_name).val(first.id);
                        $("#top_id").append(option);
                    })
                }
            })
        })
    </script>
    <style type="text/css">
		body{
			text-align: center;
		}
		select{
			width:173px;
		}
    </style>
    <script type="text/javascript" src="../js/jquery-3.3.1.js"></script>
  </head>
  
  <body style="background-color: #f0f9fd;">
  	
  	<div style="text-align:center ;font-size:18px">添加商品类别</div><hr/>
  	<form action="${pageContext.request.contextPath}/category/add" method="post">
		所属一级类别:		
		<select name="top_id" id="top_id" class="el-select__inner">
			<%--<c:forEach var="category" items = "${allFirst }">--%>
				<%--<option value="${category.id }">${category.category_name }</option>--%>
			<%--</c:forEach>--%>
		</select>
		二级类别名:<input class="el-input__inner" type="text" name="category_name" id="sname"/><br/><br/>
  				<input class="button btn-p" type="submit" value="提交"/>&emsp;
				<input class="button btn-p" type="button" value="返回上级" onclick="history.go(-1);"/>
  	</form>
  
    	
  </body>
</html>
