$(function() {
	// 初始化综合搜索工具
	initSearchTool();
})

// 初始化综合搜索工具
function initSearchTool() {
	// 点击'设置'按钮时触发，其他选项隐藏，当前选项显示
	$(".set_tool").click(function() {
		var _select_val = $(".selectpicker").val();
		// $(".demo-panel-alert").hide();
		$("." + _select_val).fadeIn();
	});

	$('.btn-close').click(function() {
		$(this).parents('.demo-panel-alert').fadeOut();
	});

	// 初始化本地数据,模拟分页数据
	var jsonDatas = [];
	doSearch(jsonDatas);

	// 查询框回车事件监听
	$('#searchKeyword').keydown(function(e) {
		if (e.keyCode == 13) {
			var searchKeyword = $("#searchKeyword").val();
			var searchRange = $("#searchRange").val();
			if ("" == searchKeyword || "" == searchRange)
				return;
			// 执行查询
			var param = {
				"type" : searchRange,
				"src" : searchKeyword
			};
			$.ajax({
				type : "post",
				url : $("#ctx").val() + "/admin/toolkit/search.htm",
				data : param,
				datatype : "json",
				async : false,
				success : function(data) {
					doSearch(data);
				},
				error : function() {
					Modal.alert({
						msg : "报表数据加载失败"
					});
				}
			});
		}
	});
}

function searchKeyword() {
	var searchKeyword = $("#searchKeyword").val();
	var searchRange = $("#searchRange").val();
	if ("" == searchKeyword || "" == searchRange)
		return;
	// 执行查询
	var param = {
		"type" : searchRange,
		"src" : searchKeyword
	};
	$.ajax({
		type : "post",
		url : $("#ctx").val() + "/admin/toolkit/search.htm",
		data : param,
		datatype : "json",
		async : false,
		success : function(data) {
			doSearch(data);
		},
		error : function() {
			Modal.alert({
				msg : "报表数据加载失败"
			});
		}
	});
}

function doSearch(jsonDatas) {
	// 初始化默认数据显示
	if (jsonDatas.length >= 1) { // 如果存在数据，则默认显示第一组,否则标题与内容均为空
		$(".cy-tab-content .page_title").text(jsonDatas[0].title);
		$(".cy-tab-content .page_content").text(jsonDatas[0].content);
	} else {
		$(".cy-tab-content .page_title").text("");
		$(".cy-tab-content .page_content").text("");
	}

	// 初始化分页
	$('.pagination-right').jqPagination(
			{
				link_string : '/?page={page_number}',
				max_page : jsonDatas.length, // 最大页数
				// current_page:1, //默认当前页数
				page_string : '第{current_page}/{max_page}页',
				paged : function(page) { // 回调事件处理
					$(".cy-tab-content .page_title").text(
							jsonDatas[page - 1].title);
					$(".cy-tab-content .page_content").text(
							jsonDatas[page - 1].content);
				}
			});
}

// 编码转换工具
function encodingConversion() {
	var src = $("#encodingSrc").val();
	if ("" == src) {
		Modal.alert({
			msg : "请输入源数据"
		});
		return;
	}
	var type = $("#conversionType").val();
	if ("" == type) {
		Modal.alert({
			msg : "请选择转换规则"
		});
		return;
	}

	$("#encodingResult").val("");

	var param = {
		"type" : type,
		"src" : src
	};

	$.ajax({
		type : "post",
		url : $("#ctx").val() + "/admin/toolkit/encodingConversion.htm",
		data : param,
		datatype : "json",
		async : false,
		success : function(data) {
			$("#encodingResult").val(data.msg);
		},
		error : function() {
			Modal.alert({
				msg : "报表数据加载失败"
			});
		}
	});
}