<%@ page language="java" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>欢迎登录</title>
<!--Bootstrap Stylesheet [ REQUIRED ]-->
<link href="${ctx}/resource/css/bootstrap.min.css" rel="stylesheet" />
<!--Nifty Stylesheet [ REQUIRED ]-->
<link href="${ctx}/resource/css/nifty.min.css" rel="stylesheet" />
<!--Font Awesome [ OPTIONAL ]-->
<link
	href="${ctx}/resource/plugins/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" />
<!--Demo [ DEMONSTRATION ]-->
<link href="${ctx}/resource/css/nifty-demo.min.css" rel="stylesheet" />
<!--mystyle-->
<link href="${ctx}/resource/css/style.css" rel="stylesheet" />
<!--前端校验框架CSS [ REQUIRED ]-->
<link href="${ctx}/resource/css/bootstrapValidator.css" rel="stylesheet" />
<!--SCRIPT-->
<!--=================================================-->
<!--jQuery [ REQUIRED ]-->
<script src="${ctx}/resource/js/ui/jquery-2.1.1.min.js"></script>
<script src="${ctx}/resource/js/ui/jquery.form.js"></script>
<!--BootstrapJS [ RECOMMENDED ]-->
<script src="${ctx}/resource/js/ui/bootstrap.min.js"></script>
<!--Fast Click [ OPTIONAL ]-->
<script src="${ctx}/resource/plugins/fast-click/fastclick.min.js"></script>
<!--Nifty Admin [ RECOMMENDED ]-->
<script src="${ctx}/resource/js/ui/nifty.min.js"></script>
<!--Background Image [ DEMONSTRATION ]-->
<script src="${ctx}/resource/js/ui/bg-images.js"></script>
<script src="${ctx}/resource/js/common.js"></script>
<script src="${ctx}/resource/js/app/login.js"></script>
<!--前端校验框架-->
<script src="${ctx}/resource/js/ui/bootstrapValidator.js"></script>
<script src="${ctx}/resource/js/ui/zh_CN.js"></script>
</head>
<body>
	<input type="hidden" name="ctx" id="ctx" value="${ctx}" />
	<div id="container" class="cls-container">
		<!-- BACKGROUND IMAGE -->
		<!--===================================================-->
		<div id="bg-overlay" class="bg-img img-balloon"></div>

		<!-- HEADER -->
		<!--===================================================-->
		<div class="cls-header cls-header-lg">
			<div class="cls-brand">
				<a class="box-inline" href="index.html"> <!-- <img alt="Nifty Admin" src="img/logo.png" class="brand-icon"> -->
					<span class="brand-title"><img
						src="${ctx}/resource/img/Logo_SCTP.png" /></span>
				</a>
			</div>
			<div class="cy-nav">
				<div class="cls-brand">
					<a href="${ctx}/index.jsp"> <!-- <img alt="Nifty Admin" src="img/logo.png" class="brand-icon"> -->
						<span class="text-thin">登录</span>
					</a>
				</div>
				<!-- <div class="cls-brand">
					<a href="index.html"> <img alt="Nifty Admin" src="img/logo.png" class="brand-icon">
						<span class="text-thin">测试卡申请</span>
					</a>
				</div> -->
				<div class="cls-brand">
					<a href="${ctx}/portal/help.htm" class="cy-noborder"> <!-- <img alt="Nifty Admin" src="img/logo.png" class="brand-icon"> -->
						<span class="text-thin">帮助</span>
					</a>
				</div>
			</div>
		</div>
		<!-- LOGIN FORM -->
		<!--===================================================-->
		<div class="cy-activities col-md-2 col-md-offset-2 cls-content">
			<div class="cy-login-left">
				<a href="#" class="panel-body cy-panel-top"><img
					src="${ctx}/resource/img/rightbox.jpg" /></a> <a href="#"
					class="panel-body cy-panel-center"><img
					src="${ctx}/resource/img/rightbox2.jpg" /></a> <a href="#"
					class="panel-body cy-panel-bottom"><img
					src="${ctx}/resource/img/rightbox3.jpg" /></a>
			</div>
			<div class="cy-login-button">
				<button class="btn btn-info btn-icon btn-circle cy-activities-btn">
					热门活动 <i class="fa fa-chevron-right"></i>
				</button>
			</div>
		</div>
		<input type="hidden" name="loginType" id="loginType"
			value="${LOGIN_TYPE}" />
		<div class="cls-content col-md-4">
			<div class="tab-base cy-login-tab">
				<!-- Nav tabs -->
				<ul class="nav nav-tabs">
					<li class="col-xs-6 cy-nopadding active"><a
						href="#customerLogin" data-toggle="tab" aria-expanded="true"
						id="userLoginTab"><i class="fa"></i> 普通用户</a></li>
					<li class="col-xs-6 cy-nopadding"><a href="#adminLogin"
						data-toggle="tab" aria-expanded="false" id="adminLoginTab"><i
							class="fa"></i> 管理员</a></li>
				</ul>
				<!-- Tabs Content -->
				<div class="tab-content">
					<div class="tab-pane pad-btm fade active in" id="customerLogin">
						<div class="panel-body">
							<p class="text-danger">${userErrMsg}</p>
							<!-- 普通用户登录 -->
							<form class="form-horizontal" id="customerLoginForm"
								action="${ctx}/portal/user/doLogin.htm" method="post">
								<div class="form-group">
									<div class="input-group">
										<div class="input-group-addon">
											<i class="fa fa-user"></i>
										</div>
										<input type="text" class="form-control" placeholder="登录名"
											name="username" value="${loginName}" />
									</div>
								</div>
								<div class="form-group">
									<div class="input-group">
										<div class="input-group-addon">
											<i class="fa fa-unlock-alt"></i>
										</div>
										<input type="password" class="form-control" placeholder="密码"
											name="password" />
									</div>
								</div>
								<div class="form-group col-xs-8 cy-nopadding">
									<div class="input-group">
										<div class="input-group-addon">
											<i class="fa fa-asterisk"></i>
										</div>
										<input type="text" class="form-control" placeholder="验证码"
											maxlength="4" name="authcode" />
									</div>
								</div>
								<div class="form-group col-xs-4 cy-login-validation">
									<img id="userAuthCode" src="${ctx}/portal/user/authCode.htm"
										onclick="javascript:refreshCode(1);" />
								</div>
								<!-- <div class="row">
									<div class="col-xs-8 text-left checkbox">
										<label class="form-checkbox form-icon form-text"> <input
											type="checkbox" /> 记住我
										</label>
									</div>
									<div class="col-xs-4">
										<div class="form-group text-right">
											<button class="btn btn-info btn-rounded">登录</button>
										</div>
									</div>
								</div>
								<div class="mar-btm">
									<em>- 第三方登录 -</em>
								</div> -->
								<button type="submit" class="btn btn-primary btn-lg btn-block">
									<i class="fa-fw"></i> 登录
								</button>
							</form>
							<div class="pad-ver">
								<a href="#" class="mar-rgt" onclick="toFindPwd();"><span
									class="text-primary">忘记密码?</span></a> <a href="#" class="mar-lft"
									onclick="toRegister();"><span class="text-primary">注册</span></a>
							</div>
						</div>
					</div>
					<div class="tab-pane pad-btm fade" id="adminLogin">
						<div class="panel-body">
							<p class="text-danger">${adminErrMsg}</p>
							<!-- 管理员登录 -->
							<form class="form-horizontal" id="adminLoginForm"
								action="${ctx}/portal/admin/doLogin.htm" method="post">
								<div class="form-group">
									<div class="input-group">
										<div class="input-group-addon">
											<i class="fa fa-user"></i>
										</div>
										<input type="text" class="form-control" placeholder="登录名"
											name="username" value="${adminLoginName}" />
									</div>
								</div>
								<div class="form-group">
									<div class="input-group">
										<div class="input-group-addon">
											<i class="fa fa-unlock-alt"></i>
										</div>
										<input type="password" class="form-control" placeholder="密码"
											name="password" />
									</div>
								</div>
								<div class="form-group col-xs-8 cy-nopadding">
									<div class="input-group">
										<div class="input-group-addon">
											<i class="fa fa-asterisk"></i>
										</div>
										<input type="text" class="form-control" placeholder="验证码"
											maxlength="4" name="authcode" />
									</div>
								</div>
								<div class="form-group col-xs-4 cy-login-validation">
									<img id="adminAuthCode" src="${ctx}/portal/admin/authCode.htm"
										onclick="javascript:refreshCode(2);" />
								</div>
								<!-- <div class="row">
									<div class="col-xs-8 text-left checkbox">
										<label class="form-checkbox form-icon form-text"> <input
											type="checkbox" /> 记住我
										</label>
									</div>
									<div class="col-xs-4">
										<div class="form-group text-right">
											<button class="btn btn-info btn-rounded">登录</button>
										</div>
									</div>
								</div>
								<div class="mar-btm">
									<em>- 第三方登录 -</em>
								</div> -->
								<button type="submit" class="btn btn-primary btn-lg btn-block">
									<i class="fa-fw"></i> 登录
								</button>
							</form>
							<div class="pad-ver">
								<a href="#" class="mar-rgt" onclick="toAdminFindPwd();"><span
									class="text-primary">忘记密码?</span></a>
							</div>
						</div>
					</div>
				</div>
				<div class="cy-fotter-company">Copyright &#0169; 2015-2016
					北京维思智达科技有限公司 Beijing WISE & RICH Co., Ltd All Rights Reserved</div>
			</div>
			<!-- <div class="pad-ver">
				<a href="#" class="btn-link mar-rgt" onclick="toFindPwd();">忘记密码
					?</a> <a href="#" class="btn-link mar-lft" onclick="toRegister();">注册</a>
			</div> -->
		</div>
		<div class="cy-activities col-md-2 cls-content">
			<div class="cy-login-right">
				<a class="panel-body cy-panel-top" href="#"><img
					src="${ctx}/resource/img/rightbox.jpg" /></a> <a
					class="panel-body cy-panel-center" href="#"><img
					src="${ctx}/resource/img/rightbox2.jpg" /></a> <a
					class="panel-body cy-panel-bottom" href="#"><img
					src="${ctx}/resource/img/rightbox3.jpg" /></a>
			</div>
			<div class="cy-login-button">
				<button class="btn btn-info btn-icon btn-circle cy-activities-btn">
					热门活动 <i class="fa fa-chevron-right"></i>
				</button>
			</div>
		</div>

		<!-- DEMO PURPOSE ONLY -->
		<div class="demo-bg hidden">
			<div id="demo-bg-list">
				<div class="demo-loading">
					<i class="fa fa-refresh"></i>
				</div>
				<img class="demo-chg-bg bg-trans"
					src="${ctx}/resource/img/bg-img/thumbs/bg-trns.jpg"
					alt="Background Image" /> <img class="demo-chg-bg"
					src="${ctx}/resource/img/bg-img/thumbs/bg-img-1.jpg"
					alt="Background Image" /> <img class="demo-chg-bg"
					src="${ctx}/resource/img/bg-img/thumbs/bg-img-2.jpg"
					alt="Background Image" /> <img class="demo-chg-bg"
					src="${ctx}/resource/img/bg-img/thumbs/bg-img-3.jpg"
					alt="Background Image" /> <img class="demo-chg-bg"
					src="${ctx}/resource/img/bg-img/thumbs/bg-img-4.jpg"
					alt="Background Image" /> <img class="demo-chg-bg"
					src="${ctx}/resource/img/bg-img/thumbs/bg-img-5.jpg"
					alt="Background Image" /> <img class="demo-chg-bg active"
					src="${ctx}/resource/img/bg-img/thumbs/bg-img-6.jpg"
					alt="Background Image" /> <img class="demo-chg-bg"
					src="${ctx}/resource/img/bg-img/thumbs/bg-img-7.jpg"
					alt="Background Image" />
			</div>
		</div>
	</div>
	<!-- 用户注册 -->
	<div id="userRegisterDialog" class="modal fade" tabindex="-1"
		data-backdrop="static">
		<div class="modal-dialog cy-modal-dialog-f">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
					<h4 class="modal-title" id="myLargeModalLabel">用户注册</h4>
				</div>
				<div class="modal-body">
					<form id="registerForm" method="post"
						action="${ctx}/portal/register.htm">
						<div class="form-group">
							<label class="form-label text-bold" for="">用户类型</label>
						</div>
						<div class="form-group">
							<label class="form-radio form-normal form-text" for="cardTest">
								<input id="cardTest" type="radio" name="userType" value="01"
								checked="checked" />卡商测试用户
							</label>
							<label class="form-radio form-normal form-text" for="appletTest">
								<input id="appletTest" type="radio" name="userType" value="02" />应用开发者测试用户
							</label>
