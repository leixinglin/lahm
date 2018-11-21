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

<link rel="stylesheet" href="${ctx}/static/layui/css/layui.css">
<style type="text/css">
body{padding: 15px;}
</style>
</head>
<body>
	<form action="${ctx}/data/list" method="post" id="contentForm"
		enctype="multipart/form-data">
		<input type="hidden" id="currPage" name="currentPage"
			value="${pageInfo.pageNum}" /> <input type="hidden" id="pageTotal"
			value="${pageInfo.total}" /> <input type="hidden" 
			name="pageSize" id="pageSize" value="${pageInfo.pageSize}" />
		<div class="layui-form">
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">起始时间</label>
					<div class="layui-input-inline">
						<input type="text" class="layui-input" id="startTime"
							autocomplete="off" name="startTime" value="${pd.startTime}"
							placeholder="开始日期">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">结束时间</label>
					<div class="layui-input-inline">
						<input type="text" class="layui-input" id="endTime"
							autocomplete="off" name="endTime" value="${pd.endTime}"
							placeholder="结束日期">
					</div>
				</div>
				<div class="layui-inline">
					<button class="layui-btn layui-btn layui-btn-warm">搜索</button>
				</div>
				<shiro:hasRole name="admin">
					<div class="layui-inline">
						<button type="button" class="layui-btn layui-btn-warm" id="uploadExcel"><i class="layui-icon">&#xe656;</i>上传模板</button>
					</div>
					<div class="layui-inline">
						<button type="button" class="layui-btn layui-btn layui-btn-warm btn-delete">清空数据</button>
					</div>
					<div class="layui-inline">
						<a href="${ctx}/data/fileDownLoad" class="layui-btn" target="_blank">下载模板</a>
					</div>
				</shiro:hasRole>
				
			</div>
			<div class="layui-form-item">
			    <div class="layui-inline"  >
			      <button id="addData" class="layui-btn layui-btn-normal layui-btn-sm" type="button"><i class="layui-icon">&#xe61f;</i></button>
			    </div>
			    <div id="updateData" class="layui-inline">
			      <button class="layui-btn layui-btn-normal layui-btn-sm" type="button"><i class="layui-icon">&#xe642;</i></button>
			    </div>
			    <div id="delData" class="layui-inline">
			      <button class="layui-btn layui-btn-normal layui-btn-sm" type="button"><i class="layui-icon">&#xe640;</i></button>
			    </div>
			  </div>
			  
		</div>
	</form>
	<div id="contentTab" class="layui-form" >
		<table class="layui-table">
			<!--  <caption>悬停表格布局</caption> -->
			<thead>
				<tr>
					<th width="2%">
						<input id="allCheck" type="checkbox" lay-skin="primary" lay-filter="allChoose"/>
					</th>
					<th>时间</th>
					<th>渠道</th>
					<th>激活</th>
				</tr>
			</thead>
			<tbody id="tabBody">
				<c:forEach var="data" items="${dataList}">
					<tr>
						<td><input type="checkbox" value="${data.id}" name="dataCheck" lay-skin="primary" lay-filter="dataChoose"></td>
						<td>${data.createTime}</td>
						<td>${data.channel}</td>
						<td>${data.active}</td>
					</tr>
				</c:forEach>
			</tbody>
			<shiro:hasRole name="admin">
				<tfoot>
					<tr id="tabFoot">
						<th></th>
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

		function refreshPage(){
			window.location.reload();
		}
		
		$(".btn-delete").click(function() {
			window.location.href='${ctx}/data/removeAll';
		});
	</script>
	<!-- 分页 -->
	<script type="text/javascript">
	var delList=[];
	//表单渲染
	//layui复选框操作（form表单要有class=layui-form,th要有lay-filter="allChoose" ）
	layui.use('form', function(){
	  var form = layui.form;
	  //全选
	  form.on('checkbox(allChoose)', function(data){
		  
	    var dataChecks=$(data.elem).parents('#contentTab').find("#tabBody tr input[type='checkbox']");
	    delList=[];
	    dataChecks.each(function(index,item){
	    	item.checked=data.elem.checked; 
	    	if(item.checked){
	    		delList.push(item.value);
	    	}else{
	    		var index = delList.indexOf(item.value);
				delList.splice(index,1);
	    	}
	    });
	    form.render('checkbox');
	  });
	  
	  form.on('checkbox(dataChoose)', function(data){
		  if(data.elem.checked){
			  delList.push(data.value);
			  if(delList.length==$("#pageSize").val()){
				  document.getElementById("allCheck").checked=data.elem.checked;
			  }
		  }else{
			  var index = delList.indexOf(data.value);
			  delList.splice(index,1);
			  document.getElementById("allCheck").checked=data.elem.checked;
		  }
		  form.render('checkbox');
		  /* console.log(data.elem); //得到checkbox原始DOM对象
		  console.log(data.elem.checked); //是否被选中，true或者false
		  console.log(data.value); //复选框value值，也可以通过data.elem.value得到
		  console.log(data.othis); //得到美化后的DOM对象 */
		}); 
	});
	
		//开始结束日期
		layui.use('laydate', function() {
			var laydate = layui.laydate;
			laydate.render({
				elem : '#startTime'
			});
			laydate.render({
				elem : '#endTime',
			});
		});

		//分页
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

					 if (obj.limit != pageSize&&pageSize!=0) {
						$("#pageSize").val(obj.limit);
						$("#contentForm").submit();
					}
					if (obj.curr != currPage&&currPage!=0) {
						$("#currPage").val(obj.curr);
						$("#contentForm").submit();
					}
 
					
				},
				layout : [ 'prev', 'page', 'next', 'limit', 'count' ],
				curr : currPage
			});
		});

		//计算总计
		var sum1 = 0;
		$("#tabBody tr").each(function() {

			var num1 = $(this).find("td:eq(3)").text();

			sum1 = sum1 + parseInt(num1);
		})

		$("#tabFoot th:eq(3)").text(sum1);
		
		
		//上传模版
		var loadIndex;
		layui.use('upload', function(){
			  var $ = layui.jquery
			  ,upload = layui.upload;
			  
			upload.render({
			    elem: '#uploadExcel'
			    ,url: '${ctx}/data/upload'
			    ,accept: 'file' //普通文件
			    ,exts: 'xls|xlsx' 
			    ,choose:function(){
			    	loadIndex = layer.load();
			    }
			    ,done: function(res){
			      console.log(res);
			      //关闭
			      layer.close(loadIndex);
			      if(res.code=="1"){
			    	  refreshPage();
			      }
			    },error:function(){
			    	alert("错误！");
			    }
			  });
		});
		
		var saveOpen;
		$("#addData").click(function(){
			 saveOpen=layer.open({
				  title:"编辑信息",
				  type: 2, 
				  content: '${ctx}/data/edit', //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
				  anim:2,
				  area: ['500px', '400px'],
				  maxmin:true
			}); 
			 //saveOpen.maxmin=true;
		});
		
		$("#updateData").click(function(){
			if(delList.length==1){
				saveOpen=layer.open({
					  title:"编辑信息",
					  type: 2, 
					  content: '${ctx}/data/edit/'+delList[0], //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
					  anim:2,
					  area: ['500px', '400px'],
					  maxmin:true
				}); 
			}else{
				layer.msg("请选择一条数据！");
			}
		})
		
		$("#delData").click(function(){
			if(delList.length>0){
				layer.confirm('你是否真的要删除这'+delList.length+'条数据吗?', {icon: 3, title:'删除提示'}, function(index){

					$.ajax({
						url:"${ctx}/data/batchDel",
						data:{ids:delList},
						dataType:"json",
						beforeSend:function(){
							layer.load(2, {time: 10*1000});
						},
						success:function(res){
							
							if(res=="1"){
								refreshPage();
							}
						},
						error:function(){
							layer.msg("服务器异常！");
						}
					});
					  layer.close(index);
				});
			}else{
				layer.msg("你还未选中数据！");
			}
			
			
			/*    */
			
		});
		
		
	</script>
</body>
</html>