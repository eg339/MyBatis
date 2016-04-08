/**
 * 
 */
function jump(){
	var url="pages/admin/login.jsp";
	$ ajax({
		type:"get",
		url:url,
		data:{},
		datatype:"json",
		success:function(){},
		error:function(){}
	});
}