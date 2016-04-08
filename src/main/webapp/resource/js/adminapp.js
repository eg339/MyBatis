//<![CDATA[
$(function(){
	var html="<div id='buttonTool'>";
		html+="<button type='button' class='btn-2-active'>退出全屏</button><button type='button' class='btn-3' onclick='javascript:window.location.href=\""+contextPath+"/login/loginOut.jhtml\"'>退出</button>";
		html+="</div>";
	$(".main .content").prepend(html);
	var _height=$(window).height()-157;
	$(".sideMenu").css("height",_height);
	$(window).resize(function(){
		_height=$(window).height()-157;
		//alert(height);
		$(".sideMenu").css("height",_height);
	});

//左侧菜单
  $(".nav-top-item").bind("click",function(){
	$(this).parent().siblings().find(".subMenu").hide();
	$(this).next().toggle();
	$(this).parent().siblings().find(".nav-top-item").removeClass("cur");
	$(this).toggleClass("cur");
  });
  $(".current").parents(".subMenu").show();
//  $(".current").parents(".nav-top-item").addClass("cur");
  $(".current").parents(".subMenu").prev(".nav-top-item").addClass("cur");

//点击全屏
 $(".btn-2").bind("click",function(){
	$(".header,.systemMsg,.sideMenu,.footer").hide();
	$("#buttonTool").show();
	$(".main .content").css("margin-left","0");
 });
 $(".btn-2-active").bind("click",function(){
	$(".main .content").css("margin-left","158px");
	$(".header,.systemMsg,.sideMenu,.footer").show();
	$("#buttonTool").hide();
 });

//开卡申请
//$(".open-open").bind("click",function(){
//	$(this).parents(".table").children("tbody").show();
//	$(this).parents(".table").siblings(".table").children("tbody").hide();
//	$(this).parents(".table").siblings(".table").find(".close-close").hide();
//	$(this).parents(".table").siblings(".table").find(".open-open").show();
//	$(this).hide();
//	$(this).siblings(".close-close").show();
//	//$(this).parents(".table").siblings(".table").last().children("tbody").show();
//});
//$(".close-close").bind("click",function(){
//	$(this).parents(".table").children("tbody").hide();
//	$(this).hide();
//	$(this).siblings(".open-open").show();
//	//$(this).parents(".table").siblings(".table").last().children("tbody").show();
//});

//基本信息填写
//$("#step_1").bind("click",function(){
//	$(".writeMsg-2").hide();
//	$(".writeMsg-1").show();
//});
//$("#step_2").bind("click",function(){
//	$(".writeMsg-1").hide();
//	$(".writeMsg-2").show();
//});
//$("#step_3").bind("click",function(){
//	$(".writeMsg-2").hide();
//	$(".writeMsg-3").show();
//});

});



	/*for input file skin, created by Quan*/
	$(function(){
		if($(".fileField").length>0){
			$(".fileField").each(function(){			
								
					(function(fileInput){
					
						var fileFieldURLInput = $(document.createElement("input"));
						fileFieldURLInput.attr("type","text");
						fileFieldURLInput.attr("readonly","readonly");
						fileFieldURLInput.addClass("fileField_url");
						var	fileFieldBtn=$("<button class='btn-8' onclick='return false;'>浏览本地文件夹</button>"),
//							loader=$("<img class='fileLoader' src='../resource/images/loading.gif'></img>")
//									.css({"position":"relative","left":"35px","visibility":"hidden"}),
//							loader=$("<img></img>")
//									.css({"position":"relative","left":"35px","visibility":"hidden"}),		
							clickHandler=function(){
								fileInput.click();
							};
						if(window.ActiveXObject){
							fileFieldBtn.css("min-width","60px");
							fileFieldBtn.html("浏览...");
							fileInput.css({
							cursor:"pointer",
							position:"relative",
							top:"-32px",
							left:"10px",
							filter:"Alpha(opacity=00)",
							opacity:"0.0",
							height:"30px",
							width:"68%"
							});
							if(parseInt($.browser.version)<=8){
								fileFieldURLInput.css({"padding-top":"10px",height:"20px"});
								fileInput.css({"padding-top":"5px",height:"30px","font-size":"14px"});

							}
//							if(parseInt($.browser.version)<8){
//								fileFieldURLInput.click(function(){
//									this.blur();
//								});
//							}

						}
			
						fileInput.change(function() {
							fileFieldURLInput.val($(this).val());
						});
//						fileFieldURLInput).before(fileFieldBtn);	
						fileInput.before(fileFieldURLInput).before(fileFieldBtn);
						fileFieldURLInput.click(clickHandler);
						fileFieldBtn.click(clickHandler);
						fileInput.change(function(){$(this).focus();fileFieldBtn.focus();});
					})($(this));			
			});
		}
			
		$.fn.extend({
			startLoad:function(){
				this.siblings(".fileLoader").css("visibility","visible");
			},
			loadComplete:function(){
				this.siblings(".fileLoader").css("visibility","hidden");;			
			}
		});
			
	});


	
	/*
	$(function(){
				$(".fileField").startLoad();
				$(".fileField").loadComplete();
		});
	*/
	
	
	/*for menu location, created by Quan*/
	$(function() {
		var locationHref = window.location.href, isLocated, checkNode = function(
				isRouter) {
			/*match with links selection*/
			$(".sideMenu").find("a").each(function() {
				var _urlStr = $(this).attr("href");
				if (isRouter)
					_urlStr = _urlStr.substr(0, _urlStr.lastIndexOf("/") + 1);
	
				if (locationHref.indexOf(_urlStr) > 0 && _urlStr != "#" && $(".on").length==0) {
					$(this).parent().addClass("on");
					isLocated = true;
					var _parentItem = $(this);
					while (_parentItem.attr("class") != "subMenu") {
						_parentItem = _parentItem.parent();
						if (_parentItem.hasClass("subMenu")) {
							_parentItem.siblings().trigger("click");
							return false;
						}
					}
					return false;
				}
			});
		};
	
		if (!isLocated)
			checkNode(false);
		if (!isLocated)
			checkNode(true);
	});
//]]>