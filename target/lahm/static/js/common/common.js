
function notEmpty(str){
	if(""!=str&&str!=null&&str!="undefined"){
		return  true;
	}
	return false;
}

function isPoneAvailable(phone) {
    var myreg=/^[1][3,4,5,7,8][0-9]{9}$/;
    if (!myreg.test(phone)) {
    	$(".login_error").text("账户格式有误！");
        return false;
    } else {
        return true;
    }
}