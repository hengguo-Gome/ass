<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>
<%@ include file="../inc/resource.inc"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>群发消息</title>
<script type="text/javascript">
	var dataGrid;
	$(function() {
		$("#messageList").datagrid({
			title : "消息列表",
			toolbar : "#tb",
			height : document.documentElement.clientHeight * 0.98,
			url : ctx + '/groupMessage/findGroupMessagePageList',
			idField : 'id',
			pagination : true,
			rownumbers : true,
			striped : true,
			pageSize : 20,
			columns : [ [ {
				field : 'id',
				title : 'ID',
				width : 80,
				hidden : true,
				fitColumns : true,
				styler : function(value, row, index) {
					return 'font-size:12px;';
				}
			}, {
				field : 'title',
				title : '标题',
				width : 100,
				styler : function(value, row, index) {
					return 'font-size:12px;';
				}
			}, {
				field : 'content',
				title : '内容',
				width : 300,
				styler : function(value, row, index) {
					return 'font-size:12px;';
				}
			}, {
				field : 'workerId',
				title : '工人姓名',
				width : 100
			}, {
				field : 'sendUserId',
				title : '发送人',
				width : 100
			}, {
				field : 'scope',
				title : '发送范围',
				width : 100,
				styler : function(value, row, index) {
					return 'font-size:12px;';
				}
			}, {
				field : 'type',
				title : '消息类型',
				width : 100,
				styler : function(value, row, index) {
					return 'font-size:12px;';
				}/*,
				formatter : function(value) {
					if (value == 0) {
						return "订单消息";
					} else if (value == 1) {
						return "系统消息";
					} else if (value == 2) {
						return "投诉消息";
					}
				}*/
			}, {
				field : 'sendtime',
				title : '发送时间',
				width : 200/*,
				styler : function(value, row, index) {
					return 'font-size:12px;';
				},
				formatter : function(value) {
					var d = new Date(value);
					return d.format("yyyy-MM-dd HH:mm:ss");
				}*/
			} ] ],
			loadMsg : "数据加载中...",
			onBeforeLoad : function(param) {
				$.serializeObject($('#searchForm'), param);
				param.currentPage = param.page;
				param.pageCount = param.rows;
			}
		});
		$('#cc').combogrid({
			panelWidth : 550,
			value : '请入手机号',
			idField : 'id',
			textField : 'phone',
			url : ctx + 'n/driverLogin/list',
			columns : [ [ {
				field : 'id',
				title : '司机编号',
				width : 60,
				hidden : true
			}, {
				field : 'phone',
				title : '手机号',
				width : 120,
				styler : function(value, row, index) {
					return 'font-size:12px;';
				}
			}, {
				field : 'name',
				title : '司机姓名',
				width : 100,
				styler : function(value, row, index) {
					return 'font-size:12px;';
				}
			}, {
				field : 'platformId',
				title : '配送中心名称',
				width : 150,
				styler : function(value, row, index) {
					return 'font-size:12px;';
				}
			}, {
				field : 'carriercode',
				title : '承运商名称',
				width : 150,
				styler : function(value, row, index) {
					return 'font-size:12px;';
				}
			} ] ],
			loadMsg : "数据加载中...",
			pagination : true,
			rownumbers : true,
			striped : true,
			pageSize : 20,
			pageList : [ 10, 20, 30, 40, 50 ],
			/*onClickRow : function(){
				var g = $('#cc').combogrid('grid');	// get datagrid object
				var r = g.datagrid('getSelected');	// get the selected row
				if(r){
					if(arrIdMp.containElem(r.id)){
						$.messager.alert('提示',r.name + '已选择');
					}else{
						arrIdMp.push(r.id);
						var sp = $("#template").find("span").clone();
						sp.find("font").html(r.name);
						sp.data("id", r.id);
						sp.find("#close").click(function(){
							$(this).parent().remove();
							arrIdMp.remove(r.id);
						});
						$("#selectPerson").append(sp);
						$('#cc').combogrid('clear');	
					}	
				}
			},*/
			onChange : function(newValue, oldValue) {
				$('#cc').combogrid({
					queryParams : {
						phone : newValue
					}
				});
			},
			onLoadSuccess : function() {
				$('#ccParent input.validatebox-text').focus();
			},
			onHidePanel : function() {
				var g = $('#cc').combogrid('grid'); // get datagrid object
				var r = g.datagrid('getSelected'); // get the selected row
				if (r) {
					if (arrIdMp.containElem(r.id)) {
						$.messager.alert('提示', r.name + '已选择');
						$('#cc').combogrid('clear');
					} else {
						arrIdMp.push(r.id);
						var sp = $("#template").find("span").clone();
						sp.find("font").html(r.name);
						sp.data("id", r.id);
						sp.find("#close").click(function() {
							$(this).parent().remove();
							arrIdMp.remove(r.id);
						});
						$("#selectPerson").append(sp);
						$('#cc').combogrid('clear');
					}
				}
			}
		});

		$("#selectPersonGroup").combobox({
			valueField : 'id',
			textField : 'text',
			data : [ {
				id : 'group',
				text : '群发'
			}, {
				id : 'person',
				text : '选人'
			} ],
			onChange : function(newValue, oldValue) {
				if (newValue == "person") {//选人
					$("#selectGroupArea").slideUp();
					$("#selectPerosnArea").slideDown();
				} else if (newValue == "group") {//选组
					$("#selectPerosnArea").slideUp();
					$("#selectGroupArea").slideDown();
				}
			}
		});

		$("#ccGroup").combobox({
			url : ctx + '/groupMessage/findWebcodeList',
			valueField : 'webcode',
			textField : 'webname'
		});
	});
	$.serializeObject = function(form, o) {
		$.each(form.serializeArray(), function(index) {
			if (o[this['name']]) {
				o[this['name']] = o[this['name']] + "," + this['value'];
			} else {
				o[this['name']] = this['value'];
			}
		});
		return o;
	};
	
	function addMessageData() {
		$('#dlg').dialog('open').dialog('setTitle', '发送消息');
		$('#fm').form('clear');
	}

	function searchMessageData() {
		$('#messageList').datagrid('load');
	}
	function sendMessage() {
		var title = $("#title").val();
		var content = $("#msgContent").val();
		if (title.getStrLength() > 20) {
			$.messager.alert('提示', '标题最多不能超过10个字');
			return;

		} else if (content.getStrLength() > 100) {
			$.messager.alert('提示', '内容最多不能超过50个字');
			return;
		} else {
			$.messager.progress(); // display the progress bar
			$('#fm').form(
					'submit',
					{
						url : ctx + "n/message/saveWuliuManagerMessage",
						onSubmit : function(param) {
							var isValid = $(this).form('validate');
							var selectType = $("#selectPersonGroup").combobox(
									"getValue");
							if (!selectType) {
								$.messager.progress('close');
								$.messager.alert('提示', '请选择发送方式');
								return false;
							} else if (selectType == "group") {//选组
								param.groupId = $("#ccGroup").combobox(
										"getValue");
							} else if (selectType == "person") {//选人
								param.driverIds = arrIdMp.join(",");
							}
							param.type = selectType;
							if (!isValid) {
								$.messager.progress('close');
							}
							return isValid; // return false will stop the form submission
						},
						success : function() {
							$.messager.progress('close'); // hide progress bar while submit successfully
							$('#dlg').dialog('close');
							$("#messageList").datagrid("reload");
							$.messager.show({
								title : '提示',
								msg : '消息发送成功',
								timeout : 3000,
								showType : 'slide'
							});
							arrIdMp = [];
						}
					});
		}
	}
