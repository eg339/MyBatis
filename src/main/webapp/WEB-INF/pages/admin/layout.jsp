<%@ page language="java" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>首页</title>
<!--Bootstrap Stylesheet [ REQUIRED ]-->
<link href="${ctx}/resource/css/bootstrap.min.css" rel="stylesheet" />
<!--前端校验框架CSS [ REQUIRED ]-->
<link href="${ctx}/resource/css/bootstrapValidator.css" rel="stylesheet" />
<!--Nifty Stylesheet [ REQUIRED ]-->
<link href="${ctx}/resource/css/nifty.min.css" rel="stylesheet" />
<!--Font Awesome [ OPTIONAL ]-->
<link href="${ctx}/resource/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
<!--Switchery [ OPTIONAL ]-->
<link href="${ctx}/resource/plugins/switchery/switchery.min.css" rel="stylesheet" />
<!--Bootstrap Select [ OPTIONAL ]-->
<link href="${ctx}/resource/plugins/bootstrap-select/bootstrap-select.min.css" rel="stylesheet" />
<!-- table -->
<link href="${ctx}/resource/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet" />
<!--Bootstrap Datepicker [ OPTIONAL ]-->
<link href="${ctx}/resource/plugins/bootstrap-datepicker/bootstrap-datepicker.css" rel="stylesheet" />
<!--Morris.js [ OPTIONAL ]-->
<%-- <link href="${ctx}/resource/plugins/morris-js/morris.min.css" rel="stylesheet" /> --%>
<!--X-editable [ OPTIONAL ]-->
<link href="${ctx}/resource/plugins/x-editable/css/bootstrap-editable.css" rel="stylesheet" />
<!--Demo [ DEMONSTRATION ]-->
<link href="${ctx}/resource/css/nifty-demo.min.css" rel="stylesheet" />
<link href="${ctx}/resource/css/theme-light.min.css" rel="stylesheet" />
<link href="${ctx}/resource/css/jqpagination.css" rel="stylesheet" />
<!--ownerstyle-->
<link href="${ctx}/resource/css/iconfont.css" rel="stylesheet" />
<link href="${ctx}/resource/css/style.css" rel="stylesheet" />
<link href="${ctx}/resource/css/color-admin.css" rel="stylesheet" />

<script type="text/javascript">
var contextPath="${ctx}";
</script>
<!--jQuery [ REQUIRED ]-->
<script src="${ctx}/resource/js/ui/jquery-2.1.1.min.js"></script>
<script src="${ctx}/resource/js/ui/jquery.form.js"></script>
</head>
<body>
	<div id="container" class="effect mainnav-lg <c:if test="${isWelcomePage}">aside-in</c:if>">
		<tiles:insertAttribute name="header" />
		<!-- 下部框架 -->
		<div class="boxed">
			<!-- 主体内容 -->
			<tiles:insertAttribute name="content" />
			<!-- 左侧导航 -->
			<tiles:insertAttribute name="menu" />
			<!-- 右侧功能区 -->
			<tiles:insertAttribute name="toolkit" />
		</div>	
		<tiles:insertAttribute name="footer" />
	</div>
	<%@include file="/common/common.jsp" %>
	
<!--BootstrapJS [ RECOMMENDED ]-->
<script src="${ctx}/resource/js/ui/bootstrap.min.js"></script>
<!--前端校验框架-->
<script src="${ctx}/resource/js/ui/bootstrapValidator.js"></script>
<script src="${ctx}/resource/js/ui/zh_CN.js"></script>
<!--Fast Click [ OPTIONAL ]-->
<script src="${ctx}/resource/plugins/fast-click/fastclick.min.js"></script>
<!--Nifty Admin [ RECOMMENDED ]-->
<script src="${ctx}/resource/js/ui/nifty.min.js"></script>
<!--Modals [ SAMPLE ]-->
<script src="${ctx}/resource/js/ui/ui-modals.js"></script>
<!--Switchery [ OPTIONAL ]-->
<script src="${ctx}/resource/plugins/switchery/switchery.min.js"></script>
<!--Bootstrap Select [ OPTIONAL ]-->
<script src="${ctx}/resource/plugins/bootstrap-select/bootstrap-select.min.js"></script>
<!--Demo script [ DEMONSTRATION ]-->
<script src="${ctx}/resource/js/ui/nifty-demo.min.js"></script>
<!-- table -->
<script src="${ctx}/resource/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<!--X-editable [ OPTIONAL ]-->
<script src="${ctx}/resource/plugins/x-editable/js/bootstrap-editable.min.js"></script>
<!--Bootstrap Table Extension [ OPTIONAL ]-->
<script src="${ctx}/resource/plugins/bootstrap-table/extensions/editable/bootstrap-table-editable.js"></script>
<!--Bootstrap Table Sample [ SAMPLE ]-->
<script src="${ctx}/resource/js/ui/tables-bs-table.js"></script>
<!--Bootstrap Datepicker [ OPTIONAL ]-->
<script src="${ctx}/resource/plugins/bootstrap-datepicker/bootstrap-datepicker.js"></script>
<script src="${ctx}/resource/js/ui/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="${ctx}/resource/js/ui/jquery.jqpagination.js"></script>
<script src="${ctx}/resource/js/ui/echarts.js"></script>
<script src="${ctx}/resource/js/ui/line.js"></script>
<script src="${ctx}/resource/js/common.js"></script>
</body>
</html>