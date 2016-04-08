       //TODO add xg 2015年11月9日 20:50:54 start

		// 点击'设置'按钮时触发，其他选项隐藏，当前选项显示
		$(".set_tool").click(function(){
			var _select_val = $(".selectpicker").val();
			// $(".demo-panel-alert").hide();
			$("."+_select_val).fadeIn();
		});

		$('.btn-close').click(function(){
			$(this).parents('.demo-panel-alert').fadeOut();
		});

		//初始化本地数据,模拟分页数据
		var jsonDatas= [
			        {title:"这里是标题1",content:"这里是内容1"},
			        {title:"这里是标题2",content:"这里是内容2"},
					{title:"这里是标题3",content:"这里是内容3"},
					{title:"这里是标题4",content:"这里是内容4"},
					{title:"这里是标题5",content:"这里是内容5"},
					{title:"这里是标题6",content:"这里是内容6"},
					{title:"这里是标题7",content:"这里是内容7"},
					{title:"这里是标题8",content:"这里是内容8"},
					{title:"这里是标题9",content:"这里是内容9"},
					{title:"这里是标题10",content:"这里是内容10"},
					{title:"这里是标题11",content:"这里是内容11"}
		      ];

		//初始化默认数据显示
		if(jsonDatas.length >=1){ //如果存在数据，则默认显示第一组,否则标题与内容均为空
			$(".cy-tab-content .page_title").text(jsonDatas[0].title);
			$(".cy-tab-content .page_content").text(jsonDatas[0].content);
		}else{
			$(".cy-tab-content .page_title").text("");
			$(".cy-tab-content .page_content").text("");
		}

		//初始化分页
			$('.pagination-right').jqPagination({
				link_string: '/?page={page_number}',
				max_page	: jsonDatas.length,  //最大页数
//				current_page:1,                    //默认当前页数
				page_string:'第{current_page}/{max_page}页',
				paged		: function(page) {    //回调事件处理
						$(".cy-tab-content .page_title").text(jsonDatas[page-1].title);
						$(".cy-tab-content .page_content").text(jsonDatas[page-1].content);
				}
			});
		//TODO add xg 2015年11月9日 20:50:54 end