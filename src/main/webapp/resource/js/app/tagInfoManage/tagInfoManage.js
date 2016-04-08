/**
 * 标签管理
 */
$.ajaxSetup({
	cache : false
});

$(function() {
	loadBusinessDistricts();
	/* 标签列表 */
	$('#tagInfoTable').bootstrapTable({
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
		columns : [ {
			field : 'seqNum',
			title : '序号'
		}, {
			field : 'name',
			title : '标签名称'
		}, {
			field : 'ageRangesVal',
			title : '标签年龄范围'
		}, {
			field : 'businessDistricts',
			title : '活跃商圈范围'
		}, {
			field : 'phonePlanRangesVal',
			title : '标签套餐范围'
		}, {
			field : 'genderRangesVal',
			title : '标签性别范围'
		}, {
			field : 'meTypeRangesVal',
			title : '标签终端类型范围'
		}, {
			field : 'createTime',
			title : '创建时间'
		}, {
			field : 'lastUpdTime',
			title : '最后更新时间'
		}, {
			title : '操作',
			formatter : operateFormatter
		} ]
	});

	// $("input[name=ageRange]").change(function(){
	// $("#ageRanges").val($('input[name=ageRange]:checked').map(function(){
	// return this.value
	// }).get().join(','));
	// });
});

function queryParams(params) {
	return {
		rows : params.limit,
		page : params.offset / params.limit + 1,
		name : $('#qName').val(),
	};
}

/**
 * 标签列表操作
 */
function operateFormatter(value, row, index) {
	var editDef = "&nbsp;&nbsp;<button class=\"btn btn-primary btn-xs\" onclick=\"javascript:openEditTagInfo('"
			+ row['id'] + "')\">编辑</button>";
	var deleteDef = "&nbsp;&nbsp;<button class=\"btn btn-primary btn-xs\" onclick=\"javascript:deleteTagInfo('"
			+ row['id'] + "')\">删除</button>";
	return editDef + deleteDef;
}

/**
 * 打开添加标签弹出框
 */
function openAddTagDialog() {
	$("#addTagInfoForm")[0].reset();
	$("#addTagInfoDialog").modal('show');
}
/**
 * 加载商圈回填下拉选择框
 */
function loadBusinessDistricts() {
	$("#addBusinessDistricts").empty();
	$("#addBusinessDistricts").append("<option value='请选择'>请选择</option>");
	$("#editBusinessDistricts").empty();
	$("#editBusinessDistricts").append("<option value='请选择'>请选择</option>");
	$.ajax({
		type : "post",
		datatype : "json",
		url : "loadBusinessDistricts.htm",
		success : function(data) {
			$.each(data, function(i, item) {
				var option = "<option value=\'" + item.id + "\'>" + item.name
						+ "</option>";
				$("#addBusinessDistricts").append(option);
				$("#editBusinessDistricts").append(option);
			});
			$("#addBusinessDistricts").selectpicker('refresh');
			$("#editBusinessDistricts").selectpicker('refresh');
		},
		errro : function() {
			$.alert("服务器没有返回数据，可能服务器忙，请重试");
		}
	});
}

/**
 * 添加标签
 */
function addTagInfo() {
	$("#addTagInfoForm").ajaxSubmit({
		data : 'json',
		type : 'post',
		success : function(json) {
			if (json.status == "succ") {
				Modal.alert({
					msg : "操作成功"
				});
				$("#addTagInfoForm")[0].reset();
				$("#addTagInfoDialog").modal('hide');
			} else {
				Modal.alert({
					msg : "操作失败"
				});
			}
			doQuery();
		},
		error : function() {
			Modal.alert({
				msg : "服务器没有返回数据，可能服务器忙，请重试"
			});
		}
	});
}

/**
 * 打开编辑标签弹出框
 */
function openEditTagInfo(id) {
//	$("#editTagInfoForm")[0].reset();
	var url = "getTagInfo.htm";
	var params = {
		'id' : id
	};
	$.ajax({
		type : "post",
		url : url,
		data : params,
		datatype : "json",
		success : function(data) {
			$("#editID").val(data.id);
			$("#editName").val(data.name);
			setEditBusinessDistricts(data.businessDistricts);
			/* 设置复选框回填 */
			setEditAgeRanges(data.ageRangesCode);
			setEditGenderRanges(data.genderRangesCode);
			setEditPhonePlanRanges(data.phonePlanRangesCode);
			setEditMeTypeRanges(data.meTypeRangesCode);
			$("#editBusinessDistricts").selectpicker('refresh');
			$("#editDescription").val(data.description);

			$("#editTagInfoDialog").modal('show');
		},
		error : function() {
			Modal.alert({
				msg : "服务器没有返回数据，可能服务器忙，请重试"
			});
		}
	});
}
/* 设置商圈选择项 */
function setEditBusinessDistricts(businessDistricts) {
	for (var i = 0; i < $("#editBusinessDistricts").get(0).length; i++) {
		if (businessDistricts.indexOf($("#editBusinessDistricts option:eq("+i+")").val()) != -1)
			$("#editBusinessDistricts option:eq("+i+")").prop("selected",true);
		else
			$("#editBusinessDistricts option:eq("+i+")").prop("selected",false);
			
	}
}

