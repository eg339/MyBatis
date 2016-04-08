<%@ page language="java" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/common/taglibs.jsp"%>
<input type="hidden" name="ctx" id="ctx" value="${ctx}">
<!-- 左侧导航 -->
<nav id="mainnav-container">
	<div id="mainnav">
		<div id="mainnav-menu-wrap">
			<div class="nano">
				<div class="nano-content">
					<ul id="mainnav-menu" class="list-group">
						<!-- 管理 -->
						<li class="list-header">管理 </li>
						<li>
							<a href="${ctx}/admin/welcome.htm">
								<i class="fa fa-home"></i>
								<span class="menu-title">
									<strong>首页</strong>
									<span class="label label-success pull-right">顶</span>
								</span>
							</a>
						</li>
						<li>
							<a href="#">
								<i class="fa fa-user"></i>
								<span class="menu-title">
									<strong>用户中心</strong>
								</span>
								<i class="arrow"></i>
							</a>
							<ul class="collapse">
								<li><a href="${ctx}/admin/info/info.htm">个人信息</a></li>
								<li><a href="${ctx}/admin/pwd/pwd.htm">密码修改</a></li>
							</ul>
						</li>
						
						<li>
							<a href="#">
								<i class="fa fa-user"></i>
								<span class="menu-title">
									<strong>平台用户管理</strong>
								</span>
								<i class="arrow"></i>
							</a>
							<ul class="collapse">
									<li><a href="${ctx}/admin/userManager/list.htm">用户管理</a></li>
									<li><a href="${ctx}/admin/operator/list.htm">管理员管理</a></li>
									<li><a href="${ctx}/admin/adminRole/list.htm">管理员角色管理</a></li>
							</ul>
						</li>
						
						<!-- 数据 -->
						<li class="list-divider"></li>
						<li class="list-header">数据</li>
						<li>
							<a href="${ctx }/admin/testParameter/list.htm">
								<i class="fa fa-android"></i>
								<span class="menu-title">
									<strong>测试参数管理</strong>
								</span>
							</a>
						</li>
						<li>
							<a href="${ctx }/admin/scriptManager/index.htm">
								<span class="my-fa fa-simcard"></span>
								<span class="menu-title">
									<strong>测试脚本管理</strong>
								</span>
							</a>
						</li>
						<li>
							<a href="${ctx }/admin/card/list.htm">
								<span class="my-fa fa-simcard"></span>
								<span class="menu-title">
									<strong>卡片数据管理</strong>
								</span>
							</a>
						</li>
						<li>
							<a href="${ctx }/admin/applet/list.htm">
								<i class="fa fa-android"></i>
								<span class="menu-title">
									<strong>应用数据管理</strong>
								</span>
							</a>
						</li>
						<li>
							<a href="#">
								<i class="fa fa-book"></i>
								<span class="menu-title">
									<strong>测试日志管理</strong>
								</span>
								<i class="arrow"></i>
							</a>
							<ul class="collapse">
									<li><a href="${ctx}/admin/testLog/cardTestList.htm">卡片测试日志</a></li>
									<li><a href="${ctx}/admin/testLog/list.htm">应用测试日志</a></li>
								<li class="list-divider"></li>
							</ul>
						</li>
						<li>
							<a href="${ctx }/admin/cardReaderDevice/list.htm">
								<span class="my-fa fa-simcard"></span>
								<span class="menu-title">
									<strong>读卡器资源管理</strong>
								</span>
							</a>
						</li>
						<li>
							<a href="${ctx }/admin/document/list.htm">
								<i class="fa fa-android"></i>
								<span class="menu-title">
									<strong>开发者文库</strong>
								</span>
							</a>
						</li>
						
						<!-- 测试 -->
						<li class="list-divider"></li>
						<li class="list-header">测试</li>
						<li>
							<a href="#">
								<i class="fa fa-briefcase"></i>
								<span class="menu-title">
									<strong>卡片测试环境</strong>
								</span>
								<i class="arrow"></i>
							</a>
							<ul class="collapse">
									<li><a href="${ctx}/admin/cardScriptTest/index.htm">在线卡片测试</a></li>
								<li class="list-divider"></li>
							</ul>
						</li>
						<li>
							<a href="#">
								<i class="fa fa-briefcase"></i>
								<span class="menu-title">
									<strong>应用测试环境</strong>
								</span>
								<i class="arrow"></i>
							</a>
							<ul class="collapse">
									<li><a href="${ctx}/admin/onlineTest/index.htm">离线卡应用测试</a></li>
									<li><a href="${ctx}/admin/networkTest/index.htm">实网卡应用测试</a></li>
									<li><a href="${ctx}/admin/simulationAppTest/index.htm">模拟卡应用测试</a></li>
								<li class="list-divider"></li>
							</ul>
						</li>
						
						<!-- 系统 -->
						<li class="list-divider"></li>
						<li class="list-header">系统</li>
						<li>
							<a href="#">
								<i class="fa fa-desktop"></i>
								<span class="menu-title">
									<strong>服务器状态</strong>
								</span>
								<i class="arrow"></i>
							</a>
							<ul class="collapse">
									<li><a href="${ctx}/admin/monitor/index.htm">实时监控</a></li>
									<li><a href="${ctx}/admin/monitorSetting/list.htm">告警设置</a></li>
							</ul>
						</li>
						<li>
							<a href="${ctx }/admin/executeLog/list.htm">
								<i class="fa fa-android"></i>
								<span class="menu-title">
									<strong>系统日志管理</strong>
								</span>
							</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</nav>
<!-- 左侧导航结束 -->