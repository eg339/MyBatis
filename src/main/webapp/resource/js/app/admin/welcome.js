$(function(){
	$("#yesterdaySpan").html(GetDateStr(-1));
	showCharts('online');
})

function showCharts(type){
	$('#echarts_online_div').addClass('hidden');
	$('#echarts_pv_div').addClass('hidden');
	
	require([ 'echarts', 'echarts/chart/line', ], function echarts(ec) {
		if(type == 'online')
			showChartsOnline(ec);
		else if(type == 'pv')
			showChartsPV(ec);
	});
}

function showChartsOnline(ec) {
	$('#echarts_online_div').removeClass('hidden');
	
	var param = {
			"type" : "20",
			"statisCount" : 48
	};
	var xAxis,yAxis;
	$.ajax({
		type : "post",
		url : "getReportDataByType.htm",
		data : param,
		datatype : "json",
		async : false,
		success : function(data) {
			xAxis = data.xAxisData;
			yAxis = data.yAxisData[0];
		},
		error : function() {
			Modal.alert({msg:"报表数据加载失败"});
		}
	});
	
	// --- 折柱 ---
	var myChart = ec.init(document.getElementById('echarts_online'));
	myChart.setOption({
		tooltip : {
			trigger : 'axis'
		},
		toolbox : {
			show : false,
			feature : {
				mark : {
					show : true
				},
				dataView : {
					show : true,
					readOnly : false
				},
				magicType : {
					show : true,
					type : [ 'line', 'bar', 'stack', 'tiled' ]
				},
				restore : {
					show : true
				},
				saveAsImage : {
					show : true
				}
			}
		},
		calculable : true,
		xAxis : [ {
			type : 'category',
			boundaryGap : false,
			data : xAxis
		} ],
		yAxis : [ {
			type : 'value'
		} ],
		color : [ '#f90' ],
		series : [ {
			name : '在线人数',
			type : 'line',
			smooth : false,
			itemStyle : {
				normal : {
					areaStyle : {
						type : 'default'
					}
				}
			},
			data : yAxis
		} ]
	});
};

var pvStatisCount = 7;
function showChartsPV(ec) {
	$('#echarts_pv_div').removeClass('hidden');
	
	var param = {
			"type" : "21",
			"statisCount" : pvStatisCount
	};
	var xAxis,yAxis;
	$.ajax({
		type : "post",
		url : "getReportDataByType.htm",
		data : param,
		datatype : "json",
		async : false,
		success : function(data) {
			xAxis = data.xAxisData;
			yAxis = data.yAxisData[0];
		},
		error : function() {
			Modal.alert({msg:"报表数据加载失败"});
		}
	});
    //--- 折柱 ---
    var myChart = ec.init(document.getElementById('echarts_pv'));
    myChart.setOption({
        tooltip : {
            trigger: 'axis'
        },
        toolbox: {
            show : false,
            feature : {
                mark : {show: true},
                dataView : {show: true, readOnly: false},
                magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                restore : {show: true},
                saveAsImage : {show: true}
            }
        },
        calculable : true,
        xAxis : [
            {
                type : 'category',
                boundaryGap : false,
                data : xAxis
            }
        ],
        yAxis : [
            {
                type : 'value'
            }
        ],
        color: [ 
            '#0ac5f8'
        ],
        series : [
            {
                name:'PV',
                type:'line',
                smooth:false,
                itemStyle: {normal: {areaStyle: {type: 'default'}}},
                data:yAxis
            }
        ]
    });
};

// 修改PV显示时间维度; 1-最近一周; 2-最近一月
function changePVRange(type){
	if("1"==type)
		pvStatisCount = 7;
	else if("2"==type)
		pvStatisCount = 30;
	showCharts("pv");
}