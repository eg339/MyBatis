<%@ page language="java" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/common/taglibs.jsp"%>
<!-- system modal start -->
<div id="self-alert" class="modal">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h5 class="modal-title">
					<i class="fa fa-exclamation-circle"></i> [Title]
				</h5>
			</div>
			<div class="modal-body small">
				<p style="font-size:12px">[Message]</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary ok"
					data-dismiss="modal">[BtnOk]</button>
				<button type="button" class="btn btn-default cancel"
					data-dismiss="modal">[BtnCancel]</button>
			</div>
		</div>
	</div>
</div>
<!-- system modal end -->