<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>
<%@ include file="../inc/resource.inc"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户角色管理</title>
<script type="text/javascript">

	serializeObject = function(form, o) {
		$.each(form.serializeArray(), function(index) {
			if (o[this['name']]) {
				o[this['name']] = o[this['name']] + "," + this['value'];
			} else {
				o[this['name']] = this['value'];
			}
		});
		return o;
	};
	var dataGrid;
	$(function() {
		$('#roles').datagrid({
			title : '角色信息',
			iconCls : 'icon-save',
			height : document.documentElement.clientHeight * 0.98,
			url : ctx + '/role/getRolePageList',
			idField : 'roleId',
			striped : true,
			pagination : true,
			pageSize : 20,
			rownumbers : true,
			checkOnSelect : false,
			columns : [ [
					{
						checkbox : true
					},
					{
						field : 'roleId',
						title : '角色编号',
						width : 300,
						formatter : function(value, row, index) {
							return '<a href="#" onclick="showRoleInfo(\''
									+ row.roleId + ',' + row.roleName + '\');">'+value+'</a>';
						}
					}, {
						field : 'roleName',
						title : '角色名称',
						width : 400
					} , {
						field : 'roleType',
						title : '角色名称',
						width : 200
					}] ],
			loadMsg : "数据加载中...",
			onBeforeLoad : function(param) {
				serializeObject($('#searchForm'), param);
				param.currentPage = param.page;
				param.pageCount = param.rows;
			}
		});
	});
	function convert(rows) {
		function exists(rows, parentId) {
			for (var i = 0; i < rows.length; i++) {
				if (rows[i].menuId == parentId)
					return true;
			}
			return false;
		}
		var nodes = [];
		// 得到顶层节点  
		for (var i = 0; i < rows.length; i++) {
			var row = rows[i];
			if (!exists(rows, row.parentId)) {
				nodes.push({
					id : row.menuId,
					text : row.menuName
				});
			}
		}

		var toDo = [];
		for (var i = 0; i < nodes.length; i++) {
			toDo.push(nodes[i]);
		}
		while (toDo.length) {
			var node = toDo.shift(); // 父节点   
			// 得到子节点   
			for (var i = 0; i < rows.length; i++) {
				var row = rows[i];
				if (row.parentId != undefined && row.parentId == node.id) {
					if (row.menuUrl) {
						var child = {
							id : row.menuId,
							text : row.menuName,
							attributes : {
								url : row.menuUrl
							}
						};
					} else {
						var child = {
							id : row.menuId,
							text : row.menuName
						};
					}
					if (node.children) {
						node.children.push(child);
					} else {
						node.children = [ child ];
					}
					toDo.push(child);
				}
			}
		}
		//alert("convert nodes: " + nodes);
		return nodes;
	};
	function showRoleInfo(Ids) {
		var arr = Ids.split(',');
		var roleId = arr[0];
		var roleName = arr[1];
		celarNodes($('#info_tt'));
		$('#info_tt').tree({
			cascadeCheck : false
		});
		$('#info_').dialog('open').dialog('setTitle', '角色详细信息');
		$('#info_fm').form('clear');
		$('#info_fm').find("input[name='info_roleId']").val(roleId);
		$('#info_fm').find("textarea[name='info_roleName']").val(roleName);
		$.post(ctx + "/role/getRoleResource", {
			roleId : roleId
		}, function(data) {
			data = jQuery.parseJSON(data);
			$.each(data, function(i, n) {
				var node = $('#info_tt').tree('find', n.resource_id);
				if(node != null){
					$('#info_tt').tree('check', node.target);
				}
			});

		});
	};
	function searchs() {
		$('#roles').datagrid('load');
	};
	function submitForm() {
		var flag = true;
		if($('#Win').find("input[name='roleId']").val() ==""){
			flag = false;
		}else if($('#Win').find("input[name='roleName']").val() == ""){
			flag = false;
		}else if($('#Win').find("input[name='roleType']").val() == ""){
			flag = false;
		}
		if (!flag) {
			$.messager.alert('消息提示', "表单数值不能为空", 'error');
		} else {
			parent.showProgressing();
			var data = $("#fm").serialize();

			var nodes = $('#tt').tree('getChecked',
					[ 'checked', 'indeterminate' ]);
			var roleIds = [];
			$.each(nodes, function(i, node) {
				roleIds.push(node.id);
			});
			if($('#action').attr("readonly")=="readonly"){
				action = "update";
			}else if(typeof($('#action').attr("readonly"))=="undefined"){
				action = "insert";
			}else{
				alert('参数解析出错');
				return;
			}
			data += "&action=" +action;
			data += "&menuIds=" +roleIds;
			$.ajax({
				type : "POST",
				data : data,
				url : ctx + "/role/inOrUp",
				error : function(request) {
					parent.closeProgressing();
					$.messager.alert('消息提示', "发送请求错误!", 'error');
				},
				success : function(data) {
					parent.closeProgressing();
					data = jQuery.parseJSON(data);
					if(data.status=="error"){
						$.messager.alert('消息提示', data.result, 'info');
					}else if(data.status=="success"){
						$.messager.alert('消息提示', data.result, 'info');
						$('#Win').window('close');	
						searchs();
					}
				}
			});
		}
		;
	};

	function addData() {
		$('#Win').dialog('open').dialog('setTitle', '添加角色');
		$('#fm').find("input[name='roleId']").removeAttr("readonly");
		$('#fm').find("input[name='roleType']").removeAttr("readonly");
		$('#fm').form('clear');
		celarNodes($('#tt'));
		$('#tt').tree({
			cascadeCheck : true
		});
	};

	function celarNodes(tt) {
		var nodes = tt.tree('getChecked', [ 'checked', 'indeterminate' ]);
		$.each(nodes, function(i, node) {
			tt.tree('uncheck', node.target);
		});
	};

	function editData() {
		var selectRows = $("#roles").datagrid('getChecked');
		if (selectRows.length == 0) {
			$.messager.alert('提示', '请选择您要修改的行!', 'info');
		} else if (selectRows.length > 1) {
			$.messager.alert('提示', '一次只能编辑一条数据!', 'info');
		} else {
			celarNodes($('#tt'));
			$('#tt').tree({
				cascadeCheck : false
			});
			$('#Win').dialog('open').dialog('setTitle', '修改角色');
			$('#fm').form('clear');
			var roleId = selectRows[0].roleId;
			$('#fm').find("input[name='roleId']").val(roleId);
			$('#fm').find("input[name='roleId']").attr("readonly","readonly");
			$('#fm').find("input[name='roleName']").val(selectRows[0].roleName);
			$.post(ctx + "/role/getType",{
				roleId: roleId
			}, function(data) {
				$('#updateRoleType').combobox('setValue',data);
			});
			
			$.post(ctx + "/role/getRoleResource", {
				roleId : roleId
			}, function(data) {
				data = jQuery.parseJSON(data);
				$.each(data, function(i, n) {
					var node = $('#tt').tree('find', n.resource_id);
					if(node != null){
						$('#tt').tree('check', node.target);
					}
				});

			});
		}
	};

	function deleteData() {
		var selectRows = $("#roles").datagrid('getChecked');
		if (selectRows.length == 0) {
			$.messager.alert('提示', '请选择您要删除的行!', 'info');
		} else {
			$.messager.confirm('确认', '您确认删除所选的 ' + selectRows.length + ' 数据吗？', function(r) {
				if (r) {
					var roleIds = [];
					var roleTypes = [];
					for (var i = 0; i < selectRows.length; i++) {
						roleIds.push(selectRows[i].roleId);
						roleTypes.push(selectRows[i].roleType);
					}
					$.post(ctx + "/role/delete", {
						roleIds : roleIds.join(","),
						roleTypes : roleTypes.join(",")
					}, function(data) {
						$.messager.alert('消息提示', data, 'info');
						searchs();
					});
				}
			});
		}
	};
	
	function importData() {
		window.location.href = "${ctx}/role/importRoleView";
	}
