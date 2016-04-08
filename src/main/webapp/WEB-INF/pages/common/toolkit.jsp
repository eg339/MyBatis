<%@ page language="java" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/common/taglibs.jsp"%>
<input type="hidden" name="ctx" id="ctx" value="${ctx}">
<!-- 右侧功能区 -->
<aside id="aside-container" class="cy-index-container">
	<div id="aside">
		<div class="nano">
			<div class="nano-content">
				<!-- 右侧功能区内容 -->
				<div class="tab-content">
					<div class="tab-pane fade in active cy-index-tab1" id="demo-asd-tab-1">
						<!-- 小工具选择 -->
						<select class="selectpicker" style="display: none;">
							<option value="tool_zhss">综合搜索工具</option>
							<option value="tool_bmzh">编码转换工具</option>
							<option value="tool_wtfk">问题反馈工具</option>
						</select>
						<button class="btn btn-info set_tool">启用</button>

						<!-- TODO
						这里的ID不建议都使用demo-panel-alert,ID是用来标识唯一DOM元素时使用，如同人的身份证号，而class属性则相当于人的姓名或职位 ,
						这里的ID我已分别修改为demo-panel-alert1，demo-panel-alert2，demo-panel-alert3
						如有影响请做相应处理
						 -->
						<div id="demo-panel-alert1" class="demo-panel-alert panel tool_zhss">
							<!-- 小工具头部 -->
							<div class="panel-heading">
								<div class="panel-control">
									<button data-toggle="collapse" data-target="#demo-panel-collapse_1" class="btn btn-default" aria-expanded="true"><i class="fa fa-chevron-down"></i></button>
									<button class="btn btn-default btn-close"><i class="fa fa-times"></i></button>
								</div>
								<h3 class="panel-title">综合搜索工具</h3>
							</div>
							<!-- End -->
							<div id="demo-panel-collapse_1" class="collapse in" aria-expanded="true">
								<!-- 小工具内容 -->
								<div class="panel-body cy-nopadding-top">
									<div class="cy-pad-ver-s" >
										<div>
											<select class="cy-tab-select" style="width: 100px" id="searchRange">
												<option selected="selected" value="">查询范围</option>
												<option value="1">状态字(SW)</option>
<!-- 												<option value="">技术规范(TS)</option> -->
<!-- 												<option value="">开发接口(API)</option> -->
											</select>
											<input type="button" value="查询" class="btn btn-success btn-xs" onclick="javascript:searchKeyword();"/>
										</div>
										<input type="text" class="form-control cy-tab-textarea" id="searchKeyword" placeholder="请输入查询内容">
									</div>
									<div class="cy-tab-content">
										<h4><a href="#1" class="page_title">搜索结果</a></h4>
										<hr>
										<p class="page_content"></p>
									</div>
									<!-- 定义分页栏工具 add xg -->
									<div class="gigantic pagination-right">
										<a href="#" class="first" data-action="first" title="首页">&laquo;</a>
										<a href="#" class="previous" data-action="previous" title="上一页">&lsaquo;</a>
										<input type="text" readonly="readonly" />
										<a href="#" class="next" data-action="next" title="下一页">&rsaquo;</a>
										<a href="#" class="last" data-action="last" title="末页">&raquo;</a>
									</div>
								</div>
								<!-- End -->
							</div>
						</div>
						<div id="demo-panel-alert2" class="demo-panel-alert panel tool_bmzh">
							<!-- 小工具头部 -->
							<div class="panel-heading">
								<div class="panel-control">
									<button data-toggle="collapse" data-target="#demo-panel-collapse_2" class="btn btn-default" aria-expanded="true"><i class="fa fa-chevron-down"></i></button>
									<button class="btn btn-default btn-close"><i class="fa fa-times"></i></button>
								</div>
								<h3 class="panel-title">编码转换工具</h3>
							</div>
							<!-- End -->
							<div id="demo-panel-collapse_2" class="collapse in" aria-expanded="true">
								<!-- 小工具内容 -->
								<div class="panel-body cy-nopadding-top">
									<textarea class="cy-tab-textarea form-control" rows="4" placeholder="源数据" id="encodingSrc"></textarea>
									<div class="cy-pad-ver-s">
										<select class="cy-tab-select-f" id="conversionType">
											<option value="">转换类型</option>
											<option value="1">字符串—&gt;UCS2(80)</option>
											<option value="2">字符串—&gt;ASCII</option>
											<option value="9">UCS2(80)—&gt;字符串</option>
											<option value="10">ASCII—&gt;字符串</option>
											<option value="3">十进制—&gt;二进制</option>
											<option value="4">二进制—&gt;十进制</option>
											<option value="5">十进制—&gt;十六进制</option>
											<option value="6">十六进制—&gt;十进制</option>
											<option value="7">二进制—&gt;十六进制</option>
											<option value="8">十六进制—&gt;二进制</option>
										</select>
										<div class="cy-tab-btn">
											<button class="btn btn-success btn-xs" onclick="encodingConversion();">转换</button>
										</div>
									</div>
									<textarea class="cy-tab-textarea form-control" rows="4" placeholder="结果" id="encodingResult"></textarea>
									<div class="cy-tab-content"></div>
								</div>
								<!-- End -->
							</div>
						</div>

						<div id="demo-panel-alert3" class="demo-panel-alert panel tool_wtfk"  style="display: none">
							<!-- 小工具头部 -->
							<div class="panel-heading">
								<div class="panel-control">
									<button data-toggle="collapse" data-target="#demo-panel-collapse_3" class="btn btn-default" aria-expanded="true"><i class="fa fa-chevron-down"></i></button>
									<button class="btn btn-default btn-close"><i class="fa fa-times"></i></button>
								</div>
								<h3 class="panel-title">问题反馈工具</h3>
							</div>
							<!-- End -->
							<div id="demo-panel-collapse_3" class="collapse in" aria-expanded="true">
								<!-- 小工具内容 -->
								<div class="panel-body cy-nopadding-top">
									<textarea class="cy-tab-textarea form-control" rows="8" placeholder=""></textarea>
									<div class="cy-pad-ver-s">
										<select class="">
											<option selected="selected" value="">问题类型</option>
											<option value="业务咨询">业务咨询</option>
											<option value="技术咨询">技术咨询</option>
											<option value="BUG提交">BUG提交</option>
											<option value="改进建议">改进建议</option>
										</select>
										<div class="cy-tab-btn-f">
											<button class="btn btn-success btn-xs">上传</button>
											<button class="btn btn-success btn-xs">提交</button>
										</div>
									</div>
								</div>
								<!-- End -->
							</div>
						</div>
					</div>
				</div>
				<!-- End -->
			</div>
		</div>
	</div>
</aside>
<!-- 右侧功能区结束 -->
<script type="text/javascript"
	src="${ctx}/resource/js/app/toolkit.js"></script>