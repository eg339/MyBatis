$(function() {
	var loginType = $("#loginType").val();
	if (loginType == "01")
		$("#adminLoginTab").click();
	if (loginType == "02")
		$("#userLoginTab").click();

	var faIcon = {
		valid : 'glyphicon glyphicon-ok',
		invalid : 'glyphicon glyphicon-remove',
		validating : 'glyphicon glyphicon-refresh'
	}
	$("#adminLoginForm").bootstrapValidator({
		message : '该值无效',
		feedbackIcons : faIcon,
		excluded : ':disabled',
		fields : {
			username : {
				message : '登录名无效',
				validators : {
					notEmpty : {
						message : '登录名不能为空'
					},
					stringLength : {
						min : 5,
						max : 16,
						message : '登录名长度为5到16位'
					},
					regexp : {
						regexp : /^[A-Za-z][A-Za-z0-9\\_\\@\\.]+$/,
						message : '登录名只能由字母、数字和下划线'
					}
				}
			},
			password : {
				message : '密码无效',
				validators : {
					notEmpty : {
						message : '密码不能为空'
					},
					stringLength : {
						min : 6,
						max : 20,
						message : '密码长度为6到20位'
					},
					regexp : {
						regexp : /^[a-zA-Z0-9_]+$/,
						message : '密码只能由字母、数字和下划线组成'
					}
				}
			},
			authcode : {
				message : '验证码无效',
				validators : {
					notEmpty : {
						message : '验证码不能为空'
					},
					stringLength : {
						min : 4,
						max : 4,
						message : '验证码长度为4'
					},
					numeric : {
						message : '验证码由数字组成'
					}
				}
			}
		}
	});

	$("#customerLoginForm").bootstrapValidator({
		message : '该值无效',
		feedbackIcons : faIcon,
		excluded : ':disabled',
		fields : {
			username : {
				message : '登录名无效',
				validators : {
					notEmpty : {
						message : '登录名不能为空'
					},
					stringLength : {
						min : 5,
						max : 16,
						message : '登录名长度为5到16位'
					},
					regexp : {
						regexp : /^[A-Za-z][A-Za-z0-9\\_\\@\\.]+$/,
						message : '登录名只能由字母、数字和下划线组成'
					}
				}
			},
			password : {
				message : '密码无效',
				validators : {
					notEmpty : {
						message : '密码不能为空'
					},
					stringLength : {
						min : 6,
						max : 20,
						message : '密码长度为6到20位'
					},
					regexp : {
						regexp : /^[a-zA-Z0-9_]+$/,
						message : '密码只能由字母、数字和下划线组成'
					}
				}
			},
			authcode : {
				message : '验证码无效',
				validators : {
					notEmpty : {
						message : '验证码不能为空'
					},
					stringLength : {
						min : 4,
						max : 4,
						message : '验证码长度为4'
					},
					numeric : {
						message : '验证码由数字组成'
					}
				}
			}
		}
	});
	/* 注册 */
	$('#registerForm').bootstrapValidator({
		message : '这个值是无效的',
		feedbackIcons : faIcon,
		excluded : [ ':disabled' ],
		fields : {
			loginName : {
				message : '登录名无效',
				validators : {
					notEmpty : {
						message : '登录名不能为空'
					},
					stringLength : {
						min : 5,
						max : 16,
						message : '登录名长度为5到16位'
					},
					regexp : {
						regexp : /^[A-Za-z][A-Za-z0-9\\_\\@\\.]+$/,
						message : '登录名只能由字母、数字和下划线组成'
					},
					callback : {
						message : '该登录名已被使用',
						callback : function(value, validator) {
							var flag=false;
							 $.ajax({
									type : "post",
									async : false,
									url : $("#ctx").val()
											+ "/portal/checkLoginName.htm",
									data : {
										'loginName' : value
									},
									datatype : "json",
									success : function(json) {
										if (json.status == "succ")
											flag = true;
										else
											flag = false;
									}
								});
							return flag;
						}
					}
				}
			},
			email : {
				message : '邮箱地址无效',
				validators : {
					notEmpty : {
						message : '邮箱地址不能为空'
					},
					emailAddress : {
						message : '邮箱地址格式不正确'
					}
				}
			},
			mobile : {
				message : '手机号无效',
				validators : {
					regexp : {
						regexp : /(^13\d{9}$)|(^14)[5,7]\d{8}$|(^15[0,1,2,3,5,6,7,8,9]\d{8}$)|(^17)[6,7,8]\d{8}$|(^18\d{9}$)/,
						message : '手机号格式不正确'
					}
				}
			},
			loginPwd : {
				message : '密码无效',
				validators : {
					notEmpty : {
						message : '密码不能为空'
					},
					stringLength : {
						min : 6,
						max : 20,
						message : '密码长度为6到20位'
					},
					regexp : {
						regexp : /^[a-zA-Z0-9_]+$/,
						message : '密码只能由字母、数字和下划线组成'
					}
				}
			},
			confirmPwd : {
				message : '密码无效',
				validators : {
					notEmpty : {
						message : '密码不能为空'
					},
					identical : {
						field : 'loginPwd',
						message : '两次输入的密码不一致'
					}
				}
			}
		}
	});

	$("#findPwdForm").bootstrapValidator({
		message : '该值无效',
		feedbackIcons : faIcon,
		excluded : ':disabled',
		fields : {
			account : {
				message : '登录名无效',
				validators : {
					notEmpty : {
						message : '登录名不能为空'
					},
					stringLength : {
						min : 5,
						max : 16,
						message : '登录名长度为5到16位'
					}
				}
			}
		}
	});
	$("#adminFindPwdForm").bootstrapValidator({
		message : '该值无效',
		feedbackIcons : faIcon,
		excluded : ':disabled',
		fields : {
			account : {
				message : '登录名无效',
				validators : {
					notEmpty : {
						message : '登录名不能为空'
					},
					stringLength : {
						min : 5,
						max : 16,
						message : '登录名长度为5到16位'
					},
					regexp : {
						regexp : /^(?!_)(?!.*?_$)[a-zA-Z0-9_@.]+$/,
						message : '登录名只能由字母、数字和下划线组成'
					}
				}
			}
		}
	});
	
	$("#resetPwdForm").bootstrapValidator({
		message : '该值无效',
		feedbackIcons : faIcon,
		excluded : ':disabled',
		fields : {
			pwd : {
				message : '密码无效',
				validators : {
					notEmpty : {
						message : '密码不能为空'
					},
					stringLength : {
						min : 6,
						max : 20,
						message : '登录名长度为6到20位'
					}
				}
			},
			confirmPwd : {
				message : '密码无效',
				validators : {
					notEmpty : {
						message : '密码不能为空'
					},
					identical : {
						field : 'pwd',
						message : '两次输入的密码不一致'
					}
				}
			}
		}
	});
	
	$("#adminResetPwdForm").bootstrapValidator({
		message : '该值无效',
		feedbackIcons : faIcon,
		excluded : ':disabled',
		fields : {
			pwd : {
				message : '密码无效',
				validators : {
					notEmpty : {
						message : '密码不能为空'
					},
					stringLength : {
						min : 6,
						max : 20,
						message : '登录名长度为6到20位'
					}
				}
			},
			confirmPwd : {
				message : '密码无效',
				validators : {
					notEmpty : {
						message : '密码不能为空'
					},
					identical : {
						field : 'pwd',
						message : '两次输入的密码不一致'
					}
				}
			}
		}
	});
});

