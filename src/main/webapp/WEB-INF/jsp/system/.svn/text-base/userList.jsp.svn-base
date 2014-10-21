<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>
<%@ include file="../inc/resource.inc"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>系统人员管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
function searchData() {
    $('#systemAdminList').datagrid('load');
};
var dataGrid;
$(function(){
    $("#systemAdminList").datagrid({
        title: "用户列表",
        toolbar: "#tb",
        height : document.documentElement.clientHeight*0.98,
        url : ctx + '/user/getUserPageList',
        pagination: true,
        rownumbers: true,
        striped: true,
        pageSize : 20,
        columns: [[
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
                   }
                   ]],
        loadMsg: "数据加载中...",
        onBeforeLoad : function(param) {
            $.serializeObject($('#searchForm'), param);
            param.currentPage = param.page;
            param.pageCount = param.rows;
        }
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
    $("#userRoleList").datagrid({
        title: "用户角色列表",
        url : ctx + 'n/systemUserRole/findUserRole',
        columns: [[
                   {
                       checkbox:true
                   },
                   {
                       field:'roleId',
                       title:'角色编码',
                       align : 'center',
                       width:100,
                       styler: function(value,row,index){
                            return 'font-size:12px;';
                        }
                   },
                   {
                       field:'roleName',
                       title:'角色名称',
                       align : 'center',
                       width:200,
                       styler: function(value,row,index){
                            return 'font-size:12px;';
                        }
                   },
                   {
                       field:'positionCode',
                       title:'岗位编码',
                       align : 'center',
                       width:100,
                       styler: function(value,row,index){
                            return 'font-size:12px;';
                        }
                   },
                   {
                       field:'positionName',
                       title:'岗位名称',
                       align : 'center',
                       width:200,
                       styler: function(value,row,index){
                            return 'font-size:12px;';
                        }
                   }
                   ]],
        loadMsg: "数据加载中...",
        pagination: true,
        rownumbers: true,
        striped: true,
        pageSize : 20,
        queryParams: {
            userId: 'null'
        }
    });
    
    /*$("#platformId").combobox({
        url: basePath + 'n/platform/findPlatform',
        valueField:'platformId',
        textField:'platformName'
    });
    
    $("#eplatformId").combobox({
        url:basePath + 'n/platform/findPlatform',
        valueField:'platformId',
        textField:'platformName'
    });
    
    $("#username").blur(function(){
        var option = {
                "username" : $(this).val()
        };
        $.post(basePath + "n/wuliuManager/checkWuliuManagerUserName", option, function(data){
            data = $.parseJSON(data);
            if(data.result == "exist"){
                $.messager.alert('提示','该用户名已经存在!','info');
            }
        });
    });
    
    $("#eusername").blur(function(){
        var option = {
                "username" : $(this).val(),
                "id" : $("#efm").find("#id").val()
        };
        $.post(basePath + "n/wuliuManager/checkWuliuManagerUserName",option, function(data){
            data = $.parseJSON(data);
            if(data.result == "exist"){
                $.messager.alert('提示','该用户名已经存在!','info');
            }
        });
    });*/
    
</script>
<body>
<table  id="systemAdminList"></table>

<div id="tb">
  <form id="searchForm">
	<!-- <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="addManagerData();">添加</a>
	<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" onclick="editManagerData();">修改</a>
	<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="deleteManagerData();">删除</a>
	<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-ok',plain:true" onclick="resetManagerPassword();">重置密码</a> -->
	<table>
		<tr>
		<td>姓名：</td>
		<td><input id="name" name="name" placeholder="请输入姓名" class="easyui-validatebox"/></td>
		<td>账号：</td>
		<td><input id="account" name="account" placeholder="请输入账号" class="easyui-validatebox"/></td>
<!-- 		<td>手机号:</td> -->
<!-- 		<td><input id="qMobile" class="easyui-validatebox"/></td> -->
		<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onclick="searchData();">查询</a></td>
<!-- 		<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" onclick="editManagerData();">修改</a></td> -->
	</table>
  </form>
</div>


<div id="userRole" class="easyui-dialog" style="width:800px;height:400px;padding:10px 20px"
        closed="true" buttons="#ur-buttons" data-options="modal:true,top:100">
   <table  id="userRoleList"></table>
</div>

<div id="ur-buttons">
    <a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="javascript:$('#userRole').dialog('close')">确定</a>
</div>

<div id="dlg" class="easyui-dialog" style="width:400px;height:300px;padding:10px 20px"
        closed="true" buttons="#dlg-buttons" data-options="modal:true">
    <form id="fm" method="post">
    	<table>
    		<tr>
    			<td class="labelTd">姓名：</td>
    			<td><input name="name" class="easyui-validatebox" required="true"></td>
    		</tr>
    		<tr>
    			<td class="labelTd">电话：</td>
    			<td><input name="mobile" class="easyui-validatebox" required="true"></td>
    		</tr>
    		<tr>
    			<td class="labelTd">岗位：</td>
    			<td><input name="position" class="easyui-validatebox" required="true"></td>
    		</tr>
    		<tr>
    			<td class="labelTd">用户名：</td>
    			<td><input id="username" name="username" class="easyui-validatebox" required="true"></td>
    		</tr>
    		<tr>
    			<td class="labelTd">分部名称：</td>
    			<td><input name="partdepartname" class="easyui-validatebox" required="true"/></td>
    		</tr>
    		<tr>
    			<td class="labelTd">配送中心：</td>
    			<td>
    				<input id="platformId" name="platformid" required="true" style="width: 153px;">
    				<!-- <select id="platformId" name="platformid" class="easyui-combobox" required="true" style="width: 153px;">
    				</select> -->
    			</td>
    		</tr>
    	</table>
    </form>
</div>
<div id="dlg-buttons">
    <a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveUser()">保存</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
</div>

<div id="edlg" class="easyui-dialog" style="width:400px;height:300px;padding:10px 20px"
        closed="true" buttons="#edlg-buttons" data-options="modal:true">
    <form id="efm" method="post">
        <input type="hidden" id="id" name="id" value=""/>
    	<table>
    		<tr>
    			<td class="labelTd">姓名：</td>
    			<td><input name="name" class="easyui-validatebox"  readonly="readonly"></td>
    		</tr>
    		<tr>
    			<td class="labelTd">电话：</td>
    			<td><input name="mobile" class="easyui-validatebox" required="true"></td>
    		</tr>
    		<!-- <tr>
    			<td class="labelTd">岗位：</td>
    			<td><input name="position" class="easyui-validatebox" required="true"></td>
    		</tr> -->
    		<tr>
    			<td class="labelTd">用户名：</td>
    			<td><input id="eusername" name="username" class="easyui-validatebox" readonly="readonly"></td>
    		</tr>
    		<!-- <tr>
    			<td class="labelTd">分部名称：</td>
    			<td><input name="partdepartname" class="easyui-validatebox" required="true"/></td>
    		</tr>
    		<tr>
    			<td class="labelTd">配送中心：</td>
    			<td>
    				<input id="eplatformId" name="platformid" required="true" style="width: 153px;">
    				<select id="platformId" name="platformid" class="easyui-combobox" required="true" style="width: 153px;">
    					<option value="p001">1</option>
    				</select>
    			</td>
    		</tr> -->
    	</table>
    </form>
</div>
<div id="edlg-buttons">
    <a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="updatePhone()">保存</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#edlg').dialog('close')">取消</a>
</div>

<div id="mdlg" class="easyui-dialog" style="width:400px;height:300px;padding:10px 20px"
        closed="true" buttons="#mdlg-buttons" data-options="modal:true">
    <form id="mfm" method="post">
        <input type="hidden" id="id" name="id" value=""/>
        <input type="hidden" id="mobile" name="mobile" value=""/>
    	<table>
    		<tr>
    			<td class="labelTd">姓名：</td>
    			<td><input id="name" disabled="disabled" class="easyui-validatebox" required="true"></td>
    		</tr>
    		<tr>
    			<td class="labelTd">用户名：</td>
    			<td><input id="eusername" disabled="disabled" class="easyui-validatebox" required="true"></td>
    		</tr>
    		<tr>
    			<td class="labelTd">密码：</td>
    			<td><input type="password" name="password" class="easyui-validatebox" required="true"/></td>
    		</tr>
    	</table>
    </form>
</div>
<div id="mdlg-buttons">
    <a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="updateUserPassword()">保存</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#mdlg').dialog('close')">取消</a>
</div>

</body>
</html>