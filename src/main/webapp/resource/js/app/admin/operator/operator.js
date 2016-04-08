/**
 * 操作员管理
 */
$.ajaxSetup({
	cache : false
});

$(function() {
	$('#adminTable').bootstrapTable({
		method : 'post',
		url : "query.htm",
		striped : true,
		dataType : "json",
		pagination : true,
		"queryParamsType" : "limit",
		singleSelect : false,
		contentType : "application/x-www-form-urlencoded",
		pageSize : 10,
		pageNumber : 1,
		search : false, // 不显示 搜索框
		showColumns : false, // 不显示下拉框（选择显示的列）
		sidePagination : "server", // 服务端请求
		queryParams : queryParams,
		// responseHandler : responseHandler,
		columns : [{
			field : 'seqNum',
			title : '序号'
		}, {
			field : 'userName',
			title : '用户名'
		}, {
			field : 'loginName',
			title : '登录名'
		}, {
			field : 'email',
			title : 'Email'
		}, {
			field : 'mobile',
			title : '手机号'
		}, {
			field : 'createDate',
			title : '创建时间'
		}, {
			field : 'lastLoginDate',
			title : '最后登录时间'
		}, {
			field : 'statusStr',
			title : '状态'
		}, {
			title : '操作',
			formatter : operateFormatter
		} ]
	});
	
	var faIcon = {
			 valid: 'glyphicon glyphicon-ok',
	         invalid: 'glyphicon glyphicon-remove',
	         validating: 'glyphicon glyphicon-refresh'
		}
	//新增管理员前台校验
	$("#addAdminForm").bootstrapValidator({
		message: '这个值是无效的',
		feedbackIcons:faIcon,
		excluded: [':disabled'],
		fields: {
			loginName:{
				message:'登录名无效',
				validators:{
					notEmpty:{
						message:'登录名不能为空'
					},
					stringLength:{
						min:5,
						max:16,
						message:'登录名长度为5到16个字符'
					},
					regexp:{
						regexp:/^(?!_)(?!.*?_$)[a-zA-Z0-9_@.]+$/,
						message:'登录名只能由字母、数字和下划线组成'
					}
				}
			},
			userName: {
				message: '用户名无效',
				validators: {
				    stringLength: {
						min: 2,
						max: 10,
						message: '用户名长度为2-10个字符'
				    },
				    regexp: {
						regexp: /^(?!_)(?!.*?_$)[a-zA-Z0-9_\u4e00-\u9fa5]+$/,
						message: '用户名只能由汉字字母、数字和下划线组成'
				    }
				}
		    },
		    email: {
				message: 'Email无效',
				validators: {
				    emailAddress : {
						message : 'Email格式错误'
					}
				}
		    },
		    mobile: {
				message: '手机号无效',
				validators: {
					regexp : {
						regexp : /(^13\d{9}$)|(^14)[5,7]\d{8}$|(^15[0,1,2,3,5,6,7,8,9]\d{8}$)|(^17)[6,7,8]\d{8}$|(^18\d{9}$)/,
						message : '手机号格式不正确'
					}
				}
		    },
		    password: {
		    	message:'密码无效',
				validators: {
				    notEmpty: {
				    	message: '密码不能为空'
				    },
				    stringLength:{
				    	min:6,
				    	max:20,
				    	message:'密码长度为6到20个字符'
				    },
				    regex:{
				    	regex:/^[a-zA-Z0-9_]+$/,
				    	message: '密码只能由字母、数字和下划线组成'
				    }
				}
		    },
		    roles:{
		    	message:'角色选择无效',
				validators: {
					choice: {
                        min: 1,
                        message: '必须勾选至少一项'
                    }
				}
		    }
		}
	});
	
	//编辑管理员前台验证
	$("#editAdminForm").bootstrapValidator({
		message:'这个值是无效的',
		feedbackIcons:{
			valid: 'fa fa-check',
			invalid: 'fa fa-times',
			validating: 'fa fa-refresh'
		},
		excluded: [':disabled'],
		fields:{
			loginName:{
				message:'登录名无效',
				validators:{
					notEmpty:{
						message:'登录名不能为空'
					},
					stringLength:{
						min:5,
						max:16,
						message:'登录名长度为5到16个字符'
					},
					regex:{
						regex:/^[A-Za-z][A-Za-z0-9\\_\\@\\.]+$/,
						message:'登录名只能由字母、数字和下划线'
					}
				}
			},
			userName:{
				message:'用户名无效',
				validators:{
					stringLength:{
						min:2,
						max:10,
						message:'用户名长度为2-10个字符'
					},
					regex:{
						regex:/^(?!_)(?!.*?_$)[a-zA-Z0-9_u4e00-u9fa5]+$/,
						message:'用户名只能由汉字字母、数字和下划线组成'
					}
				}
			},
			email: {
				message: 'Email无效',
				validators: {
				    emailAddress : {
						message : 'Email格式错误'
					}
				}
		    },
		    mobile: {
				message: '手机号无效',
				validators: {
					regexp : {
						regexp : /(^13\d{9}$)|(^14)[5,7]\d{8}$|(^15[0,1,2,3,5,6,7,8,9]\d{8}$)|(^17)[6,7,8]\d{8}$|(^18\d{9}$)/,
						message : '手机号格式不正确'
					}
				}
		    },
		    roles:{
		    	message:'角色选择无效',
				validators: {
					choice: {
                        min: 1,
                        message: '必须勾选至少一项'
                    }
				}
		    }
		}
	}).on('error.validator.bv', function(e, data) {
		data.element.data('bv.messages').find('.help-block[data-bv-for="' + data.field + '"]')
			.hide().filter('[data-bv-validator="' + data.validator + '"]').show();
	});
	
	// 修改密码前台校验
	$("#resetPwdForm").bootstrapValidator({
		message: '这个值是无效的',
		feedbackIcons:faIcon,
		excluded: [':disabled'],
		fields: {
			pwd: {
				message: '原密码无效',
				validators: {
				    stringLength:{
				    	min:6,
				    	max:20,
				    	message:'密码长度为6-20个字符'
				    },
				    regex:{
				    	regex:/^[a-zA-Z0-9_]+$/,
				    	message: '密码只能由字母、数字和下划线组成'
				    }
				}
		    },
		    newPwd: {
				message: '新密码无效',
				validators : {
					notEmpty : {
						message : '新密码不能为空'
					},
					stringLength : {
						min : 6,
						max : 20,
						message : '密码长度为6到20个字符'
					},
					regex : {
						regex : /^[a-zA-Z0-9_]+$/,
						message : '密码只能由字母、数字和下划线组成'
					}
				}
		    },
		    confirmPwd: {
				message: '确认密码无效',
				validators: {
				    notEmpty: {
				    	message: '确认密码不能为空'
				    },
				    identical : {
						field : "newPwd",
						message : '确认密码与新密码不相同'
					}
				}
		    }
		}
	}).on('error.validator.bv', function(e, data) {
		data.element.data('bv.messages').find('.help-block[data-bv-for="' + data.field + '"]')
			.hide().filter('[data-bv-validator="' + data.validator + '"]').show();
	});
})

