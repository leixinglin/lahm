<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsoup</title>

<link rel="stylesheet" href="${ctx}/static/layui/css/layui.css">
<style type="text/css">
body{padding: 15px;}
</style>
</head>
<body>
	<form action="${ctx}/jsoup/list" method="post" id="contentForm"
		enctype="multipart/form-data">

		<div class="layui-form">
			<div class="layui-form-item">
				<div class="layui-inline" style="width: 600px;">
					<label class="layui-form-label">url:</label>
					<div class="layui-input-inline">
						<input type="text" class="layui-input" id="webUrl"
							autocomplete="off" name="webUrl" 
							placeholder="请输入网址" style="width: 100%;">
					</div>
				</div>

				<div class="layui-inline">
					<button class="layui-btn layui-btn layui-btn-warm">提交</button>
				</div>
			</div>
	
			  
		</div>
	</form>
	<div id="contentTab" class="layui-form" >
		<table class="layui-table">
			<!--  <caption>悬停表格布局</caption> -->
			<thead>
				<tr>

					<th>商品</th>
					<th>价格</th>
					<th>商品链接</th>
					<th>图片链接</th>
					<th>品牌/销量</th>
				</tr>
			</thead>
			<tbody id="tabBody">
				<c:forEach var="data" items="${jsoupList}">
					<tr>
						<td>${data.name}</td>
						<td>${data.price}</td>
						<td><a href="${data.webUrl}">${data.webUrl}</a></td>
						<td><a href="${data.imgUrl}">${data.imgUrl}</a></td>
						<td>${data.brand}</td>
					</tr>
				</c:forEach>
			</tbody>

		</table>
	</div>
	<div id="demo1"></div>
	<div id="loading" class="loading" style="display: none">正在加载</div>
	<script type="text/javascript" src="${ctx}/static/js/jquery/jquery-2.1.4.min.js">
		
	</script>


	<script src="${ctx}/static/layui/layui.js"></script>
	<!-- Excel -->
	<script type="text/javascript">

		function refreshPage(){
			window.location.reload();
		}
	</script>
	<!-- 分页 -->
	<script type="text/javascript">
	
		
	</script>
</body>
</html>