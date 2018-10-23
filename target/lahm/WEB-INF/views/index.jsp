<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<c:set var="title" value="柳暗花明又一村"></c:set>
<!DOCTYPE html>
<html>

<!-- Head -->
<head>

<title>柳岸花明-首页</title>

<!-- Meta-Tags -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="keywords" content="">

<!-- //Meta-Tags -->

<!-- Custom-Stylesheet-Links -->
 <%--  <link rel="stylesheet" href="${ctx}/static/css/bootstrap/bootstrap.css" 		 type="text/css" media="all"> --%>

<!-- Slider-CSS --><link rel="stylesheet" href="${ctx}/static/css/main/slider/camera.css" id="camera-css" type="text/css" media="all">
<link rel="stylesheet" href="${ctx}/static/layui/css/layui.css">
<link rel="stylesheet" href="${ctx}/static/css/main/index.css">
</head>
<!-- //Head -->



<!-- Body -->
<body>

	<header class="header_nav">
		<div class="layui-logo"><img src="${ctx}/static/images/main/header/logo.png"/>柳暗花明又一村</div>
		<ul class="layui-nav layui-bg-green">
			<li class="layui-nav-item layui-this"><a href="">首页</a></li>
			<c:forEach  var="nav" items="${navList}">
				 <li class="layui-nav-item"><a href="${nav.href}">${nav.title}</a></li>
			</c:forEach>
		  
		  <%-- <li class="layui-nav-item"><a href="">产品</a></li>
		  <li class="layui-nav-item"><a href="">大数据</a></li>
		  <li class="layui-nav-item">
		    <a href="javascript:;">解决方案</a>
		    <dl class="layui-nav-child">
		      <dd><a href="">移动模块</a></dd>
		      <dd><a href="">后台模版</a></dd>
		      <dd><a href="">电商平台</a></dd>
		    </dl>
		  </li>
		  <li class="layui-nav-item"><a href="">社区</a></li> --%>
		  <%-- <li class="layui-nav-item"><a href="${ctx}/user/logout">退出</a></li> --%>
		</ul>
	</header>

	<!-- Header -->
	<div class="agileheaderw3ls" id="agilehomewthree">
		<!-- Slider -->
		<div class="w3slideraits">
			<div class="camera_wrap  agileits camera_magenta_skin" id="camera_wrap_2">
				<div data-src="${ctx}/static/images/main/slider/slide-1.jpeg" class=" agileits">
					<!-- <div class="camera_caption  agileits fadeFromBottom">
						<h3 class=" agileits">柳暗花明又一村-这里就是全世界</h3>
					</div> -->
				</div>
				<div class=" agileits" data-src="${ctx}/static/images/main/slider/slide-2.jpeg">
					<!-- <div class="camera_caption  agileits fadeFromBottom">
						<h3 class=" agileits">让我们一起探索</h3>
					</div> -->
				</div>
				<div data-src="${ctx}/static/images/main/slider/slide-3.jpeg" class=" agileits">
					<!-- <div class="camera_caption  agileits fadeFromBottom">
						<h3 class=" agileits">最先进的技术</h3>
					</div> -->
				</div>
				<div class=" agileits" data-src="${ctx}/static/images/main/slider/slide-4.jpeg">
					<!-- <div class="camera_caption  agileits fadeFromBottom">
						<h3 class=" agileits">丰富多彩的资源</h3>
					</div> -->
				</div>
				<div data-src="${ctx}/static/images/main/slider/slide-5.jpeg" class=" agileits">
					<!-- <div class="camera_caption  agileits fadeFromBottom">
						<h3 class=" agileits">学天下美食 <a class="scroll" href="#portfolio"></a> </h3>
					</div> -->
				</div>
			</div>
		</div>
		<!-- //Slider -->

	</div>





		<script type="text/javascript" src="${ctx}/static/js/jquery/jquery.min.js"></script>
		<script type="text/javascript" src="${ctx}/static/js/bootstrap/bootstrap.js"></script>
		
		<script type="text/javascript" src="${ctx}/static/layui/layui.js"></script>
		
		<!-- Slider-JavaScript-Files -->
			<script type="text/javascript" src="${ctx}/static/js/main/slider/jquery.easing.1.3.js"></script>
			<script type="text/javascript" src="${ctx}/static/js/main/slider/jquery.mobile.customized.min.js"></script>
			<script type="text/javascript" src="${ctx}/static/js/main/slider/camera.js"></script>
			<script>
				jQuery(function(){
					jQuery('#camera_wrap_2').camera({
						loader: 'bar',
						speed: 1000,
						pagination: false,
						thumbnails: false,
					});
				});
			</script>
		<!-- //Slider-JavaScript-Files -->


	<script>
		layui.use('element', function(){
		  var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
		  
		  //监听导航点击
		  element.on('nav(demo)', function(elem){
		    //console.log(elem)
		    layer.msg(elem.text());
		  });
		});
	</script>

</body>
<!-- //Body -->



</html>