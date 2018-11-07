<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ctx}/static/layui/css/layui.css">
<style type="text/css">
	html{height:100%;width:100%;overflow-y:hidden; }
	body{height:100%;width:100%;}
	#content{display:flex;flex-direction:column;height:100%;width:100%;}
	#infoTab{flex:7;display: flex;flex-direction:column;}
	.kefu_info,.user_info{width: 100%;height:30px;}
	.kefu_info .text{float:right;padding: 5px;margin:10px 10px 0px 0px;background: #3385ff}
	.user_info .text{float: left;padding: 5px;margin:10px 0px 0px 10px;background: #3385ff}
	#socketInfo{flex:3}
	#message{width:100%;height:70%;border:0px;background: none;}
</style>
</head>
<body>
<div id="content">
	<div id="infoTab">
		<!-- <div class="kefu_info">
			<span class="text">message</span>
		</div>
		<div class="user_info">
			<span class="text">message</span>
		</div> -->
	</div>
	<hr/>
	<div id="socketInfo">
		
		<textarea  id="message" autofocus="autofocus">
		</textarea>
		<button class="layui-btn layui-btn-normal" id="sendMsg">发送</button>
	</div>
</div>
<input type="hidden" id="userId" value="${userId}"/>
<script type="text/javascript" src="${ctx}/static/js/jquery/jquery-2.1.4.min.js">
		
	</script>


	<script src="${ctx}/static/layui/layui.js"></script>
	<script type="text/javascript">
		
	 var websocket;
		
		                if('WebSocket' in window) {
		                                        console.log("此浏览器支持websocket");
		                    websocket = new WebSocket("ws://localhost:8080/lahm/websocketDemo/${userId}");
		                } else if('MozWebSocket' in window) {
		                    alert("此浏览器只支持MozWebSocket");
		                } else {
		                    alert("此浏览器只支持SockJS");
		                }
		                websocket.onopen = function(evnt) {
		                 console.log(evnt);
		                    
		                };
		                websocket.onmessage = function(evnt) {
							var result= JSON.parse(evnt.data);
		                   var infoStr="<div class='kefu_info'><span class='text'>"+result.message+"</span></div>";
							$("#infoTab").append(infoStr);
		                };
		                websocket.onerror = function(evnt) {};
		                websocket.onclose = function(evnt) {
		               		console.log("与服务器断开了链接!");
		                }
		
		function closeWebSocket(){
			websocket.close();
		}
		
		$("#sendMsg").click(function(){
			//alert($("#message").val());
			$.get('${ctx}/message/TestWS',
					{userId:16,message:$("#message").val(),formUserId:$("#userId").val()},
					function(res,status){
						console.log(res);
						var infoStr="<div class='user_info'><span class='text'>"+$("#message").val()+"</span></div>";
						$("#infoTab").append(infoStr);
						$("#message").val("");
					});
		});
	</script>
</body>
</html>