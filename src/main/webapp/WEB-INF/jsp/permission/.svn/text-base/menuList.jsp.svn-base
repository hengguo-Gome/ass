<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>
<%@ include file="../inc/resource.inc"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统消息日志</title>
<script type="text/javascript">
    function searchBtn() {
        $('#menuList').datagrid('load');
    };
    var dataGrid;
    $(function() {
        $("#menuList").datagrid({
            title : "系统菜单管理",
            toolbar : "#tb",
            height : document.documentElement.clientHeight * 0.98,
            url : ctx + '/menu/selectMenuPageList',
            striped : true,
            idField : 'menuId',
            pagination : true,
            pageSize : 20,
            rownumbers : true,
            fitColumns : false,
            columns : [ [ {
                field : 'menuId',
                title : '菜单编号',
                width : 80,
                fitColumns : true
            }, {
                field : 'menuName',
                title : '菜单名称',
                width : 150
            }, {
                field : 'menuUrl',
                title : '菜单地址',
                width : 300,
                align:'left'
            }, {
                field : 'parentId',
                title : '父菜单编号',
                width : 80

            }, {
                field : 'parentName',
                title : '父菜单名称',
                width : 100
            }] ],
            loadMsg : "数据加载中...",
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
</script>
</head>
<body>

  <table id="menuList"></table>

  <div id="tb" style="height: auto">
    <form id="searchForm">
      <table>
        <tr>
          <td>菜单编号：</td>
          <td><input id="menuId" name="menuId" placeholder="请输入菜单编号" class="easyui-validatebox"></td>
          <td>菜单名称：</td>
          <td><input id="menuName" name="menuName" placeholder="请输入菜单名称" class="easyui-validatebox"></td>
          
          <td><a href="javascript:void(0);" class="easyui-linkbutton"
            data-options="iconCls:'icon-search',plain:true" onclick="searchBtn();">查询</a></td>
      </table>
    </form>
  </div>

  <div id="dlg" closed="true" class="easyui-dialog" style="width: 800px; height: 500px; padding:10px"
    data-options="modal:true,resizable:true">
    <div id="xmlposition" class="code" style="overflow: auto;"></div>
  </div>

</body>
</html>