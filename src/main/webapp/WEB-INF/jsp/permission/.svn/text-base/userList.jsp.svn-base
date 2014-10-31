<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>
<%@ include file="../inc/resource.inc"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>
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
		$('#users').datagrid({
			title : '用户信息',
			iconCls : 'icon-save',
			height : document.documentElement.clientHeight * 0.98,
			striped : true,
			url : ctx + '/urole/getUserPageList',
			idField : 'userId',
			pagination : true,
			pageSize : 20,
			rownumbers : true,
			checkOnSelect : false,
			columns : [[
                   {
                       checkbox:true
                   },{
                       field:'name',
                       title:'姓名',
                       align : 'center',
                       width:100
                   },
                   {
                       field:'account',
                       title:'账号',
                       align : 'center',
                       width:200
                   },
                   {
                       field:'company_code',
                       title:'公司代码',
                       align : 'center',
                       width:100
                       /*,
                       styler: function(value,row,index){
                            return 'font-size:12px;';
                        },
                       formatter : function(value){
                           return "<a href='javascript:void(0);' uid='" + value + "' onclick='showPositionAndRole(this);'>查看职位</a>";
                       }*/
                   }, {
                       field:'webcode',
                       title:'网点代码',
                       align : 'center',
                       width:100
                   },{
                       field:'from_type',
                       title:'用户类型',
                       align : 'center',
                       width:200
                   },{
						field : 'action',
						title : '操作',
						width : 150,
						formatter : function(value, row, index) {
							return '<a href="#" onclick="showUserInfo(\''
									+ row.userId + ',' + row.userName + '\');">查看详细信息</a>';
						}
					} ]],
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
		return nodes;
	};
	function showUserInfo(Ids) {
		var arr = Ids.split(',');
		var userId = arr[0];
		var userName = arr[1];
		celarNodes($('#info_tt'));
		$('#info_tt').tree({
			cascadeCheck : false
		});
		$('#info_').dialog('open').dialog('setTitle', '角色详细信息');
		$('#info_fm').form('clear');
		$('#info_fm').find("input[name='info_userId']").val(userId);
		$('#info_fm').find("input[name='info_userName']").val(userName);
		$.post(ctx + "/urole/getUserResource", {
			userId : userId
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
		$('#users').datagrid('load');
	};
	function submitForm() {
		var flag = true;
		$(".valid").each(function(i, n) {
			if ("" == n.value) {
				flag = false;
			}
		});

		if (!flag) {
			$.messager.alert('消息提示', "表单数值不能为空", 'error');
		} else {
			parent.showProgressing();
			var data = $("#fm").serialize();

			var nodes = $('#tt').tree('getChecked',
					[ 'checked', 'indeterminate' ]);
			var userIds = [];
			$.each(nodes, function(i, node) {
				tmpNode =node.id+",";
				userIds += tmpNode;
			});
			data += "&menuIds=" +userIds;
			$.ajax({
				type : "POST",
				data : data,
				url : ctx + "/user/inOrUp",
				error : function(request) {
					parent.closeProgressing();
					$.messager.alert('消息提示', "发送请求错误!", 'error');
				},
				success : function(data) {
					parent.closeProgressing();
					$.messager.alert('消息提示', data, 'info');
					$('#Win').window('close');
					searchs();
				}
			});
		}
		;
	};

	function addData() {
		$('#Win').dialog('open').dialog('setTitle', '添加用户');
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
		var selectRows = $("#users").datagrid('getChecked');
		if (selectRows.length == 0) {
			$.messager.alert('提示', '请选择您要修改的行!', 'info');
		} else if (selectRows.length > 1) {
			$.messager.alert('提示', '一次只能编辑一条数据!', 'info');
		} else {
			celarNodes($('#tt'));
			$('#tt').tree({
				cascadeCheck : false
			});
			$('#Win').dialog('open').dialog('setTitle', '修改用户');
			$('#fm').form('clear');
			var userId = selectRows[0].userId;
			$('#fm').find("input[name='userId']").val(userId);
			$('#fm').find("input[name='userName']").val(selectRows[0].userName);
			// 		$('#fm').find("input[name='positioncode']").val(selectRows[0].positioncode);
			// 		$('#fm').find("input[name='positionname']").val(selectRows[0].positionname);
			$.post(ctx + "/urole/getUserResource", {
				userId : userId
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
		var selectRows = $("#users").datagrid('getChecked');
		if (selectRows.length == 0) {
			$.messager.alert('提示', '请选择您要删除的行!', 'info');
		} else {
			$.messager.confirm('确认', '您确认删除所选的 ' + selectRows.length + ' 数据吗？', function(r) {
				if (r) {
					var userIds = [];
					for (var i = 0; i < selectRows.length; i++) {
						userIds.push(selectRows[i].userId);
					}
					$.post(ctx + "/urole/delete", {
						userIds : userIds.join(",")
					}, function(data) {
						$.messager.alert('消息提示', data, 'info');
						searchs();
					});
				}
			});
		}
	};
</script>
</head>
<body class="easyui-layout" style="padding: 10px">

	<table id="users" toolbar="#tb"></table>
	<div id="tb" style="height: auto">
		<a class="easyui-linkbutton" data-options="iconCls:'icon-add'"
			onclick="addData();">添加</a> <a class="easyui-linkbutton"
			data-options="iconCls:'icon-edit'" onclick="editData();">修改</a> <a
			class="easyui-linkbutton" data-options="iconCls:'icon-edit'"
			onclick="deleteData();">删除</a>
		<form id="searchForm">
			<table>
				<tr>
					<td>用户账号:<input id="userId" name="userId"
						style="line-height: 20px; border: 1px solid #ccc"></td>
					<td>用户姓名:<input id="userName" name="userName"
						style="line-height: 20px; border: 1px solid #ccc"></td>
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
			<div data-options="region:'west',title:'角色信息'" style="width: 200px;">
				<ul id="info_tt" class="easyui-tree" data-options="animate:true,dnd:true" checkbox="true"></ul>
			</div>
			<div data-options="region:'center',title:'用户信息'"
				style="padding: 5px; width: 220px">

				<form id="info_fm" action="" method="post">
					<table cellpadding="5" align="center" style="margin-top: 80px">
						<tr>
							<td>用户账号:</td>
							<td><input class="easyui-validatebox textbox" type="text" readonly="readonly"
								name="info_userId"></input></td>
						</tr>
						<tr>
							<td>用户姓名:
							</td>
							<td><input class="easyui-validatebox textbox" readonly="readonly"
								type="text" name="info_userName"></input></td>
						</tr>
					</table>
					<div style="text-align: center; padding: 5px">
						<a href="javascript:void(0)"
							class="easyui-linkbutton" onclick="$('#info_').window('close')">确认</a>
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
			<div data-options="region:'west',title:'角色信息'" style="width: 200px;">
				<ul id="tt" class="easyui-tree" data-options="animate:true,dnd:true" checkbox="true"></ul>
			</div>
			<div data-options="region:'center',title:'用户信息'"
				style="padding: 5px; width: 220px">

				<form id="fm" action="" method="post">
					<table cellpadding="5" align="center" style="margin-top: 80px">
						<tr style="display: none">
							<td>角色编号:</td>
							<td><input class="textbox" type="text"
								name="userId"></input></td>
						</tr>
						<tr>
							<td>角色名称<span style="color: red">(*)</span>:
							</td>
							<td><input class="easyui-validatebox textbox valid"
								type="text" name="userName"></input></td>
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
	url : ctx + '/menu/getMenuTree',
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
	url : ctx + '/menu/getMenuTree',
	loadFilter : function(rows) {
		return convert(rows);
	},
	onCheck : function(node, checked) {
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