<!-- 							<label class="form-radio form-normal form-text" for="unicomTest"> -->
<!-- 								<input id="unicomTest" type="radio" name="userType" value="03" />研究院测试用户 -->
<!-- 							</label> -->
						</div>
						<div class="form-group">
							<span class="text-danger">*</span> <label
								class="form-label text-bold" for="">登录名</label> <input
								id="loginName" class="form-control"
								placeholder="由字母、数字、下划线组成，首字母必须为字母，长度5到16个字符" type="text"
								name="loginName" />
						</div>
						<div class="form-group">
							<span class="text-danger">*</span> <label
								class="form-label text-bold" for="">E-mail</label> <input
								class="form-control" placeholder="请输入正确的E-mail" type="text"
								name="email" />
						</div>
						<div class="form-group">
							<label class="form-label text-bold" for="">手机号</label> <input
								class="form-control" placeholder="请输入正确的手机号" type="text"
								name="mobile" />
						</div>
						<div class="form-group">
							<label class="form-label text-bold" for="">姓名</label> <input
								class="form-control" placeholder="请输入您的真实姓名" type="text"
								name="userName" />
						</div>
						<div class="form-group">
							<span class="text-danger">*</span> <label
								class="form-label text-bold" for="">密码</label> <input
								style="display: none;" class="form-control"
								placeholder="由字母、数字、下划线组成，长度6到20个字符" type="password" /> <input
								class="form-control" placeholder="由字母、数字、下划线组成，长度6到20个字符"
								type="password" name="loginPwd" />
						</div>
						<div class="form-group">
							<span class="text-danger">*</span> <label
								class="form-label text-bold" for="">确认密码</label> <input
								class="form-control" placeholder="请再次输入密码" type="password"
								name="confirmPwd" />
						</div>
					</form>
				</div>
				<!--Modal footer-->
				<div class="modal-footer">
					<button class="btn btn-primary" onclick="doRegister();">注册</button>
					<button data-dismiss="modal" class="btn btn-default" type="button"
						onclick="dialogCancel('userRegisterDialog');">取消</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 管理员找回密码Dialog-->
	<div id="adminFindPwdDialog" class="modal fade" tabindex="-1"
		data-backdrop="static">
		<div class="modal-dialog cy-modal-dialog-f">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
					<h4 class="modal-title" id="myLargeModalLabel">找回密码</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<form id="adminFindPwdForm" method="post" action="#">
							<div class="form-group">
								<div class="input-group">
									<div class="input-group-addon">
										<i class="fa fa-user"></i>
									</div>
									<input id="adminAccount" class="form-control" placeholder="登录名"
										type="text" name="account" />
								</div>
							</div>
							<div class="form-group col-xs-12 cy-nopadding">
								<div class="input-group">
									<div class="input-group-addon">
										<i class="fa fa-asterisk"></i>
									</div>
									<input id="adminEmailCode" class="form-control"
										placeholder="邮箱验证码" maxlength="6" type="text" name="emailCode" />
								</div>
							</div>
						</form>
					</div>
				</div>
				<!--Modal footer-->
				<div class="modal-footer">
					<button class="btn btn-primary" onclick="doAdminSendEmailCode();">发送邮箱验证码</button>
					<button class="btn btn-primary" onclick="toAdminResetPwd();">下一步</button>
					<button data-dismiss="modal" class="btn btn-default" type="button"
						onclick="dialogCancel('adminFindPwdDialog');">取消</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 用户找回密码 -->
	<div id="userFindPwdDialog" class="modal fade" tabindex="-1"
		data-backdrop="static">
		<div class="modal-dialog cy-modal-dialog-f">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
					<h4 class="modal-title" id="myLargeModalLabel">找回密码</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<form id="findPwdForm" method="post" action="#">
							<div class="form-group">
								<div class="input-group">
									<div class="input-group-addon">
										<i class="fa fa-user"></i>
									</div>
									<input id="account" class="form-control" placeholder="登录名"
										type="text" name="account" />
								</div>
							</div>
							<div class="form-group col-xs-12 cy-nopadding">
								<div class="input-group">
									<div class="input-group-addon">
										<i class="fa fa-asterisk"></i>
									</div>
									<input id="emailCode" class="form-control" placeholder="邮箱验证码"
										maxlength="6" type="text" name="emailCode" />
								</div>
							</div>
						</form>
					</div>
				</div>
				<!--Modal footer-->
				<div class="modal-footer">
					<button class="btn btn-primary" onclick="doSendEmailCode();">发送邮箱验证码</button>
					<button class="btn btn-primary" onclick="toResetPwd();">下一步</button>
					<button data-dismiss="modal" class="btn btn-default" type="button"
						onclick="dialogCancel('userFindPwdDialog');">取消</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 普通用户重置密码Dialog -->
	<div id="userResetPwdDialog" class="modal fade" tabindex="-1"
		data-backdrop="static">
		<div class="modal-dialog cy-modal-dialog-f">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
					<h4 class="modal-title" id="myLargeModalLabel">重置密码</h4>
				</div>
				<div class="modal-body">
					<form id="resetPwdForm" method="post"
						action="${ctx}/portal/doResetPwd.htm">
						<div class="form-group">
							<input type="hidden" id="resetPwdLoginName" class="form-control"
								placeholder="由字母、数字、下划线组成，首字母必须为字母，长度5到16个字符" type="text"
								name="loginName" />
						</div>
						<div class="form-group">
						<span class="text-danger">*</span>
							<label class="form-label text-bold" for="">密码</label> <input
								id="resetPwd" class="form-control"
								placeholder="由字母、数字、下划线组成，长度6到20个字符" type="password" name="pwd" />
						</div>
						<div class="form-group">
						<span class="text-danger">*</span>
							<label class="form-label text-bold" for="">确认密码</label> <input
								id="resetConfirmPwd" class="form-control" placeholder="请再次输入密码"
								type="password" name="confirmPwd" />
						</div>
					</form>
				</div>
				<!--Modal footer-->
				<div class="modal-footer">
					<button class="btn btn-primary" onclick="doResetPwd();">确定</button>
					<button data-dismiss="modal" class="btn btn-default" type="button"
						onclick="dialogCancel('userResetPwdDialog');">取消</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 管理员重置密码Dialog -->
	<div id="adminResetPwdDialog" class="modal fade" tabindex="-1"
		data-backdrop="static">
		<div class="modal-dialog cy-modal-dialog-f">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
					<h4 class="modal-title" id="myLargeModalLabel">重置密码</h4>
				</div>
				<div class="modal-body">
					<form id="adminResetPwdForm" method="post"
						action="${ctx}/portal/admin/doResetPwd.htm">
						<div class="form-group">
							<input type="hidden" id="adminResetPwdLoginName"
								class="form-control"
								placeholder="由字母、数字、下划线组成，首字母必须为字母，长度5到16个字符" type="text"
								name="loginName" />
						</div>
						<div class="form-group">
						<span class="text-danger">*</span>
							<label class="form-label text-bold" for="">密码</label> <input
								id="adminResetPwd" class="form-control"
								placeholder="由字母、数字、下划线组成，长度6到20个字符" type="password" name="pwd" />
						</div>
						<div class="form-group">
						<span class="text-danger">*</span>
							<label class="form-label text-bold" for="">确认密码</label> <input
								id="adminResetConfirmPwd" class="form-control"
								placeholder="请再次输入密码" type="password" name="confirmPwd" />
						</div>
					</form>
				</div>
				<!--Modal footer-->
				<div class="modal-footer">
					<button class="btn btn-primary" onclick="doAdminResetPwd();">确定</button>
					<button data-dismiss="modal" class="btn btn-default" type="button"
						onclick="dialogCancel('adminResetPwdDialog');">取消</button>
				</div>
			</div>
		</div>
	</div>

	<%@include file="/common/common.jsp"%>
	<script type="text/javascript">
		$('.cy-activities-btn').click(function() {
			$(this).parent().prev().addClass('active');
			$(this).addClass('active-button');
		});
		$.ajax({
			type : "get",
			url : $("#ctx").val() + "/pvStatis.htm"
		});
	</script>
</body>
</html>