// 验证码刷新
function refreshCode(type) {
	var timestamp = (new Date()).getTime();
	if (type == 1)
		$("#userAuthCode").attr(
				"src",
				$("#ctx").val() + "/portal/user/authCode.htm?timestamp="
						+ timestamp);
	else if (type == 2)
		$("#adminAuthCode").attr(
				"src",
				$("#ctx").val() + "/portal/admin/authCode.htm?timestamp="
						+ timestamp);
	else if (type == 3)
		$("#pwdAuthCode").attr(
				"src",
				$("#ctx").val() + "/portal/findPwd/authCode.htm?timestamp="
						+ timestamp);
}
// 打开注册界面
function toRegister() {
	$('#registerForm').data('bootstrapValidator').resetForm();
	$("#registerForm")[0].reset();
	$("#userRegisterDialog").modal('show');
}
// 注册提交
function doRegister() {
	if (!$('#registerForm').data('bootstrapValidator').validate().isValid())
		return;
	$("#registerForm").ajaxSubmit({
		dataType : 'json',
		type : "post",
		success : function(data) {
			if (data.status == "succ") {
				Modal.alert({
					msg : data.msg
				});
				$("#userRegisterDialog").modal('hide');
			} else {
				Modal.alert({
					msg : data.msg
				});
			}
		},
		error : function() {
			Modal.alert({
				msg : "注册失败"
			});
		}
	});
}
// 打开普通用户找回密码界面
function toFindPwd() {
	$('#findPwdForm').data('bootstrapValidator').resetForm();
	$("#findPwdForm")[0].reset();
	$("#userFindPwdDialog").modal('show');
}
// 打开管理员找回密码界面
function toAdminFindPwd() {
	$('#adminFindPwdForm').data('bootstrapValidator').resetForm();
	$("#adminFindPwdForm")[0].reset();
	$("#adminFindPwdDialog").modal('show');
}

