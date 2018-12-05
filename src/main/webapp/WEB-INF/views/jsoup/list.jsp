<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0" />
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
				<div class="layui-inline" style="width: 80%">
					<label class="layui-form-label">url:</label>
					<div class="layui-input-inline webUrl">
						<input type="text" class="layui-input" id="webUrl"
							autocomplete="off" name="webUrl" 
							placeholder="请输入网址" style="width: 100%;">
					</div>
				</div>

				<div class="layui-inline">
					<input type="hidden" id="dataJson"/>
					<button id="searchBtn" type="button" class="layui-btn layui-btn layui-btn-warm">提交</button>
					<button id="emptyBtn" type="button" class="layui-btn layui-btn layui-btn-warm">清空</button>
					<button id="copyBtn" type="button" class="layui-btn layui-btn layui-btn-warm" data-clipboard-text="我是被复制的内容啊">复制</button>
				</div>
				<div class="layui-inline">
					总条数：<span id="listSize">${fn:length(jsoupList)}</span>
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
				<%-- <c:forEach var="data" items="${jsoupList}">
					<tr>
						<td>${data.name}</td>
						<td>${data.price}</td>
						<td><a href="${data.webUrl}">${data.webUrl}</a></td>
						<td><a href="${data.imgUrl}">${data.imgUrl}</a></td>
						<td>${data.brand}</td>
					</tr>
				</c:forEach> --%>
			</tbody>
		</table>
	</div>

	<script type="text/javascript" src="${ctx}/static/js/jquery/jquery-2.1.4.min.js">
	
	</script>
<script type="text/javascript" src="${ctx}/static/js/common/clipboard.min.js"></script>

	<script src="${ctx}/static/layui/layui.js"></script>
	<!-- Excel -->
	<script type="text/javascript">

		function refreshPage(){
			window.location.reload();
		}
	</script>
	<!-- 分页 -->
	<script type="text/javascript">
	
		$("#emptyBtn").click(function(){
			$("#webUrl").val("");
		});
		/* $("#copyBtn").click(function(){
			
			 var input = document.getElementById("dataJson");
		    // input.value = text; // 修改文本框的内容
		      input.select(); // 选中文本
		      document.execCommand("copy"); 

		      alert("复制成功");
		}); */
		//var btn = document.getElementById('');
		var clipboard = new Clipboard('#copyBtn');

		clipboard.on('success', function(e) {
			alert("文字已复制到剪贴板中");
			console.log(e);
		});

		clipboard.on('error', function(e) {
			console.log(e);
		});
		var layer;
		layui.use('layer', function(){
		   layer = layui.layer;
		});  
		var loadindex;
		
		
		$("#searchBtn").click(function(){
			$.ajax({
				url:"${ctx}/jsoup/get",
				data:{webUrl:$("#webUrl").val()},
				dataType:"json",
				beforeSend:function(){
					//loadindex=layer.load(2, {time: 10*1000});
					loadindex=layer.msg('加载中', {
						  icon: 16
						  ,shade: 0.5
						});
				},
				success:function(res){
					layer.close(loadindex);
					console.log(res);
					if(res.code=="1"){
						var dataList=res.message;
						$("#tabBody").empty();
						$("#listSize").text(dataList.length);
						for(var i=0;i<dataList.length;i++){
							
							var data="<tr><td>"+dataList[i].name+"</td>"+
								"<td>"+dataList[i].price+"</td>"+
								"<td><a href='"+dataList[i].webUrl+"' target='_blank'>"+dataList[i].webUrl+"</a></td>"+
								"<td><a href='"+dataList[i].imgUrl+"' target='_blank'>"+dataList[i].imgUrl+"</a></td>"+
								"<td>"+dataList[i].brand+"</td></tr>";
								$("#tabBody").append(data);
						}
						$("#copyBtn").attr("data-clipboard-text",JSON.stringify(res.message));
					}else{
						layer.msg(res.message);
					}
				},
				error:function(){
					layer.close(loadindex);
					layer.msg("服务器异常！");
				}
			});
		});
		
		
	</script>
</body>
</html>