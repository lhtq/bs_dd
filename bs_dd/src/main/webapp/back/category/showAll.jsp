<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
	<head>
		<link rel="stylesheet" href="../css/btn.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/boot/css/bootstrap.min.css">
        <%--引入jqgrid中主题css--%>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/jqgrid/css/trirand/ui.jqgrid-bootstrap.css">
        <%--引入js文件--%>
        <script src="${pageContext.request.contextPath}/statics/boot/js/jquery-3.3.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/statics/boot/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/statics/jqgrid/js/trirand/i18n/grid.locale-cn.js"></script>
        <script src="${pageContext.request.contextPath}/statics/jqgrid/js/trirand/jquery.jqGrid.min.js"></script>

        <script>
            $(function () {
                $("#list").jqGrid({
                    url:"${pageContext.request.contextPath}/category/selectAll",
                    datatype:"json",
                    styleUI : 'Bootstrap',//使用bootstrap风格样式
                    colNames:["ID","类别名","所属类别","级别","操作"],
                    //xcellEdit:true,//开启单元格编辑
                    autowidth:true,//自适应父容器
                    //pager:'#pager',//用来指定分页的工具栏
                    //rowNum:2, //用来指定每页显示的条数  建议:最好是rowList中一个子元素
                    //viewrecords:true,//是否显示总记录数
                    editurl:"${pageContext.request.contextPath}/category/edit",
                    colModel:[
                        {name:"id"},
                        {name:"category_name",editable:true},
                        {name:"top_id",editable:true},
                        {name:"rank",editable:true},
                        {name:"options",
                            formatter:function (value,options,row) {
                                var content = "<a class='btn btn-danger' onclick=\"javascript:del('"+row.id+"');\">删除</a> ";
                                return content;
                            }
                        }
                    ],
					width:"100%",
					height:"100%",
                })
            })
            // function edit(id){
            //     //根据rowid获取当前行的方法
            //     $("#list").jqGrid('editGridRow', id, {
            //         height : 300,
            //         reloadAfterSubmit : true
            //     });
            // }
            function del(id) {
                $("#list").jqGrid('delGridRow',id, {
                    reloadAfterSubmit : true
                });
            }
        </script>
	</head>
	<body style="background-color: #f0f9fd;text-align: center;">
	
		<div style="font-size:25px">类别管理</div><hr/>
		<div style="margin-bottom: 10px;">
			<div class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/back/category/add-first.jsp'">添加一级类别&raquo;</div>
			<div class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/back/category/add-second.jsp'">添加二级类别&raquo;</div>
		</div>
		<table id="list"></table>
		<%--<table bordercolor='#898E90' align='center' border='3px' cellpadding='10px' cellspacing="0px" >
			<tr bgcolor='lightblue'>
				<td>Id</td>
				<td>类别名</td>
				<td>所属类别</td>
				<td>级别</td>
				<td>操作</td>
			</tr>
			
			<c:forEach var="category" items="${all}">
				<tr>
					<td>${category.id}</td>
					<td>${category.category_name}</td>
					<td>${category.top_id}</td>
					<td>${category.rank}</td>
					<td>
						<div class="button" onclick="location.href='/dd/category/delete?id=${category.id }' ">删除 &raquo;</div>	
					</td>
				</tr>
			</c:forEach>
			
			
		</table><br/>--%>
		
	</body>  
</html>



