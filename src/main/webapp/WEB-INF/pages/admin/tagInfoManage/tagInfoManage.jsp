<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!-- 主体内容 -->
<div id="content-container">
	<div id="page-title">
		<h1 class="page-header text-overflow">用户标签管理</h1>
	</div>
	<ol class="breadcrumb">
		<li><a href="#">首页</a></li>
		<li><a href="#">用户管理</a></li>
		<!-- <li><a href="#">平台用户管理</a></li>-->
		<li class="active">用户标签管理</li>
	</ol>
	<div id="page-content" class="col-xs-12 cy-data-form-content">
		<div class="panel cy-index-panel">
			<div class="panel-heading">
				<div class="panel-control">
					<button class="btn btn-default collapsed" data-target="#businessFunctionPanel" data-toggle="collapse" aria-expanded="false">
						<i class="fa fa-chevron-down"></i>
					</button>
				</div>
				<h3 class="panel-title">功能区</h3>
			</div>
			<div id="businessFunctionPanel" class="collapse in"
				aria-expanded="false">
				<div class="panel-body">
					<div class="row">
						<div class="col-md-6 col-lg-2">
							<div class="panel panel-danger panel-colorful" onclick="javascript:openAddTagDialog();" data-toggle="modal">
								<div class="panel-body text-center">
									<p class="text-uppercase mar-btm text-sm cy-cursor-point">创建标签</p>
									<i class="iconfont icon-tianjiadianhuaqia fa-5x"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="panel">
			<div class="panel-heading">
				<div class="panel-control">
					<button class="btn btn-default collapsed" data-target="#demo-panel-collapse-default2" data-toggle="collapse" aria-expanded="false">
						<i class="fa fa-chevron-down"></i>
					</button>
				</div>
			</div>
			<div id="demo-panel-collapse-default2" class="collapse in" aria-expanded="false">
				<div class="panel-body">
					<div class="bord-all">
						<div class="row cy-pad-btm-s">
							<div class="col-md-11">
								<div class="form-inline">
									<div class="form-group cy-mar-ver-s">
										<span class="cy-pad-hor-s">标签名称</span> 
										<input type="text" placeholder="" id="qName" name="name" class="form-control">
									</div>
								</div>
							</div>
							<div class="col-md-1 cy-text-right-md">
								<div class="form-inline">
									<div class="form-group cy-mar-ver-s">
										<button class="btn btn-primary cy-pad-rgt-s" onclick="doQuery();">查询</button>
									</div>
									<div class="form-group cy-mar-ver-s">
										<button class="btn btn-primary cy-pad-rgt-s" onclick="openAddAdmin();">重置</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="table-responsive">
						<table id="tagInfoTable">
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div id="addTagInfoDialog" class="modal fade" tabindex="-1" data-backdrop="static">
	<div class="modal-dialog modal-lg cy-modal-dialog-f">
		<div class="modal-content">
			<div class="modal-header">
				<button class="close" data-dismiss="modal">
					<span>&times;</span>
				</button>
				<h4 class="modal-title" id="myLargeModalLabel">创建标签信息</h4>
			</div>
			<div class="modal-body">
				<div class="row">
					<form id="addTagInfoForm" class="form-horizontal" role="form" action="${ctx }/admin/tagInfoManage/add.htm" method="post">
						<div class="col-sm-12">
							<div class="form-group">
								<div class="form-inline">
									<span class="text-danger">*</span>
									<label class="form-label text-bold" for="">标签名称</label> 
									<input id="addName" class="form-control" placeholder="" type="text" name="name"/>
								</div>
							</div>
						</div>
						<div class="col-sm-12">
							<div class="form-group">
								<div class="form-inline">
									<span class="text-danger">*</span>
									<label class="form-label text-bold" for="">活跃商圈</label> 
									<select id="addBusinessDistricts" name="businessDistricts" multiple="multiple" class="selectpicker" >
									</select>
								</div>
							</div>
						</div>
						<div class="col-sm-12">
							<div class="form-group">
								<div class="form-inline">
									<label class="form-label text-bold col-md-3" for="">年龄</label> 
									<div class="checkbox col-md-9">
										<label class="form-checkbox form-icon form-text"><input name="ageRanges" value="01" type="checkbox"> 5-10</label>
										<label class="form-checkbox form-icon form-text"><input name="ageRanges" value="02" type="checkbox"> 10-20</label>
										<label class="form-checkbox form-icon form-text"><input name="ageRanges" value="03" type="checkbox"> 20-30</label>
										<label class="form-checkbox form-icon form-text"><input name="ageRanges" value="04" type="checkbox"> 30-40</label>
										<label class="form-checkbox form-icon form-text"><input name="ageRanges" value="05" type="checkbox"> 40-50</label>
										<label class="form-checkbox form-icon form-text"><input name="ageRanges" value="06" type="checkbox"> 50以上</label>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-12">
							<div class="form-group">
								<div class="form-inline">
									<label class="form-label text-bold col-md-3" for="">性别</label> 
									<div class="checkbox col-md-9">
										<label class="form-checkbox form-icon form-text"><input name="genderRanges" value="00" type="checkbox"> 男</label>
										<label class="form-checkbox form-icon form-text"><input name="genderRanges" value="01" type="checkbox"> 女</label>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-12">
							<div class="form-group">
								<div class="form-inline">
									<label class="col-md-3 form-label text-bold" for="">套餐档位</label> 
									<div class="checkbox col-md-9">
										<label class="form-checkbox form-icon form-text"><input name="phonePlanRanges" value="01" type="checkbox" > 46-66</label>
										<label class="form-checkbox form-icon form-text"><input name="phonePlanRanges" value="02" type="checkbox"> 96-156</label>
										<label class="form-checkbox form-icon form-text"><input name="phonePlanRanges" value="03" type="checkbox"> 186-256</label>
										<label class="form-checkbox form-icon form-text"><input name="phonePlanRanges" value="04" type="checkbox"> 286以上</label>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-12">
							<div class="form-group">
								<div class="form-inline">
									<label class="form-label text-bold col-md-3" for="">终端类型</label> 
									<div class="checkbox col-md-9">
										<label class="form-checkbox form-icon form-text"><input name="meTypeRanges" value="00" type="checkbox"> 特殊终端</label>
										<label class="form-checkbox form-icon form-text"><input name="meTypeRanges" value="01" type="checkbox"> 普通终端</label>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-12">
							<div class="form-group">
								<label class="col-md-1 control-label" for="testDescTextarea">标签描述</label>
								<div class="col-md-11">
									<textarea id="addDescription" name="description" rows="9" class="form-control" placeholder=""></textarea>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
			<!--Modal footer-->
			<div class="modal-footer">
				<button class="btn btn-primary" onclick="addTagInfo();">确定</button>
				<button data-dismiss="modal" class="btn btn-default" type="button">取消</button>
			</div>
		</div>
	</div>
