<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>柳暗花明-登录</title>
<link rel="shortcut icon" href="${ctx}/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="${ctx}/static/css/login/login.css">
<link rel="stylesheet" href="${ctx}/static/layui/css/layui.css">

</head>
<body>
	<header class="titleName">
		柳岸花明<!-- 又一村 -->
	</header>
	<article id="loginContent" data-scroll-reveal="enter bottom over 1s after 0.5s">
		<section class="login_wrapper">
			<div class="layui-form-item">
			    <label class="layui-form-label">User name</label>
			    <div class="layui-input-block">
			      <input type="text" name="userName" lay-verify="title" autocomplete="off" placeholder="phone/email/userName" class="layui-input userName">
			    </div>
			    <label class="login_error">123</label>
  			</div>
  			<div class="layui-form-item">
			    <label class="layui-form-label">User password</label>
			    <div class="layui-input-block">
			      <input type="password" name="passWord" lay-verify="title" autocomplete="off" placeholder="Please enter the user password" class="layui-input passWord">
			    </div>
			     <label class="forget_pass"><a href="#">忘记密码？</a><a href="#">立即注册</a></label>
  			</div>
  			 <div class="login_submit">
      				<!-- layui 2.2.5 新增 -->
      				<button class="layui-btn layui-btn-radius layui-btn-fluid" id="loginBtn" type="button">登                录</button>
    		</div>
		</section>
	</article>
	
	
	<script type="text/javascript" src="${ctx}/static/js/jquery/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="${ctx}/static/js/scrollReveal/scrollReveal.js"></script>
	<script type="text/javascript" src="${ctx}/static/layui/layui.js"></script>
	<script type="text/javascript" src="${ctx}/static/js/common/common.js"></script>
	
	<script type="text/javascript" src="${ctx}/static/js/login/login.js"></script>
	<script>
		/* $(function(){
			$("#loginContent").css("visibility","visible");
		}) */
	    if (!(/msie [6|7|8|9]/i.test(navigator.userAgent))){
	        (function(){
	            window.scrollReveal = new scrollReveal({reset: true});
	        })();
	    };
	</script>
</body>
</html>