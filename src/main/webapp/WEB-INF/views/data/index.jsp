<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
 
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<title>深圳市银松互动科技有限公司</title>
		<link rel="stylesheet" href="${ctx}/static/layui/css/layui.css">
	</head>

	<body class="layui-layout-body">
		<div class="layui-layout layui-layout-admin ">
			<div class="layui-header bg-header">
				<div class="layui-logo">深圳市银松互动科技有限公司</div>
				<!-- 头部区域（可配合layui已有的水平导航） -->

				<ul class="layui-nav layui-layout-right">
					<li class="layui-nav-item">
						<a href="javascript:;">
							<shiro:hasRole name="admin">
								管理员:
							</shiro:hasRole>
							<shiro:hasRole name="user">
								用户:
							</shiro:hasRole>
							<!-- <img src="images/1.gif" class="layui-nav-img"> --> <shiro:principal/>
						</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="">基本资料</a>
							</dd>
							<dd>
								<a href="">安全设置</a>
							</dd>
						</dl>
					</li>
					<li class="layui-nav-item">
						<a href="${ctx}/logout">退出</a>
					</li>
				</ul>
			</div>


			<div class="layui-body" style="z-index: 0;">
				<!-- 内容主体区域 -->
				<div style="height: 100%;overflow-y:hidden;">
					<iframe src="${ctx}/data/list" name="right" frameborder="0" width="100%" height="100%"></iframe>
				</div>
			</div>

			<!-- <div class="layui-footer">
				底部固定区域
				底部固定区域
			</div> -->
		</div>
		
		<script type="text/javascript" src="${ctx}/static/js/jquery/jquery-2.1.4.min.js"></script>
		<!-- <script type="text/javascript" src="/s001/static/js/layui/plugs.js">
		</script> -->
		
		<script src="${ctx}/static/layui/layui.js"></script>
		<script>
			//JavaScript代码区域
			layui.use('element', function() {
				var element = layui.element;

			});
			
			
		</script>
	</body>

</html>