function queryParams(params) {
	return {
		rows : params.limit,
		page : params.offset / params.limit + 1,
		userName : $('#qUserName').val(),
		loginName : $('#qLoginName').val()
	};
}

function operateFormatter(value, row, index) {
	var status = row["status"];
	var editDef = "&nbsp;&nbsp;<button class=\"btn btn-primary btn-xs\" onclick=\"javascript:openEditAdmin('"
			+ row['id'] + "','" + row["userName"] + "','" + row["loginName"] + "','" + row["email"] + "','" + row["mobile"] + "')\">编辑</button>";
	var changePwdDef = "&nbsp;&nbsp;<button class=\"btn btn-primary btn-xs\" onclick=\"javascript:openResetPwd('"
			+ row['id'] + "')\">修改密码</button>";
	var disableDef = "&nbsp;&nbsp;<button class=\"btn btn-primary btn-xs\" onclick=\"javascript:disableAdmin('"
			+ row['id'] + "','" + row["userName"] + "')\">禁用</button>";
	var enabledDef = "&nbsp;&nbsp;<button class=\"btn btn-primary btn-xs\" onclick=\"javascript:enabledAdmin('"
			+ row['id'] + "','" + row["userName"] + "')\">启用</button>";
	var deleteDef = "&nbsp;&nbsp;<button class=\"btn btn-primary btn-xs\" onclick=\"javascript:deleteAdmin('"
			+ row['id'] + "','" + row["userName"] + "')\">删除</button>";
	if (status == "0") {
		return editDef + changePwdDef + disableDef + deleteDef;
	} else {
		return editDef + enabledDef + deleteDef;
	}
}

function doQuery() {
	$('#adminTable').bootstrapTable("getOptions").pageNumber = 1;
	$('#adminTable').bootstrapTable('refresh');
}

// 新增操作员对话框
function openAddAdmin() {
	/*解决验证时，表单验证错误时，此时关闭窗口，当重新打开窗口，验证错误仍然存在的问题*/
	$("#addAdminForm").data('bootstrapValidator').resetForm();
	
	$("#addAdminForm")[0].reset();
	$("label[name=addRoleLabel]").removeClass("active");
	$("#addAdminDialog").modal('show');
}

function getById(){
	$.ajax({
		type : "get",
		url : "getById.htm",
		data : {
			"id" : $("#adminID").val()
		},
		datatype : "json",
		success : function(data) {
			Modal.alert({
				msg:"查找成功"
			});
		},
		error : function() {
			Modal.alert({
				msg : "服务器没有返回数据，可能服务器忙，请重试"
			});
		}
	});
}

// 新增操作员
function addAdmin() {
	/*手动验证表单，当是普通按钮时。*/
	if(!$('#addAdminForm').data('bootstrapValidator').validate().isValid()){
		return ;
	}
	$("#addAdminForm").ajaxSubmit({
		dataType : 'json',
		type : "post",
		success : function(json) {
			if (json.status == "succ") {
				doQuery();
				Modal.alert({
					msg : "操作成功"
				});
				$("#addAdminDialog").modal('hide');
			} else {
				Modal.alert({
					msg : json.msg
				});
			}
		},
		error : function() {
			Modal.alert({
				msg : "操作失败"
			});
		}
	});
}

