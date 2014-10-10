<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../inc/header.jsp"%>
<%@ include file="../../inc/resource.inc"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script type="text/javascript">
    var dataGrid;
    $(function() {
        dataGrid = $('#dataGrid').datagrid(
                {
                    title : '安裝工信息列表',
                    url : "${ctx}/worker/getWorkerPageList",
                    height : document.documentElement.clientHeight * 0.98,
                    striped : true,
                    idField : 'worker_id',
                    pagination : true,
                    pageSize : 20,
                    rownumbers : true,
                    fitColumns : true,
                    columns : [ [
                            {
                                field : 'worker_id',
                                title : 'id',
                                width : 100,
                                hidden : true
                            },
                            {
                                field : 'website_code',
                                title : '网点编码',
                                width : 100
                            },
                            {
                                field : 'worker_code',
                                title : '人员代码',
                                width : 100
                            },
                            {
                                field : 'worker_name',
                                title : '人员名称',
                                width : 100
                            },
                            {
                                field : 'phone',
                                title : '联系电话',
                                width : 100
                            },
                            {
                                field : 'worker_type',
                                title : '人员类型',
                                width : 100
                            },
                            {
                                field : 'logout_flag',
                                title : '注销标记',
                                width : 100
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

</script>
</head>
<body class="easyui-layout" style="padding: 10px">
    <table id="dataGrid" toolbar="#tb"></table>
    <div id="tb" style="height: auto">
        <form id="searchForm">
            <table>
                <tr>
                    <td>网点编码：</td>
                    <td><input name="websiteCode" type="text" placeholder="请输入网点编码" class="easyui-validatebox" /></td>
                    <td>人员代码：</td>
                    <td><input name="workerCode" type="text" placeholder="请输入人员代码" class="easyui-validatebox" /></td>
                    <td>人员名称：</td>
                    <td><input name="workerName" type="text" placeholder="请输入人员名称" class="easyui-validatebox" /></td>
                </tr>
                <tr>
                    <td>联系电话：</td>
                    <td><input name="phone" type="text" placeholder="请输入联系电话" class="easyui-validatebox" /></td>
                    <td>人员类型：</td>
                    <td><input name="workerType" type="text" placeholder="请输入人员类型" class="easyui-validatebox" /></td>
                    <td>注销标记：</td>
                    <td><input name="logoutFlag" placeholder="请选择注销标记" editable="false" class="easyui-combobox" data-options="url:'${ctx}/code/getCombobox/worker_logout'" /></td>
                    <td><a href="javascript:void(0);" class="easyui-linkbutton"
                        data-options="iconCls:'icon-search',plain:true" onclick="searchs();">查询</a></td>
                </tr>
                <tr>
                    
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
