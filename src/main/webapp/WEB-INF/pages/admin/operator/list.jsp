<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!-- 主体内容 -->
<div id="content-container">
	<div id="page-title">
		<h1 class="page-header text-overflow">管理员管理</h1>
	</div>
	<ol class="breadcrumb">
		<li><a href="#">首页</a></li>
		<li><a href="#">管理</a></li>
		<li><a href="#">平台用户管理</a></li>
		<li class="active">管理员管理</li>
	</ol>
	<div id="page-content" class="col-xs-12 cy-data-form-content">
		<div class="panel">
			<div class="panel-heading">
				<div class="panel-control">
					<button class="btn btn-default collapsed" data-target="#demo-panel-collapse-default2" data-toggle="collapse" aria-expanded="false"><i class="fa fa-chevron-down"></i></button>
				</div>
				<h3 class="panel-title">管理员账号管理</h3>
			</div>
			<div id="demo-panel-collapse-default2" class="collapse in" aria-expanded="false">
				<div class="panel-body">
					<div class="bord-all">
						<div class="row cy-pad-btm-s">
							<div class="col-md-5">
								<div class="form-inline">
									<div class="form-group cy-mar-ver-s">
										<span class="cy-pad-hor-s">用户名</span>
										<input type="text" placeholder="" id="qUserName" class="form-control">
									</div>
									<div class="form-group cy-mar-ver-s">
										<span class="cy-pad-hor-s">登录名称</span>
										<input type="text" placeholder="" id="qLoginName" class="form-control">
									</div>
									<div class="form-group cy-mar-ver-s">
										<span class="cy-pad-hor-s">ID</span>
										<input type="text" placeholder="" id="adminID" class="form-control">
									</div>
								</div>
							</div>
							<div class="col-md-7 cy-text-right-md">
								<div class="form-inline">
									<div class="form-group cy-mar-ver-s">
										<button class="btn btn-primary cy-pad-rgt-s" onclick="doQuery();">查询</button>
									</div>
									<div class="form-group cy-mar-ver-s">
										<button class="btn btn-primary cy-pad-rgt-s" onclick="openAddAdmin();">新增</button>
									</div>
									<div class="form-group cy-mar-ver-s">
										<button class="btn btn-primary cy-pad-rgt-s" onclick="getById();">根据ID查找对象</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="table-responsive">
						<table id="adminTable" >
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div id="addAdminDialog" class="modal fade" tabindex="-1"  data-backdrop="static">
	<div class="modal-dialog cy-modal-dialog-f">
		<div class="modal-content">
			<div class="modal-header">
				<button class="close" data-dismiss="modal"><span>&times;</span></button>
				<h4 class="modal-title" id="myLargeModalLabel">新增管理员</h4>
			</div>
			<div class="modal-body">
				<form id="addAdminForm" method="post" action="${ctx}/admin/operator/add.htm" class="form-horizontal">
					<div class="form-group">
						<label class="form-label text-bold" for=""><span class="text-danger">*</span>登录名</label>
						<input class="form-control" placeholder="由字母、数字、下划线组成，首字母必须为字母，长度5到16个字符" type="text" name="loginName" id="addLoginName"/>
					</div>
					<div class="form-group">
						<label class="form-label text-bold" for="">用户名</label>
						<input class="form-control" placeholder="由汉字、字母、数字、下划线组成，长度2到10个字符" type="text" name="userName" id="addUserName" />
					</div>
					<div class="form-group">
						<label class="form-label text-bold" for="">Email</label>
						<input class="form-control" placeholder="请输入Email" type="text" name="email" id="addEmail" />
					</div>
					<div class="form-group">
						<label class="form-label text-bold" for="">手机号</label>
						<input class="form-control" placeholder="请输入手机号" type="text" name="mobile" id="addMobile" />
					</div>
					<div class="form-group">
						<label class="form-label text-bold" for=""><span class="text-danger">*</span>密码</label>
						<input class="form-control" placeholder="由字母、数字、下划线组成，长度6到20个字符" type="password" name="password" id="addPassword" />
					</div>
				</form>
			</div>
			<!--Modal footer-->
			<div class="modal-footer">
				<button class="btn btn-primary" onclick="addAdmin();">确定</button>
				<button data-dismiss="modal" class="btn btn-default" type="button">取消</button>
			</div>
		</div>
	</div>
</div>

<div id="editAdminDialog" class="modal fade" tabindex="-1" data-backdrop="static">
	<div class="modal-dialog cy-modal-dialog-f">
		<div class="modal-content">
			<div class="modal-header">
				<button class="close" data-dismiss="modal"><span>&times;</span></button>
				<h4 class="modal-title" id="myLargeModalLabel">修改管理员</h4>
			</div>
			<div class="modal-body">
				<form id="editAdminForm" method="post" action="${ctx}/admin/operator/edit.htm" class="form-horizontal">
					<input type="hidden" id="editId" name="id">
					<div class="form-group">
						<label class="form-label text-bold" for=""><span class="text-danger">*</span>登录名</label>
						<input class="form-control" placeholder="由字母、数字、下划线组成，首字母必须为字母，长度5到16个字符" type="text" name="loginName" id="editLoginName"/>
					</div>
					<div class="form-group">
						<label class="form-label text-bold" for="">用户名</label>
						<input class="form-control" placeholder="由汉字、字母、数字、下划线组成，长度2到10个字符" type="text" name="userName" id="editUserName" />
					</div>
					<div class="form-group">
						<label class="form-label text-bold" for="">Email</label>
						<input class="form-control" placeholder="请输入Email" type="text" name="email" id="editEmail" />
					</div>
					<div class="form-group">
						<label class="form-label text-bold" for="">手机号</label>
						<input class="form-control" placeholder="请输入手机号" type="text" name="mobile" id="editMobile" />
					</div>
					<div class="form-group">
						<label class="form-label text-bold" for=""><span class="text-danger">*</span>角色</label>
						<div class="form-group">
							<div class="col-md-10 col-xs-10">
								<div class="checkbox cy-nopadding" id="editRoles">
									<c:forEach var="role" items="${roles}">
										<label name="editRoleLabel" id="editRoleLabel_${role.id}" class="form-checkbox form-icon form-text"><input type="checkbox" id="editRole_${role.id}" name="roles" value="${role.id}"> ${role.roleName}</label>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
			<!--Modal footer-->
			<div class="modal-footer">
				<button class="btn btn-primary" onclick="editAdmin();">确定</button>
				<button data-dismiss="modal" class="btn btn-default" type="button">取消</button>
			</div>
		</div>
	</div>
</div>

<!-- 主体内容结束 -->
<script type="text/javascript"
	src="${ctx}/resource/js/app/admin/operator/operator.js"></script>