// 编辑信息对话框
function openEditAdmin(id, userName, loginName, email, mobile) {
	/*解决验证时，表单验证错误时，此时关闭窗口，当重新打开窗口，验证错误仍然存在的问题*/
	$("#editAdminForm").data('bootstrapValidator').resetForm();
	
	$("#editAdminForm")[0].reset();
	$("#addAdminDialog input[name='roles']").prop("checked", false);
	$("label[name=editRoleLabel]").removeClass("active");
	$("#editId").empty().val(id);
	$("#editUserName").empty().val(userName);
	$("#editLoginName").empty().val(loginName);
	$("#editEmail").empty().val(email);
	$("#editMobile").empty().val(mobile);

	$.ajax({
		type : "get",
		url : "getRoleByAdminId.htm",
		data : {
			"adminId" : id
		},
		datatype : "json",
		success : function(data) {
			$.each(data, function(index, value) {
				$("#editRole_" + value.id).prop("checked", true);
				$("#editRoleLabel_" + value.id).addClass("active");
			});
		},
		error : function() {
			Modal.alert({
				msg : "服务器没有返回数据，可能服务器忙，请重试"
			});
		}
	});
	$("#editAdminDialog").modal("show");
}

// 编辑操作员信息
function editAdmin() {
	if(!$("#editAdminForm").data('bootstrapValidator').validate().isValid())
		return ;
	$("#editAdminForm").ajaxSubmit({
		dataType : 'json',
		type : "post",
		success : function(json) {
			if (json.status == "succ") {
				doQuery();
				Modal.alert({
					msg : "操作成功"
				});
				$("#editAdminDialog").modal('hide');
			} else {
				Modal.alert({
					msg : json.msg
				});
			}
		},
		error : function() {
			Modal.alert({
				msg : "操作失败"
			});
		}
	});
}
/**
 * 启用管理员帐号
 */
function enabledAdmin(id, userName) {
	Modal.confirm({
		msg : "确认要启用管理员'" + userName + "'吗？"
	}).on(function(e) {
		if(!e)
			return;
		var url = "enabled.htm?time=" + new Date().getTime();
		var param = {
			"id" : id
		};
		$.ajax({
			type : "get",
			url : url,
			data : param,
			datatype : "json",
			success : function(data) {
				if (data.status == "succ")
					Modal.alert({
						msg : "启用成功"
					});
				else
					Modal.alert({
						msg : "启用失败"
					});
				doQuery();
			},
			error : function() {
				Modal.alert({
					msg : "服务器没有返回数据，可能服务器忙，请重试"
				});
			}
		});
	});
}
// 禁用帐号
function disableAdmin(adminId, userName) {
	Modal.confirm({
		msg : "确认要禁用操作员'" + userName + "'吗？"
	}).on(function(e) {
		if(!e)
			return;
		var url = "disable.htm?time=" + new Date().getTime();
		var param = {
			"id" : adminId
		};
		$.ajax({
			type : "get",
			url : url,
			data : param,
			datatype : "json",
			success : function(data) {
				if (data.status == "succ")
					Modal.alert({
						msg : "操作成功"
					});
				else
					Modal.alert({
						msg : "操作失败"
					});
				doQuery();
			},
			error : function() {
				Modal.alert({
					msg : "服务器没有返回数据，可能服务器忙，请重试"
				});
			}
		});
	});
}
// 修改密码对话框
function openResetPwd(id) {
	$("#resetPwdForm")[0].reset();
	$("#resetPwdId").empty().val(id);
	$("#resetPwdDialog").modal('show');
	$("#resetPwdForm").data('bootstrapValidator').resetForm();
}

// 修改密码
function resetPwd() {
	if(!$('#resetPwdForm').data('bootstrapValidator').validate().isValid()){
		return ;
	}
	$("#resetPwdForm").ajaxSubmit({
		dataType : 'json',
		type : "post",
		success : function(json) {
			if (json.status == "succ") {
				doQuery();
				Modal.alert({
					msg : "操作成功"
				});
				$("#resetPwdDialog").modal('hide');
			} else {
				Modal.alert({
					msg : json.msg
				});
			}
		},
		error : function() {
			Modal.alert({
				msg : "操作失败"
			});
		}
	});
}

// 删除操作员
function deleteAdmin(adminId, userName) {
	Modal.confirm({
		msg : "确认要禁用操作员'" + userName + "'吗？"
	}).on(function(e) {
		if(!e)
			return;
		var url = "delete.htm?time=" + new Date().getTime();
		var param = {
			"id" : adminId
		};
		$.ajax({
			type : "get",
			url : url,
			data : param,
			datatype : "json",
			success : function(data) {
				if (data.status == "succ")
					Modal.alert({
						msg : "操作成功"
					});
				else
					Modal.alert({
						msg : "操作失败"
					});
				doQuery();
			},
			error : function() {
				Modal.alert({
					msg : "服务器没有返回数据，可能服务器忙，请重试"
				});
			}
		});
	});
}