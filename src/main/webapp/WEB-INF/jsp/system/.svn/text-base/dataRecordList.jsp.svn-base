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
        $('#dataRecordList').datagrid('load');
    };
    var dataGrid;
    $(function() {
        $("#dataRecordList").datagrid({
            title : "系统消息日志",
            toolbar : "#tb",
            height : document.documentElement.clientHeight * 0.98,
            url : ctx + '/log/findMessageLogPageList',
            striped : true,
            idField : 'id',
            pagination : true,
            pageSize : 20,
            rownumbers : true,
            fitColumns : false,
            columns : [ [ {
                field : 'id',
                title : 'ID',
                width : 80,
                hidden : true,
                fitColumns : true
            }, {
                field : 'xml_content',
                title : '报文原始内容',
                width : 100,
                formatter : function(value) {
                    value = value.replace(new RegExp("<", "ig"), "&lt;");
                    value = value.replace(new RegExp(">", "ig"), "&gt;");
                    var xmlContent = value;
                    var a = "<a href='javascript:void(0);' onclick='showXml(this);' xml='" + xmlContent + "'>查看报文</a>";
                    return a;
                }
            }, {
                field : 'interface_type',
                title : '接口类型',
                width : 100
            }, {
                field : 'sender',
                title : '发送方',
                width : 100
            }, {
                field : 'receiver',
                title : '接收方',
                width : 100

            }, {
                field : 'result_content',
                title : '处理结果',
                width : 100
            }, {
                field : 'create_time',
                title : '时间',
                width : 200
            } ] ],
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
    function showXml(ele){
        var ae = $(ele);
        var xml = ae.attr("xml");
        xml = xml.replace(new RegExp("<","ig"), "&lt;");
        xml = xml.replace(new RegExp(">","ig"), "&gt;");
        xml = xml.replace(new RegExp(" ","ig"), "");
        xml = xml.replace(new RegExp("\\t+","ig"), "\n");
        
        xml = "<pre>" + xml + "</pre>";
        $("#xmlposition").html(xml);
        $('#dlg').dialog({buttons: [{ 
            text: '确定', 
            iconCls: 'icon-ok', 
            handler: function() { 
                $("#dlg").dialog('close');
            }},]
        });
        $('#dlg').dialog("open").dialog('setTitle','报文原始内容');
    }
</script>
</head>
<body>

  <table id="dataRecordList"></table>

  <div id="tb" style="height: auto">
    <form id="searchForm">
      <table>
        <tr>
          <td>接口类型：</td>
          <td><input id="interface" name="interfaceType" placeholder="请选择接口类型" editable="false"
            class="easyui-combobox" data-options="url:'${ctx}/code/getCombobox/interface_type'"></td>
          <td>处理结果：</td>
          <td><input id="resultContent" name="resultContent" placeholder="请选择处理结束" editable="false"
            class="easyui-combobox" data-options="url:'${ctx}/code/getCombobox/result_content'"></td>
          <td>发送方：</td>
          <td><input id="sender" name="sender" placeholder="请选择发送方" editable="false"
            class="easyui-combobox" data-options="url:'${ctx}/code/getCombobox/sender'"></td>
          <td>接收方：</td>
          <td><input id="receiver" name="receiver" placeholder="请选择接收方" editable="false"
            class="easyui-combobox" data-options="url:'${ctx}/code/getCombobox/receiver'"></td>
          <td><a href="javascript:void(0);" class="easyui-linkbutton"
            data-options="iconCls:'icon-search',plain:true" onclick="searchBtn();" id="searchData">查询</a></td>
      </table>
    </form>
  </div>

  <div id="dlg" closed="true" class="easyui-dialog" style="width: 800px; height: 500px; padding:10px"
    data-options="modal:true,resizable:true">
    <div id="xmlposition" class="code" style="overflow: auto;"></div>
  </div>

</body>
</html>