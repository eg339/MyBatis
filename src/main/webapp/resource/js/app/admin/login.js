$( function() {
//	loginFormReset();
	
	$.ajaxSetup({ cache: false });
	
	$.formValidator.initConfig( {
		validatorgroup : "1",
		formid :"loginForm",
		errorfocus : false,
		onerror : function(input1,input2) {
	    	return false;
		}
	});
	
	//用户名
	$("#loginName").formValidator({
		validatorgroup : "1",
		onshow:"请输入用户名",
		onfocus:"数字、字母及下划线",
		empty:false
	}).inputValidator({
		min:4,
		max:20,
		onerror:"长度应为4-20"
	}).regexValidator({
		regexp:"username",
		datatype:"enum",
		onerror:"错误格式"
	});
	//登录密码
	$("#password").formValidator({
		validatorgroup : "1",
		onshow:"请输入登录密码",
		onfocus:"只能包含数字、字母",
		empty:false
	}).inputValidator({
		min:4,
		max:18,
		onerror:"长度应为4-18"
	}).regexValidator({
		regexp:"isNumOrWord",
		datatype:"enum",
		onerror:"错误格式"
	});
	//验证码
	$("#authCode").formValidator({
		validatorgroup : "1",	
		onshow:" ",
		onfocus:"数字格式",
		empty:false
	}).inputValidator({
		min:6,
		max:6,
		onerror:"6位长度"
	}).regexValidator({
		regexp:"isNumber",
		datatype:"enum",
		onerror:"错误格式"
	});
});
//刷新验证码
function refreshCode(){
	var timestamp = (new Date()).getTime();
	$("#authCode1").attr("src", $("#ctx").val()+"/admin/login/authCode.htm?timestamp=" + timestamp);
};

//表单重置
function loginFormReset(){
	$("#loginForm")[0].reset();
}