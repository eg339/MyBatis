var jsonReader={repeatitems: false}

var jqgrid={
  url:"loadUrl",
  mtype:"POST",
  altRows:true,		//设置表格 zebra-striped 值
  datatype: "json",
  hidegrid: true,		//启用或者禁用控制表格显示、隐藏的按钮，只有当caption 属性不为空时起效
  height:250,			//表格高度，可以是数字，像素值或者百分比
  hiddengrid:false,		//当为ture时，表格不会被显示，只显示表格的标题。只有当点击显示表格的那个按钮时才会去初始化表格数据。只有当caption 属性不为空而且hidegrid为ture时才起作用
  hoverrows:false,		//当为false时mouse hovering会被禁用
  autoencode:false,		//当为 ture 时对url进行编码
  jsonReader:jsonReader,
  colNames:[],
  colModel:[],
  rowNum:10,
  rowList:[10,20,30,100],
  pager: "#pager9",
  pagerpos:"center",	//指定分页栏的位置
  pgbuttons:true,		//是否显示翻页按钮
  pginput:true,			//是否显示跳转页面的输入框
  sortname: "id",  
  viewrecords: true,	//是否要显示总记录数
  recordpos:"right",	//定义了记录信息的位置： left, center, right
  sortorder: "desc",
  cellEdit:false,		//启用或者禁用单元格编辑功能
  cellsubmit:"remote",	//定义了单元格内容保存位置：“remote”，“clientArray”
  cellurl:"",			//单元格提交的url
  editurl:"",			//定义对form编辑时的url
//  width:750,
  hiddengrid:false,		//当为ture时，表格不会被显示，只显示表格的标题。只有当点击显示表格的那个按钮时才会去初始化表格数据。只有当caption 属性不为空而且hidegrid为ture时才起作用
  shrinkToFit:false,	//此属性用来说明当初始化列宽度时候的计算类型，如果为ture，则按比例初始化列宽度。如果为false，则列宽度使用colModel指定的宽度
  gridview:true,		//构造一行数据后添加到grid中，如果设为true则是将整个表格的数据都构造完成后再添加到grid中，但treeGrid, subGrid, or afterInsertRow 不能用
  autowidth:true,		//如果为ture时，则当表格在首次被创建时会根据父元素比例重新调整表格宽度。如果父元素宽度改变，为了使表格宽度能够自动调整则需要实现函数：setGridWidth
  multiselect: false,	//定义是否可以多选
  multiselectWidth:20,	//当multiselect为true时设置multiselect列宽度
  rownumbers:false,		//如果为ture则会在表格左边新增一列，显示行顺序号，从1开始递增。此列名为'rn'
  caption: "title",
  gridComplete:null			//当表格所有数据都加载完成而且其他的处理也都完成时触发此事件，排序，翻页同样也会触发此事件
}

//格式化金额
function currencyFmatter (cellvalue, options, rowObject) {   
//  return "$"+cellvalue+"元";
  return parseFloat(cellvalue).toFixed(2);   
} 

function perror(XMLHttpRequest, textStatus, errorThrown){
	var ctx = $("#ctx").val();
	if (textStatus=="parsererror"){
		//未登录时
		window.location.href=ctx + "/login/loginOut.jhtml";
		
	}else{
		//服务器无响应或系统错误    textStatus="error"
		window.location.href="500.html"
	}	
}
function preProcessData(data){
	var c = Div( data.total ,data.rp);
	var b = data.total % data.rp;
	if (b>0){
		c = c+1;
	}
	if (data.page >c){
		data.page=1;
	} 
	return data;
}



//整除
function Div(exp1, exp2)
{
	var n1 = Math.round(exp1); //四舍五入
	var n2 = Math.round(exp2); //四舍五入
	var rslt = n1 / n2; //除

	if (rslt >= 0)
	{
	    rslt = Math.floor(rslt); //返回值为小于等于其数值参数的最大整数值。
	}
	else
	{
	    rslt = Math.ceil(rslt); //返回值为大于等于其数字参数的最小整数。
	}
	return rslt;
}
//验证翻页输入框
/*$(function(){
	$(".ui-pg-input")[0].onkeydown = function(event_e){  
        if( window.event )  
         event_e = window.event;  
         var int_keycode = event_e.charCode||event_e.keyCode;  
         if(int_keycode ==13){ 
          return checkInput();
   }
   }  
})*/
function checkInput(){
	var _inputPage=$(".ui-pg-input").val();
	var _cPage=$("#sp_1_cpage").text();
	var _intege=/^[0-9]*[1-9][0-9]*$/   //正整数 
	//alert(typeof(_inputPage));
	//alert(_inputPage);
	//alert(_cPage);
	if(!_intege.test(_inputPage)){
	alert("请输入正整数");
	return false;
		
	}else if(parseInt(_inputPage)>parseInt(_cPage)){
	alert("请输入小于等于最大页数的整数");
	return false;
	}
	
}