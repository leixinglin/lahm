
layui.use('layer', function(){ //独立版的layer无需执行这一句
	var $ = layui.jquery, layer = layui.layer;
});

//回车事件
$(document).keydown(function (event) {
	if (event.keyCode == 13) {
		$("#loginBtn").click();
	}
});

//登录事件
$("#loginBtn").click(function(){
	var userName=$(".userName").val();
	var passWord=$(".passWord").val();
	var loadindex;
	if(checkUser(userName,passWord)){
		$(".login_error").hide();
		$.ajax({
			url:"/lahm/user/login",
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',//防止乱码
			type:"POST",
			data:{userName:userName,passWord:passWord},
			dataType:"json",
			beforeSend:function(){
				loadindex=layer.load(1);
			},
			complete:function(){
				layer.close(loadindex);
				console.log("ok!");
			},
			success:function(data){
				console.log(data);
				if(data.code==1){
					$(location).attr('href','/lahm/index');
				}else{
					$(".login_error").text(data.message);
					$(".login_error").show();
				}
			},
			error:function(data){
				$(".login_error").text(data.message);
				$(".login_error").show();
			}
		});
	}else{
		$(".login_error").show();
		$(".login_error").animate({
		    left:'0px',
		    opacity:'1'
		  });
	}
})
		
//验证用户名密码
function checkUser(userName,passWord){
	if(notEmpty(userName)&&notEmpty(passWord)){
		return isPoneAvailable(userName);
	}else{
		$(".login_error").text("账户和密码不能为空！");
		return false;
	}
}