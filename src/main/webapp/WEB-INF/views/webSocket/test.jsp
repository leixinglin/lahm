<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>

<head lang="en">
<meta charset="UTF-8">
<script src="http://cdn.sockjs.org/sockjs-0.3.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

<title>webSocket-用户66</title>

</head>

<body>
		<button class="btn btn-default" id="openSocket">联系客服</button>
</body>
<script type="text/javascript" src="${ctx}/static/js/jquery/jquery-2.1.4.min.js">

</script>
<script src="${ctx}/static/layui/layui.js"></script>
<script type="text/javascript">
$(function() {
	               
	                
	                $('#close').bind('click', function() {
	                	websocket.close();
	                });
	                
	                $('#send').bind('click', function() {
	                    send();
	                });
	 
	 
	                function send() {
	                    if(websocket != null) {
	                        var message = document.getElementById('message').value;
	                        console.log(message);
	                        websocket.send(message);
	                    } else {
	                        alert('未与服务器链接.');
	                    }
	                }
	
	window.onbeforeunload = function(event) {
	    console.log("关闭WebSocket连接！");
	    websocket.close();
	}
	
	//分页
	layui.use('layer', function(){
  		var layer = layui.layer;
	});
	var saveOpen;
	$("#openSocket").click(function(){

		
		
			 saveOpen=layer.open({
				  title:"联系客服",
				  type: 2, 
				  content: '${ctx}/message/socket/${userId}', //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
				  anim:2,
				  area: ['600px', '600px'],
				  maxmin:true,
				  id:"socketFrame",
				  cancel:function(index, layero){
					  var frameId=document.getElementById('socketFrame').getElementsByTagName("iframe")[0].id;
					   $('#'+frameId)[0].contentWindow.closeWebSocket();
				  }
			}); 
			 
			//console.log(saveOpen);
	
	})
});
	
		
</script>
<script type="text/javascript">

</script>
</html>
