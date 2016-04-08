<%@ page language="java" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/common/taglibs.jsp"%>
<input type="hidden" name="ctx" id="ctx" value="${ctx}">
<!-- 顶部框架 -->
<header id="navbar" class="cy-index-nav">
	<div id="navbar-container" class="boxed">
		<!-- 头部logo -->
		<div class="navbar-header cy-navbar-header-admin">
			<a href="${ctx}/admin/welcome.htm" class="navbar-brand cy-navbar-brand-admin">
				<img src="${ctx}/resource/img/logo.png" alt="Nifty Logo" class="brand-icon">
				<div class="brand-title">
					<span class="brand-text"><img src="${ctx}/resource/img/Logo_text.png"></span>
				</div>
			</a>
		</div>
		<!--头部logo结束-->
		<!-- 顶部 -->
		<div class="navbar-content cy-navbar-content-admin clearfix">
			<!-- 左侧菜单收缩按钮 -->
			<ul class="nav navbar-top-links pull-left">
				<li class="tgl-menu-btn">
					<a class="mainnav-toggle" href="#">
						<i class="fa fa-navicon fa-lg"></i>
					</a>
				</li>
			</ul>
			<!-- 左侧菜单收缩按钮结束 -->
			<!-- 右侧功能区 -->
			<ul class="nav navbar-top-links pull-right cy-index-navright">
				<li><a href="${ctx}/admin/welcome.htm">首页</a></li>
				<li class="no-hover"><a>|</a></li>
				<!-- <li><a href="#1">测试卡申请</a></li> -->
				<!-- <li class="no-hover"><a>|</a></li> -->
				<li><a href="${ctx}/portal/help.htm">帮助</a></li>
				<li class="no-hover"><a>|</a></li>
				<li><a href="${ctx}/loginOut.htm">退出</a></li>
				<li id="dropdown-user" class="dropdown">
					<a href="#" data-toggle="dropdown" class="dropdown-toggle text-right">
						<span class="pull-right">
							<img class="img-circle img-user media-object" src="${ctx}/resource/img/av1.png" alt="Profile Picture">
						</span>
						<div class="username hidden-xs"></div>
					</a>
					<div class="dropdown-menu dropdown-menu-md dropdown-menu-right with-arrow panel-default">
						<div class="pad-all bord-btm hidden">
							<p class="text-lg text-muted text-thin mar-btm">750Gb of 1,000Gb Used</p>
							<div class="progress progress-sm">
								<div class="progress-bar" style="width: 70%;">
									<span class="sr-only">70%</span>
								</div>
							</div>
						</div>
						<ul class="head-list">
							<li>
								<a href="${ctx}/admin/info/info.htm">
									<i class="fa fa-user fa-fw fa-lg"></i> 个人信息
								</a>
							</li>
							<!-- <li>
								<a href="#">
									<span class="badge badge-danger pull-right">9</span>
									<i class="fa fa-envelope fa-fw fa-lg"></i> 信息
								</a>
							</li> -->
							<!-- <li>
								<a href="#">
									<i class="fa fa-gear fa-fw fa-lg"></i> 设置
								</a>
							</li> -->
							<!-- <li>
								<a href="#">
									<i class="fa fa-question-circle fa-fw fa-lg"></i> 帮助
								</a>
							</li> -->
							<!-- <li>
								<a href="#">
									<i class="fa fa-lock fa-fw fa-lg"></i> 锁屏
								</a>
							</li> -->
						</ul>
						<div class="pad-all text-right">
							<a href="${ctx}/loginOut.htm" class="btn btn-primary">
								<i class="fa fa-sign-out fa-fw"></i> 注销
							</a>
						</div>
					</div>
				</li>
				<li data-content="Additional Sidebar" data-original-title="" title="">
					<a id="demo-toggle-aside" class="shortcut-grid cy-nav-icon" href="#">
						<div class="cy-nav-icon-flag-admin"></div>
						<i class="fa fa-navicon fa-lg"></i>
					</a>
				</li>
			</ul>
			<!-- 右侧功能区结束 -->
		</div>
		<!-- 顶部结束 -->
	</div>
</header>
<!-- 顶部框架结束 -->