/* 设置编辑年龄范围勾选项 */
function setEditAgeRanges(ageRangesCode) {
	var ageInputs = $("#editTagInfoDialog").find("input[name='ageRanges']");
	for (var i = 0; i < ageInputs.length; i++) {
		if (ageRangesCode.indexOf(ageInputs[i].value) != -1) {
			$(ageInputs[i]).prop("checked",true);
			$(ageInputs[i]).parent().addClass("active");
		}else{
			$(ageInputs[i]).prop("checked",false);
			$(ageInputs[i]).parent().removeClass("active");
		}
	}
}
/* 设置性别范围勾选项 */
function setEditGenderRanges(genderRangesCode) {
	var genderInputs = $("#editTagInfoDialog").find(
			"input[name='genderRanges']");
	for (var i = 0; i < genderInputs.length; i++) {
		if (genderRangesCode.indexOf(genderInputs[i].value) != -1) {
			$(genderInputs[i]).prop("checked",true);
			$(genderInputs[i]).parent().addClass("active");
		}else{
			$(genderInputs[i]).prop("checked",false);
			$(genderInputs[i]).parent().removeClass("active");
		}
	}
}
/* 设置套餐档位勾选项 */
function setEditPhonePlanRanges(phonePlanRangesCode) {
	var phonePlanRangesInputs = $("#editTagInfoDialog").find(
			"input[name='phonePlanRanges']");
	for (var i = 0; i < phonePlanRangesInputs.length; i++) {
		if (phonePlanRangesCode.indexOf(phonePlanRangesInputs[i].value) != -1) {
			$(phonePlanRangesInputs[i]).prop("checked",true);
			$(phonePlanRangesInputs[i]).parent().addClass("active");
		}else{
			$(phonePlanRangesInputs[i]).prop("checked",false);
			$(phonePlanRangesInputs[i]).parent().removeClass("active");
		}
	}
}

/* 设置终端类型勾选项 */
function setEditMeTypeRanges(meTypeRangesCode) {
	var meTypeRangesInputs = $("#editTagInfoDialog").find(
			"input[name='meTypeRanges']");
	for (var i = 0; i < meTypeRangesInputs.length; i++) {
		if (meTypeRangesCode.indexOf(meTypeRangesInputs[i].value) != -1) {
			$(meTypeRangesInputs[i]).prop("checked",true);
			$(meTypeRangesInputs[i]).parent().addClass("active");
		}else{
			$(meTypeRangesInputs[i]).prop("checked",false);
			$(meTypeRangesInputs[i]).parent().removeClass("active");
		}
	}
}

/**
 * 编辑标签信息
 */
function editTagInfo() {
	$("#editTagInfoForm").ajaxSubmit({
		data : 'json',
		type : 'post',
		success : function(json) {
			if (json.status == "succ") {
				Modal.alert({
					msg : "操作成功"
				});
				$("#editTagInfoForm")[0].reset();
				$("#editTagInfoDialog").modal('hide');
			} else {
				Modal.alert({
					msg : "操作失败"
				});
			}
			doQuery();
		},
		error : function() {
			Modal.alert({
				msg : "服务器没有返回数据，可能服务器忙，请重试"
			});
		}
	});
}
/**
 * 删除标签
 */
function deleteTagInfo(id) {
	Modal.confirm({
		msg : "确认要删除选中的数据吗?"
	}).on(function(e) {
		if (!e)
			return;
		var url = "delete.htm"
		var param = {

			"id" : id
		};
		$.ajax({
			type : "post",
			url : url,
			data : param,
			datatype : "json",
			success : function(data) {
				if (data.status == "succ")
					Modal.alert({
						msg : "删除成功"
					});
				else
					Modal.alert({
						msg : "删除失败"
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

/**
 * 推送应用查询
 */
function doQuery() {
	$('#tagInfoTable').bootstrapTable("getOptions").pageNumber = 1;
	$('#tagInfoTable').bootstrapTable('refresh');
}
