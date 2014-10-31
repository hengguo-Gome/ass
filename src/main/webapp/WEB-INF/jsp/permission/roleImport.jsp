<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>
<%@ include file="../inc/resource.inc"%>
<script type="text/javascript">
	$(function() {
		parent.$.messager.progress('close');
		
		$('#importForm').form({
			url : '${ctx}/role/importExcel',
			onSubmit : function() {
				parent.$.messager.progress({
					title : '提示',
					text : '数据处理中，请稍后....'
				});
				var isValid = $(this).form('validate');
				if (!isValid) {
					parent.$.messager.progress('close');
				}
				return isValid;
			},
			success : function(msg) {
				parent.$.messager.progress('close');
				$.messager.alert('提示:','失败'+$.parseJSON(msg).failure+'行');
// 				$.messager.alert('提示:','已存在'+$.parseJSON(msg).exists+'行');
				$.messager.alert('提示:','成功'+$.parseJSON(msg).success+'行');
			}
		});
	});
	
	function submitForm(){
		var f = $("#importForm");
		f.submit();
	}

	function goBack() {
		window.location.href = "${ctx}/role/shRoleListView";
	}
	
	function downloadTemplate(){
		window.location.href = "${ctx}/role/downloadTemplate";
	}

</script>
<div class="easyui-panel" title="权限导入" style="width: auto">
	<div id="toolbar" style="display: run-in;">
		<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true" onclick="goBack();">返回</a>
		<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="">模版下载</a>
	</div>
		<div style="padding: 10px 0 10px 60px">
		<form id="importForm" method="post" enctype="multipart/form-data" action="${ctx}/role/importExcel">
			<table class="table table-hover table-condensed" style="width: 100%; padding: 7px 80px 0px 80px">
				<tr>
					<td width="30%">
					<td width="20%"><input id="fileUpload" name="file" type="file" class="" /></td>
					<td width="20%"><input class="easyui-linkbutton" type="button" onclick="submitForm();" value="提交" /></td>
					<td width="30%">
				</tr>
			</table>
		</form>
	</div>
</div>