<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>
<%@ include file="../inc/resource.inc"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script type="text/javascript">
	var dataGrid;
	$(function() {
		dataGrid = $('#dataGrid').datagrid(
				{
					title : '人员信息列表',
					url : "${ctx}/person/personPageList",
					height : document.documentElement.clientHeight * 0.98,
					striped : true,
					idField : 'id',
					pagination : true,
					pageSize : 20,
					rownumbers : true,
					fitColumns : true,
					columns : [ [
							{
								field : 'id',
								title : 'id',
								width : 100,
								hidden : true
							},
							{
								field : 'name',
								title : 'Name',
								width : 100
							},
							{
								field : 'age',
								title : 'Age',
								width : 200
							},
							{
								field : 'address',
								title : 'Address',
								width : 200
							},
							{
								field : 'action',
								title : '操作',
								width : 50,
								formatter : function(value, row, index) {
									return '<a href="#" onclick="update(\''
											+ row.id + '\');">修改</a>';
								}
							} ] ],
					loadMsg : "数据加载中...",
					onBeforeLoad : function(param) {
						$.serializeObject($('#searchForm'),param);
						param.currentPage = param.page;
						param.pageCount = param.rows;
					}
				});

	});

	function searchs() {
		$('#dataGrid').datagrid('load');
	}
	
	$.serializeObject = function(form,o) {
		$.each(form.serializeArray(), function(index) {
			if (o[this['name']]) {
				o[this['name']] = o[this['name']] + "," + this['value'];
			} else {
				o[this['name']] = this['value'];
			}
		});
		return o;
	};

	function add() {
		window.location.href = "${ctx}/person/personAdd/";
	}

	function del() {
		var selected = $("#dataGrid").datagrid("getChecked");
		if (selected.length == 0) {
			alert("请选择要删除的内容!");
			return;
		}
		var idString = "";
		$.each(selected, function(index, item) {
			idString += item.fee_id + ",";
		});
		var msg = "确认删除选中的 " + selected.length + " 条数据吗?";

		if (confirm(msg) == true) {
			var url = "${ctx}/person/personDelete/" + idString;
			$.post(url, function(returnObj) {
				if (returnObj.flag = "success") {
					$.messager.alert('提示:', '删除成功!');
					//$("#dataGrid").datagrid("clearChecked");
					window.location.href = "${ctx}/person/personListView";
				} else {
					$.messager.alert('提示:', '删除失败!');
				}
			});
		}
	}
	function update(id) {
		var pageMarkup = "list";//页面标记位
		window.location.href = "${ctx}/person/updateView/" + id;
	}
</script>
</head>
<body class="easyui-layout" style="padding: 10px">
	<table id="dataGrid" toolbar="#tb"></table>
	<div id="tb" style="height: auto">
		<form id="searchForm">
			<table>
				<tr>
					<td>姓名：</td>
					<td><input name="name" class="easyui-validatebox" /></td>
					<td><a href="javascript:void(0);" class="easyui-linkbutton"
						data-options="iconCls:'icon-search',plain:true"
						onclick="searchs();">查询</a></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
