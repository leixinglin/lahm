<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>深圳市银松互动科技有限公司</title>

<link rel="stylesheet" href="${ctx}static/layui/css/layui.css">
<style type="text/css">
a {
	text-decoration: none;
}

.file {
	position: relative;
	display: inline-block;
	background: #65D3E3;
	border: 1px solid #99D3F5;
	border-radius: 4px;
	padding: 4px 12px;
	overflow: hidden;
	color: #1E88C7;
	text-decoration: none;
	text-indent: 0;
	line-height: 28px;
	/* margin-left: 320px; */
}

.file input {
	position: absolute;
	font-size: 100px;
	right: 0;
	top: 0;
	opacity: 0;
}

.file:hover {
	border-color: #78C3F3;
	color: #FFF;
	text-decoration: none;
}

</style>
</head>
<body>
	<form action="${ctx}/contentList" method="post" id="contentForm"
		enctype="multipart/form-data">
		<input type="hidden" id="currPage" name="currentPage"
			value="${currentPage}" /> <input type="hidden" id="pageTotal"
			value="${pageInfo.total}" /> <input type="hidden" 
			name="pageSize" id="pageSize" value="${pageInfo.pageSize}" />
		<div class="layui-form">
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">起始时间</label>
					<div class="layui-input-inline">
						<input type="text" class="layui-input" id="test1"
							autocomplete="off" name="startTime" value="${pd.startTime}"
							placeholder="yyyy-MM-dd">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">结束时间</label>
					<div class="layui-input-inline">
						<input type="text" class="layui-input" id="test1-1"
							autocomplete="off" name="endTime" value="${pd.endTime}"
							placeholder="yyyy-MM-dd">
					</div>
				</div>
				<div class="layui-inline">
					<button class="layui-btn layui-btn layui-btn-warm">搜索</button>
				</div>
				<shiro:hasRole name="admin">
					<div class="layui-inline">
						<a href="javascript:" class="file">选择文件 <input type="file"
							name="file" id="file">
						</a>
					</div>
					<div class="layui-inline">
						<a href="javascript:" id="deleteAll" class="file">清空数据</a>
					</div>
				</shiro:hasRole>

			</div>
		</div>
	</form>
	<div id="contentTab">
		<table class="layui-table">
			<!--  <caption>悬停表格布局</caption> -->
			<thead>
				<tr>
					<th>时间</th>
					<th>渠道</th>
					<th>激活</th>
				</tr>
			</thead>
			<tbody id="tabBody">
				<c:forEach var="data" items="${dataList}">
					<tr>
						<td>${data.create_time}</td>
						<td>${data.channel}</td>
						<td>${data.active}</td>
					</tr>
				</c:forEach>
			</tbody>
			<shiro:hasRole name="admin">
				<tfoot>
					<tr id="tabFoot">
						<th>总计</th>
						<th>--</th>
						<th>0</th>
					</tr>
				</tfoot>
			</shiro:hasRole>
		</table>
	</div>
	<div id="demo1"></div>
	<div id="loading" class="loading" style="display: none">正在加载</div>
	<script type="text/javascript" src="${ctx}/static/js/jquery/jquery-2.1.4.min.js">
		
	</script>


	<script src="${ctx}/static/layui/layui.js"></script>
	<!-- Excel -->
	<script type="text/javascript">
		$("#file").change(function() {
			var file = $("#file").val();
			if (file.lastIndexOf(".xls") < 0) {//可判断以.xls和.xlsx结尾的excel  
				layer.msg('只能选择Excel');
				return;
			}
			$.ajax({
				url : '${ctx}/upLoadExcel',
				cache : false,
				type : 'POST',
				data : new FormData($('#contentForm')[0]),
				asyne : false,
				processData : false,
				contentType : false,
				datatype : "json",
				beforeSend : function() {
					/* layer.load(); */
					$("#loading").show();
				},
				complete : function() {
					$("#loading").hide();
					/* layer.closeAll('loading'); */
				},
				success : function(returndata) {
					if (returndata.msg == 1) {
						window.location = "${ctx}/contentList";
					} else {
						layer.msg("出现错误！");
					}
				}
			});
		});
		$("#deleteAll").click(function() {
			$.post("deleteAll", function(data) {
				if (data.msg == 1) {
					window.location = "${ctx}/contentList";
				}
			});
		});
	</script>
	<!-- 分页 -->
	<script type="text/javascript">
		layui.use('laydate', function() {
			var laydate = layui.laydate;

			//常规用法
			laydate.render({
				elem : '#test1'
			});

			//国际版
			laydate.render({
				elem : '#test1-1',

			});

		});

		layui.use([ 'laypage', 'layer' ], function() {
			var laypage = layui.laypage, layer = layui.layer;

			var currPage = $("#currPage").val();
			var pageSize = $("#pageSize").val();
			//总页数大于页码总数
			laypage.render({
				elem : 'demo1',
				count : $("#pageTotal").val() //数据总数
				,
				limit : $("#pageSize").val(),
				limits:[10, 15, 30,50],
				jump : function(obj, first) {
					console.log(obj.limit);

					if (obj.limit != pageSize) {
						$("#pageSize").val(obj.limit);
						$("#contentForm").submit();
					}
					if (obj.curr != currPage) {
						$("#currPage").val(obj.curr);
						$("#contentForm").submit();
					}

				},
				layout : [ 'prev', 'page', 'next', 'limit', 'count' ],
				curr : currPage
			});
		});

		var sum1 = 0;
		$("#tabBody tr").each(function() {

			var num1 = $(this).find("td:eq(2)").text();

			sum1 = sum1 + parseInt(num1);
		})

		$("#tabFoot th:eq(2)").text(sum1);
	</script>
</body>
</html>