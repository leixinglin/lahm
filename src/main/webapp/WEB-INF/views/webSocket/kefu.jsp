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
	<table width="500px;">
		<thead>
			<tr><th>用户</th><th>消息</th><th>操作</th></tr>
		</thead>
		<tbody id="userTab">
			
		</tbody>
	</table>
 	<!-- <div class="well" id="msg"></div> -->
<!-- <button class="btn btn-default" id="openSocket">联系客服</button> -->
<input type="hidden" id="kefuId" value="${userId}"/>
<script type="text/javascript" src="${ctx}/static/js/jquery/jquery-2.1.4.min.js">

</script>
<script src="${ctx}/static/layui/layui.js"></script>
<script type="text/javascript">
		$(function() {
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
	                   
	                };
	                websocket.onmessage = function(evnt) {
						console.log(evnt);
						var result= JSON.parse(evnt.data);
						//alert(result.code);
						if(result.code==2){
							$("#userTab").empty();
							var users=eval("("+result.message+")"); 
							 for(j = 0; j < users.length; j++) {
								   if(users[j]!=$("#kefuId").val()){
										  var userStr="<tr><td>"+users[j]+"</td><td class='infoNum infoNum_"+users[j]+"'><span>0</span>新条消息</td><td><button class='btn btn-default' onClick='kefu("+users[j]+")'>沟通</button></td></tr>";
										  $("#userTab").append(userStr);
									}
							 } 
						}else{
							var infoNum=$(".infoNum_"+result.code).find("span");
							infoNum.text(parseInt(infoNum.text())+1);
							console.log(result.code);
							console.log(result.message);
							
							if(document.getElementById('socketFrame'+result.code)!=null){
								var frameId=document.getElementById('socketFrame'+result.code).getElementsByTagName("iframe")[0].id;
								$('#'+frameId)[0].contentWindow.appendInfo(result.message);
							}
							//console.log("frameId"+frameId);
						}
						 
					
	                    //$("#msg").html($("#msg").html() + "<br/>" + evnt.data);
	                };
	                websocket.onerror = function(evnt) {};
	                websocket.onclose = function(evnt) {
	               		console.log("与服务器断开了链接!");
	                    
	                }
	                
	                
	 
	 
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
	
	
});
		
		var saveOpen;
		function kefu(userId){
				$(".infoNum_"+userId).find("span").text(0);
				 saveOpen=layer.open({
					  title:userId+"用户在跟你聊天",
					  type: 2, 
					  content: '${ctx}/message/kefuSocket/'+userId, //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
					  anim:2,
					  area: ['600px', '600px'],
					  maxmin:true,
					  id:"socketFrame"+userId
				}); 
				 
				//console.log(saveOpen);
		
		}
	
		
</script>
<script type="text/javascript">

</script>
</body>
</html>