</div>

<!-- 编辑标签信息 -->
<div id="editTagInfoDialog" class="modal fade" tabindex="-1" data-backdrop="static">
	<div class="modal-dialog modal-lg cy-modal-dialog-f">
		<div class="modal-content">
			<div class="modal-header">
				<button class="close" data-dismiss="modal">
					<span>&times;</span>
				</button>
				<h4 class="modal-title" id="myLargeModalLabel">编辑标签信息</h4>
			</div>
			<div class="modal-body">
				<div class="row">
					<form id="editTagInfoForm" class="form-horizontal" role="form" action="${ctx }/admin/tagInfoManage/edit.htm" method="post">
						<input id="editID" type="hidden" name="id"/>
						<div class="col-sm-12">
							<div class="form-group">
								<div class="form-inline">
									<span class="text-danger">*</span>
									<label class="form-label text-bold" for="">标签名称</label> 
									<input id="editName" class="form-control" placeholder="" type="text" name="name"/>
								</div>
							</div>
						</div>
						<div class="col-sm-12">
							<div class="form-group">
								<div class="form-inline">
									<span class="text-danger">*</span>
									<label class="form-label text-bold" for="">活跃商圈</label> 
									<select id="editBusinessDistricts" name="businessDistricts" multiple="multiple" class="selectpicker" >
									</select>
								</div>
							</div>
						</div>
						<div class="col-sm-12">
							<div class="form-group">
								<div class="form-inline">
									<label class="form-label text-bold col-md-3" for="">年龄</label> 
									<div class="checkbox col-md-9">
										<label class="form-checkbox form-icon form-text"><input name="ageRanges" value="01" type="checkbox"> 5-10</label>
										<label class="form-checkbox form-icon form-text"><input name="ageRanges" value="02" type="checkbox"> 10-20</label>
										<label class="form-checkbox form-icon form-text"><input name="ageRanges" value="03" type="checkbox"> 20-30</label>
										<label class="form-checkbox form-icon form-text"><input name="ageRanges" value="04" type="checkbox"> 30-40</label>
										<label class="form-checkbox form-icon form-text"><input name="ageRanges" value="05" type="checkbox"> 40-50</label>
										<label class="form-checkbox form-icon form-text"><input name="ageRanges" value="06" type="checkbox"> 50以上</label>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-12">
							<div class="form-group">
								<div class="form-inline">
									<label class="form-label text-bold col-md-3" for="">性别</label> 
									<div class="checkbox col-md-9">
										<label class="form-checkbox form-icon form-text"><input name="genderRanges" value="00" type="checkbox"> 男</label>
										<label class="form-checkbox form-icon form-text"><input name="genderRanges" value="01" type="checkbox"> 女</label>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-12">
							<div class="form-group">
								<div class="form-inline">
									<label class="col-md-3 form-label text-bold" for="">套餐档位</label> 
									<div class="checkbox col-md-9">
										<label class="form-checkbox form-icon form-text"><input name="phonePlanRanges" value="01" type="checkbox" > 46-66</label>
										<label class="form-checkbox form-icon form-text"><input name="phonePlanRanges" value="02" type="checkbox"> 96-156</label>
										<label class="form-checkbox form-icon form-text"><input name="phonePlanRanges" value="03" type="checkbox"> 186-256</label>
										<label class="form-checkbox form-icon form-text"><input name="phonePlanRanges" value="04" type="checkbox"> 286以上</label>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-12">
							<div class="form-group">
								<div class="form-inline">
									<label class="form-label text-bold col-md-3" for="">终端类型</label> 
									<div class="checkbox col-md-9">
										<label class="form-checkbox form-icon form-text"><input name="meTypeRanges" value="00" type="checkbox"> 普通终端</label>
										<label class="form-checkbox form-icon form-text"><input name="meTypeRanges" value="01" type="checkbox"> 特殊终端</label>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-12">
							<div class="form-group">
								<label class="col-md-1 control-label" for="testDescTextarea">标签描述</label>
								<div class="col-md-11">
									<textarea id="editDescription" name="description" rows="9" class="form-control" placeholder=""></textarea>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
			<!--Modal footer-->
			<div class="modal-footer">
				<button class="btn btn-primary" onclick="editTagInfo();">确定</button>
				<button data-dismiss="modal" class="btn btn-default" type="button">取消</button>
			</div>
		</div>
	</div>
