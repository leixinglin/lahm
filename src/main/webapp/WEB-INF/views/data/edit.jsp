<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ctx}/static/layui/css/layui.css">
<style type="text/css">
	body{padding: 15px;}
</style>
</head>
<body>
	<form class="layui-form" action="${ctx}/data/save">
	 <input type="hidden" name="id" value="${data.id}">
	  <div class="layui-form-item">
	    <label class="layui-form-label">创建日期</label>
	    <div class="layui-input-block">
	       <input type="text" name="createTime" value="${data.createTime}" id="date" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">渠道</label>
	    <div class="layui-input-block">
	      <input type="text" name="channel" value="${data.channel}" lay-verify="title" autocomplete="off" placeholder="请输入标题" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">激活数</label>
	    <div class="layui-input-block">
	      <input type="text" name="active" value="${data.active}" lay-verify="title" autocomplete="off" placeholder="请输入标题" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <div class="layui-input-block">
	      <button class="layui-btn" lay-submit="" lay-filter="submit">立即提交</button>
	      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
	    </div>
	  </div>
	 </form>
<script type="text/javascript" src="${ctx}/static/js/jquery/jquery-2.1.4.min.js"></script>
<script src="${ctx}/static/layui/layui.js"></script>
<script type="text/javascript">
	layui.use(['form', 'layedit', 'laydate'], function(){
		  var form = layui.form
		  ,layer = layui.layer
		  ,layedit = layui.layedit
		  ,laydate = layui.laydate;
		  
		  //日期
		  laydate.render({
		    elem: '#date'
		  });
		  
		  form.on('submit(submit)', function(data){
			  console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
			  console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
			  console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
			  if(data.field.id!=null&&data.field.id!=""){
				  $.ajax({
						 url:"${ctx}/data/update",
						 data:data.field,
						 dataType:"json",
						 beforeSend:function(){
								layer.load(2, {time: 10*1000});
						},
						 success:function(res){
							 if(res==true){
								/*  var  index= parent.layer.getFrameIndex(window.saveOpen);
								 parent.layer.close(index);  */
								 console.log("ok");
								 parent.location.reload();
								 //window.location.reload();
							 }else{
								 layer.msg("添加失败！");
							 }
						 },
						 error:function(res){
							 console.log(res);
						 }
					  });
			  }else{
				  $.ajax({
						 url:"${ctx}/data/save",
						 data:data.field,
						 dataType:"json",
						 beforeSend:function(){
								layer.load(2, {time: 10*1000});
							},
						 success:function(res){
							 if(res==true){
								/*  var  index= parent.layer.getFrameIndex(window.saveOpen);
								 parent.layer.close(index);  */
								 console.log("ok");
								 parent.location.reload();
								 //window.location.reload();
							 }else{
								 layer.msg("添加失败！");
							 }
						 },
						 error:function(res){
							 console.log(res);
						 }
					  });
			  }
			  
			  return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
			});
	});
</script>
</body>
</html>