</script>
</head>
<body class="easyui-layout" style="padding: 10px">

	<table id="roles" toolbar="#tb"></table>
	<div id="tb" style="height: auto">
		<a class="easyui-linkbutton" data-options="iconCls:'icon-add'"
			onclick="importData();">导入</a> 
		<a class="easyui-linkbutton" data-options="iconCls:'icon-add'"
			onclick="addData();">添加</a> <a class="easyui-linkbutton"
			data-options="iconCls:'icon-edit'" onclick="editData();">修改</a> <a
			class="easyui-linkbutton" data-options="iconCls:'icon-remove'"
			onclick="deleteData();">删除</a>
		<form id="searchForm">
			<table>
				<tr>
					<td>角色编号:<input id="roleId" name="roleId"
						style="line-height: 20px; border: 1px solid #ccc"></td>
					<td>角色名称:<input id="roleName" name="roleName"
						style="line-height: 20px; border: 1px solid #ccc"></td>
					<td>角色类型：</td>
          			<td><input id="roleType" name="roleType" editable="false"
           				 class="easyui-combobox" data-options="url:'${ctx}/code/getCombobox/role_type'"></td>
					<td><a class="easyui-linkbutton"
						data-options="iconCls:'icon-search'" onClick="searchs()">查询</a></td>
				</tr>
			</table>
		</form>
	</div>
	<div id="info_" class="easyui-window"
		data-options="modal:true,closed:true,iconCls:'icon-save',top:100,resizable:true"
		style="width: 600px; height: 400px; padding: 10px; font-size: 16px;">

		<div id="info_cc" class="easyui-layout"
			style="width: 550px; height: 300px;">
			<div data-options="region:'west',title:'菜单栏信息'" style="width: 200px;">
				<ul id="info_tt" class="easyui-tree" data-options="animate:true,dnd:true" checkbox="true"></ul>
			</div>
			<div data-options="region:'center',title:'角色信息'"
				style="padding: 5px; width: 220px">

				<form id="info_fm" action="" method="post">
					<table cellpadding="5" align="center" style="margin-top: 80px">
						<tr>
							<td>角色编号:</td>
							<td><input class="easyui-validatebox textbox" type="text" readonly
								name="info_roleId"></input></td>
						</tr>
						<tr>
							<td>角色名称:
							</td>
							<td>
								<textarea class="easyui-validatebox textbox" readonly
									name="info_roleName" rows="2" cols="20"></textarea>
								</td>
						</tr>
					</table>
					<div style="text-align: center; padding: 5px">
						<a href="javascript:void(0)"
							class="easyui-linkbutton" onclick="$('#info_').window('close')">关闭</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div id="Win" class="easyui-window"
		data-options="modal:true,closed:true,iconCls:'icon-save',top:100,resizable:true"
		style="width: 600px; height: 400px; padding: 10px; font-size: 16px;">

		<div id="cc" class="easyui-layout"
			style="width: 550px; height: 300px;">
			<div data-options="region:'west',title:'菜单栏信息'" style="width: 200px;">
				<ul id="tt" class="easyui-tree" data-options="animate:true,dnd:true" checkbox="true"></ul>
			</div>
			<div data-options="region:'center',title:'角色信息'"
				style="padding: 5px; width: 220px">

				<form id="fm" action="" method="post">
					<table cellpadding="5" align="center" style="margin-top: 80px">
						<tr>
							<td>角色编号<span style="color: red">(*)</span>:</td>
							<td><input class="easyui-validatebox valid textbox" type="text" readonly id="action"
								name="roleId"></input></td>
						</tr>
						<tr>
							<td>角色名称<span style="color: red">(*)</span>:
							</td>
							<td><input class="easyui-validatebox textbox valid"
								type="text" name="roleName"></input></td>
						</tr>
						<tr>
							<td>角色类型<span style="color: red">(*)</span>:</td>
							<td><input id="updateRoleType" name="roleType" editable="false"
           				 class="easyui-combobox valid textbox" data-options="url:'${ctx}/code/getCombobox/role_type?value=2'"></td>
						</tr>
						
						
					</table>
					<div style="text-align: center; padding: 5px">
						<a href="javascript:void(0)" class="easyui-linkbutton"
							onclick="submitForm()">确认</a> <a href="javascript:void(0)"
							class="easyui-linkbutton" onclick="$('#Win').window('close')">取消</a>
					</div>
				</form>
			</div>
		</div>

	</div>
