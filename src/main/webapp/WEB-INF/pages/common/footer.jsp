<%@ page language="java" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/common/taglibs.jsp"%>
<input type="hidden" name="ctx" id="ctx" value="${ctx}">
<!-- 底部 -->
<footer id="footer">
	<div class="show-fixed pull-right">
		<ul class="footer-list list-inline">
			<li>
				<p class="text-sm">SEO Proggres</p>
				<div class="progress progress-sm progress-light-base">
					<div style="width: 80%" class="progress-bar progress-bar-danger"></div>
				</div>
			</li>

			<li>
				<p class="text-sm">Online Tutorial</p>
				<div class="progress progress-sm progress-light-base">
					<div style="width: 80%" class="progress-bar progress-bar-primary"></div>
				</div>
			</li>
			<li>
				<button class="btn btn-sm btn-dark btn-active-success">Checkout</button>
			</li>
		</ul>
	</div>
	<div class="hide-fixed pull-right pad-rgt">Currently v2.2</div>
	<p class="pad-lft">Copyright &#0169; 2015-2016 北京维思智达科技有限公司 Beijing WISE & RICH Co., Ltd  All Rights Reserved</p>
</footer>
<!-- 底部结束 -->
<!-- 返回顶部按钮 -->
<button id="scroll-top" class="btn"><i class="fa fa-chevron-up"></i></button>
<!-- 返回顶部按钮结束 -->
<script type="text/javascript">
$.ajax({
	type : "get",
	url : $("#ctx").val()+"/pvStatis.htm"
});
</script>