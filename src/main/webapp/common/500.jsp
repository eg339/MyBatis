<%@ page language="java" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>首页</title>
	<!--Bootstrap Stylesheet [ REQUIRED ]-->
	<link href="${ctx}/resource/css/bootstrap.min.css" rel="stylesheet">
	<!--Nifty Stylesheet [ REQUIRED ]-->
	<link href="${ctx}/resource/css/nifty.min.css" rel="stylesheet">
	<!--Font Awesome [ OPTIONAL ]-->
	<link href="${ctx}/resource/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<!--Switchery [ OPTIONAL ]-->
	<link href="${ctx}/resource/plugins/switchery/switchery.min.css" rel="stylesheet">
	<!--Bootstrap Select [ OPTIONAL ]-->
	<link href="${ctx}/resource/plugins/bootstrap-select/bootstrap-select.min.css" rel="stylesheet">
	<!--Demo [ DEMONSTRATION ]-->
	<link href="${ctx}/resource/css/nifty-demo.min.css" rel="stylesheet">
	<link href="${ctx}/resource/css/theme-light.min.css" rel="stylesheet">
	<!--ownerstyle-->
	<link href="${ctx}/resource/css/iconfont.css" rel="stylesheet">
	<link href="${ctx}/resource/css/style.css" rel="stylesheet">
</head>
<body>
	<div id="container" class="cls-container">
		<div class="cls-header">
			<div class="cls-brand">
				<a class="box-inline" href="index.html">
					<!-- <img alt="Nifty Admin" src="images/logo.png" class="brand-icon"> -->
<!-- 					<span class="brand-title">Nifty <span class="text-thin">Admin</span></span> -->
				</a>
			</div>
		</div>
		<div class="cls-content">
			<h1 class="error-code text-danger">ERROR</h1>
			<p class="h4 text-thin pad-btm mar-btm">
				<i class="fa fa-exclamation-circle fa-fw"></i>
				服务器内部错误，请联系管理员...
			</p>
<!-- 			<div class="row mar-btm"> -->
<!-- 				<form class="col-xs-12 col-sm-10 col-sm-offset-1" method="post" action="pages-search-results.html"> -->
<!-- 					<input type="text" placeholder="Search.." class="form-control input-lg error-search"> -->
<!-- 				</form> -->
<!-- 			</div> -->
			<br>
			<div class="pad-top"><a class="btn-link" href="${ctx}/portal/index.htm">返回主页</a></div>
		</div>
	</div>

	<!--jQuery [ REQUIRED ]-->
	<script src="${ctx}/resource/js/ui/jquery-2.1.1.min.js"></script>
	<!--BootstrapJS [ RECOMMENDED ]-->
	<script src="${ctx}/resource/js/ui/bootstrap.min.js"></script>
	<!--Fast Click [ OPTIONAL ]-->
	<script src="${ctx}/resource/plugins/fast-click/fastclick.min.js"></script>
	<!--Nifty Admin [ RECOMMENDED ]-->
	<script src="${ctx}/resource/js/ui/nifty.min.js"></script>
</body>
</html>