</script>
</head>
<body>
	<table id="messageList"></table>
	<div id="tb">
		<a href="javascript:void(0);" class="easyui-linkbutton"
			data-options="iconCls:'icon-add',plain:true"
			onclick="addMessageData();">发送消息</a>
		<table>
			<tr>
				<td>标题：</td>
				<td><input id="qTitle" class="easyui-validatebox" /></td>
				<td>内容:</td>
				<td><input id="qContent" class="easyui-validatebox" /></td>
				<td><a href="javascript:void(0);" class="easyui-linkbutton"
					data-options="iconCls:'icon-search',plain:true"
					onclick="searchMessageData();">查询</a></td>
		</table>
	</div>

	<div id="dlg" class="easyui-dialog"
		style="width: 600px; height: 400px; padding: 10px 20px" closed="true"
		buttons="#dlg-buttons"
		data-options="modal:true,top:100,resizable:true">
		<form id="fm" method="post">
			<table>
				<tr>
					<td class="labelTd">标题：</td>
					<td><input id="title" name="title" class="easyui-validatebox"
						required="true" style="width: 400px;"></td>
				</tr>
				<tr>
					<td class="labelTd">内容：</td>
					<td><textarea id="msgContent" rows="5" cols="50"
							style="width: 400px;" name="content" class="easyui-validatebox"
							required="true"></textarea></td>
				</tr>
				<tr>
					<td class="labelTd">发送方式：</td>
					<td><input id="selectPersonGroup" style="width: 396px" /></td>
				</tr>
				<tr id="selectPerosnArea" style="display: none;">
					<td class="labelTd">发送目标：</td>
					<td>
						<div class="easyui-tooltip" data-options="position:'top'"
							title="不选择人员默认的发送范围为您所管理区域的所有人员" id="selectPerson"
							style="margin: 20px 0; border: 1px solid black; width: 396px; height: 100px; overflow: scroll;"></div>
						<div id="ccParent">
							<select id="cc" class="easyui-combogrid" style="width: 396px">
							</select>
						</div>
						<p id="template" style="display: none;">
							<!-- style="display: none;" -->
							<span style="margin-left: 2px;"><font
								style="background-color: #e0e5ee; font-size: 12px;">张三</font><img
								id="close" style="vertical-align: text-bottom;" alt="删除"
								src="${ctx}/images/del.jpg"></span>
						</p>
					</td>
				</tr>
				<tr id="selectGroupArea">
					<td class="labelTd">组别选择：</td>
					<td><input id="ccGroup" style="width: 396px" /></td>
				</tr>
			</table>
		</form>
		<div style="height: 20px;"></div>
	</div>
	<div id="dlg-buttons">
		<a href="#" class="easyui-linkbutton" iconCls="icon-ok"
			onclick="sendMessage()">发送</a> <a href="#" class="easyui-linkbutton"
			iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
	</div>
</html>