// 发送普通用户邮箱验证码
function doSendEmailCode() {
	if (!$('#findPwdForm').data('bootstrapValidator').validate().isValid())
		return;
	if ($("#account").val() == "") {
		Modal.alert({
			msg : "请输入登录名"
		});
		return;
	}
	var url = $("#ctx").val() + "/portal/sendEmailCode.htm";
	var param = {
		'account' : $("#account").val(),
	}
	$.ajax({
		type : "post",
		url : url,
		data : param,
		datatype : "json",
		success : function(data) {
			if (data.status == "succ")
				Modal.alert({
					msg : "邮箱验证码发送成功，请查收"
				});
			else
				Modal.alert({
					msg : data.msg
				});
		},
		error : function() {
			Modal.alert({
				msg : "服务器没有返回数据，可能服务器忙，请重试"
			});
		}
	});
}

// 发送管理员邮箱验证码
function doAdminSendEmailCode() {
	if (!$('#adminFindPwdForm').data('bootstrapValidator').validate().isValid())
		return;
	if ($("#adminAccount").val() == "") {
		Modal.alert({
			msg : "请输入登录名或邮箱"
		});
		return;
	}
	var url = $("#ctx").val() + "/portal/admin/sendEmailCode.htm";
	var param = {
		'account' : $("#adminAccount").val(),
	}
	$.ajax({
		type : "post",
		url : url,
		data : param,
		datatype : "json",
		success : function(data) {
			if (data.status == "succ")
				Modal.alert({
					msg : "邮箱验证码发送成功，请查收"
				});
			else
				Modal.alert({
					msg : data.msg
				});
		},
		error : function() {
			Modal.alert({
				msg : "服务器没有返回数据，可能服务器忙，请重试"
			});
		}
	});
}
// 验证通过，进入普通用户重置密码界面
function toResetPwd() {
	if (!$('#findPwdForm').data('bootstrapValidator').validate().isValid())
		return;
	var url = $("#ctx").val() + "/portal/toResetPwd.htm";
	var param = {
		'account' : $("#account").val(),
		'emailCode' : $("#emailCode").val()
	}
	$.ajax({
		type : "post",
		url : url,
		data : param,
		datetype : "json",
		success : function(data) {
			if (data.status == "succ") {
				$("#resetPwdLoginName").val(data.loginName);
				$("#userFindPwdDialog").modal('hide');
				$("#userResetPwdDialog").modal('show');
			} else
				Modal.alert({
					msg : "邮箱验证码验证失败，请重试"
				});
		},
		error : function() {
			Modal.alert({
				msg : "服务器没有返回数据，可能服务器忙，请重试"
			});
		}
	});
}

// 验证通过，进入管理员重置密码界面
function toAdminResetPwd() {
	if (!$('#adminFindPwdForm').data('bootstrapValidator').validate().isValid())
		return;
	var url = $("#ctx").val() + "/portal/admin/toResetPwd.htm";
	var param = {
		'account' : $("#adminAccount").val(),
		'emailCode' : $("#adminEmailCode").val()
	}
	$.ajax({
		type : "post",
		url : url,
		data : param,
		datetype : "json",
		success : function(data) {
			if (data.status == "succ") {
				$("#adminResetPwdLoginName").val(data.loginName);
				$("#adminFindPwdDialog").modal('hide');
				$("#adminResetPwdDialog").modal('show');
			} else
				Modal.alert({
					msg : "邮箱验证码验证失败，请重试"
				});
		},
		error : function() {
			Modal.alert({
				msg : "服务器没有返回数据，可能服务器忙，请重试"
			});
		}
	});
}
// 普通用户重置密码操作
function doResetPwd() {
	if (!$('#resetPwdForm').data('bootstrapValidator').validate().isValid())
		return;
	$("#resetPwdForm").ajaxSubmit({
		type : "post",
		datatype : "json",
		success : function(json) {
			if (json.status == "succ") {
				Modal.alert({
					msg : json.msg
				});
				$("#userResetPwdDialog").modal('hide');
			} else {
				Modal.alert({
					msg : json.msg
				});
			}
		},
		error : function() {
			Modal.alert({
				msg : "服务器没有返回数据，可能服务器忙，请重试"
			});
		}
	});
}

// 管理员重置密码操作
function doAdminResetPwd() {
	if (!$('#adminResetPwdForm').data('bootstrapValidator').validate().isValid())
		return;
	$("#adminResetPwdForm").ajaxSubmit({
		type : "post",
		datatype : "json",
		success : function(json) {
			if (json.status == "succ") {
				Modal.alert({
					msg : json.msg
				});
				$("#adminResetPwdDialog").modal('hide');
			} else {
				Modal.alert({
					msg : json.msg
				});
			}
		},
		error : function() {
			Modal.alert({
				msg : "服务器没有返回数据，可能服务器忙，请重试"
			});
		}
	});
}