</div>

<div id="editBusinessDistrictDialog" class="modal fade" tabindex="-1"
	data-backdrop="static">
	<div class="modal-dialog modal-lg cy-modal-dialog-f">
		<div class="modal-content">
			<div class="modal-header">
				<button class="close" data-dismiss="modal">
					<span>&times;</span>
				</button>
				<h4 class="modal-title" id="myLargeModalLabel">修改区域信息</h4>
			</div>
			<div class="modal-body">
				<form id="editBusinessDistrictForm" method="post"
					action="${ctx}/admin/business/edit.htm" class="form-horizontal">
					<input type="hidden" id="editID" name="id" />
					<div class="form-group cy-mar-ver-s">
						<div id="editProvCity" class="form-inline">
							<span class="cy-pad-hor-s">省份</span> 
							<select name="provinceCode" class="prov selectpicker" id="editProvinceCode" onchange="changeEditCenter('editProvinceCode')" >
								<option value="">--请选择省份--</option>
							</select>
							<input id="editProvinceName" name="provinceName" type="hidden"/>
							<span class="cy-pad-hor-s">城市</span> 
							<select name="cityCode" id="editCityCode" class="city selectpicker" onchange="changeEditCenter('editCityCode')">
								<option value="">--请选择城市--</option>
							</select>
							<input id="editCityName" name="cityName" type="hidden"/>
							<span class="cy-pad-hor-s">行政区</span> 
							<select name="districtCode" id="editDistrictCode" class="dist selectpicker" onchange="changeEditCenter('editDistrictCode')">
								<option value="">--请选择行政区--</option>
							</select>
							<input id="editDistrictName" name="districtName" type="hidden"/>
						</div>
					</div>
					<div>
						<div id="map-container"
							style="overflow: hidden; zoom: 1; position: relative;">
							<div class="baidu-map" id="editMap"
								style="height: 100%; -webkit-transition: all 0.5s ease-in-out; transition: all 0.5s ease-in-out;"></div>
							<input id="editPoints" type="hidden" name="polygonPoints"/>
						</div>
					</div>
					<div class="form-group cy-mar-ver-s">
						<div class="form-inline">
							<div class="col-md-6">
								<span class="cy-pad-hor-s">商圈名称</span> 
								<input class="form-control" placeholder="商圈名称" type="text" name="name" id="editName" />
							</div>
							<div class="col-md-6">
								<span class="cy-pad-hor-s">商圈类别</span> 
								<select class="selectpicker" name="businessType" id="editBusinessType">
									<option value="">--请选择商圈类别--</option>
									<option value="01">商业区--</option>
									<option value="02">住宅区</option>
									<option value="03">文教区</option>
									<option value="04">办公区</option>
									<option value="05">工业区</option>
								</select>
							</div>
						</div>
					</div>
				</form>
			</div>
			<!--Modal footer-->
			<div class="modal-footer">
				<button class="btn btn-primary" onclick="editBusinessDistrict();">确定</button>
				<button data-dismiss="modal" class="btn btn-default" type="button">取消</button>
			</div>
		</div>
	</div>
</div>

<!-- 主体内容结束 -->
<script type="text/javascript" src="${ctx}/resource/js/app/admin/tagInfoManage/tagInfoManage.js"></script>