</body>
<script type="text/javascript">
$('#tt').tree({
	url : ctx + '/menu/getMenus',
	loadFilter : function(rows) {
		return convert(rows);
	},
	onCheck : function(node, checked) {
		var isLeaf = $('#tt').tree("isLeaf", node.target);
		if (isLeaf) {//叶子节点
			if (checked) {//已被选中
				var parent = $('#tt').tree("getParent", node.target);
				$('#tt').tree("check", parent.target);
			}
		} else {//父节点
			if (!checked) {//取消选中则取消子节点的选中
				var children = $('#tt').tree("getChildren", node.target);
				for (var i = 0; i < children.length; i++) {
					var no = children[i];
					$('#tt').tree("uncheck", no.target);
				}
			}
		}
	}
});
$('#info_tt').tree({
	url : ctx + '/menu/getMenus',
	loadFilter : function(rows) {
		return convert(rows);
	},
	onCheck : function(node, checked) {
		//alert("onCheck node: "+node);
		var isLeaf = $('#info_tt').tree("isLeaf", node.target);
		if (isLeaf) {//叶子节点
			if (checked) {//已被选中
				var parent = $('#info_tt').tree("getParent", node.target);
				$('#info_tt').tree("check", parent.target);
			}
		} else {//父节点
			if (!checked) {//取消选中则取消子节点的选中
				var children = $('#info_tt').tree("getChildren", node.target);
				for (var i = 0; i < children.length; i++) {
					var no = children[i];
					$('#info_tt').tree("uncheck", no.target);
				}
			}
		}
	}
});
</script>
</html>