<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../inc/header.jsp"%>
<%@ include file="../../inc/resource.inc"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>设备管理</title>
<script type="text/javascript">
    function searchBtn() {
        $('#deviceManageList').datagrid('load');
    };

    function startBtn() {
        var phoneArr = [];
        var selectRows = $("#deviceManageList").datagrid('getChecked');
        if (selectRows.length == 0) {
            $.messager.alert('提示', '请选择您要修改的行!', 'info');
        } else {
            for (var i = 0; i < selectRows.length; i++) {
                var item = selectRows[i];
                phoneArr.push(item.phone);
            }
            var option = {
                phones : phoneArr.join(","),
                status : 1
            };
            $.messager.confirm('确认', '您确认启用选中的 ' + selectRows.length + ' 台设备吗？', function(r) {
                if (r) {
                  $.post(ctx + "/shDeviceManage/updateDeviceStatus", option, function(data) {
                      data = $.parseJSON(data);
                      if (data.result == "success") {
                          phoneArr = [];
                          $('#deviceManageList').datagrid("reload");
                          $.messager.show({
                              title : '提示',
                              msg : '设备状态更新成功!',
                              timeout : 3000,
                              showType : 'slide'
                          });
                      } else {
                          phoneArr = [];
                          $('#deviceManageList').datagrid("reload");
                          $.messager.show({
                              title : '提示',
                              msg : '设备状态更新失败!',
                              timeout : 3000,
                              showType : 'slide'
                          });
                      }
                  });
                }});
        }
    };

   function stopBtn() {
        var phoneArr = [];
        var selectRows = $("#deviceManageList").datagrid('getChecked');
        if (selectRows.length == 0) {
            $.messager.alert('提示', '请选择您要修改的行!', 'info');
        } else {
            for (var i = 0; i < selectRows.length; i++) {
                var item = selectRows[i];
                phoneArr.push(item.phone);
            }
            var option = {
                phones : phoneArr.join(","),
                status : 0
            };
            $.messager.confirm('确认', '您确认禁用选中的 ' + selectRows.length + ' 台设备吗？', function(r) {
                if (r) {
                  $.post(ctx + "/shDeviceManage/updateDeviceStatus", option, function(data) {
                      data = $.parseJSON(data);
                      if (data.result == "success") {
                          phoneArr = [];
                          $('#deviceManageList').datagrid("reload");
                          $.messager.show({
                              title : '提示',
                              msg : '设备状态更新成功!',
                              timeout : 3000,
                              showType : 'slide'
                          });
                      } else {
                          phoneArr = [];
                          $('#deviceManageList').datagrid("reload");
                          $.messager.show({
                              title : '提示',
                              msg : '设备状态更新失败!',
                              timeout : 3000,
                              showType : 'slide'
                          });
                      }
                  });
                }});
        }
    };
    function resetSn() {
        var phoneArr = [];
        var selectRows = $("#deviceManageList").datagrid('getChecked');
        if (selectRows.length == 0) {
            $.messager.alert('提示', '请选择您要修改的行!', 'info');
        } else {
            for (var i = 0; i < selectRows.length; i++) {
                var item = selectRows[i];
                phoneArr.push(item.phone);
            }
            var option = {phones : phoneArr.join(",")};
            $.messager.confirm('确认', '您确认清空选中的 ' + selectRows.length + ' 条sn号吗？', function(r) {
                if (r) {
                    $.post(ctx + "/shDeviceManage/resetSn", option, function(data) {
                            data = $.parseJSON(data);
                            if (data.result == "success") {
                                phoneArr = [];
                                $('#deviceManageList').datagrid("reload");
                                $.messager.show({
                                    title : '提示',
                                    msg : '重置sn号成功!',
                                    timeout : 3000,
                                    showType : 'slide'
                                });
                            } else {
                                phoneArr = [];
                                $('#deviceManageList').datagrid("reload");
                                $.messager.show({
                                    title : '提示',
                                    msg : '重置sn号失败!',
                                    timeout : 3000,
                                    showType : 'slide'
                                });
                            }
                    });
                }
            });
        }
        
    };
    var dataGrid;
    $(function() {
        $("#deviceManageList").datagrid({
            title : "设备列表",
            toolbar : "#tb",
            height : document.documentElement.clientHeight * 0.98,
            url : ctx + '/shDeviceManage/getShDevicePageList',
            striped : true,
            idField : 'user_id',
            pagination : true,
            pageSize : 20,
            rownumbers : true,
            fitColumns : true,
            columns : [ [ {
                checkbox : true
            }, {
                field : 'phone',
                title : '手机号',
                align : 'center',
                width : 100,
                styler : function(value, row, index) {
                    return 'font-size:12px;';
                }
            }, {
                field : 'sn_no',
                title : 'SN号',
                align : 'center',
                width : 120,
                styler : function(value, row, index) {
                    return 'font-size:12px;';
                }
            }, {
                field : 'client_version',
                title : '客户端版本',
                align : 'center',
                width : 100,
                styler : function(value, row, index) {
                    return 'font-size:12px;';
                }
            }, {
                field : 'osInfo',
                title : '操作系统信息',
                align : 'center',
                width : 100,
                styler : function(value, row, index) {
                    return 'font-size:12px;';
                }
            }, {
                field : 'device_info',
                title : '设备信息',
                align : 'center',
                width : 100,
                styler : function(value, row, index) {
                    return 'font-size:12px;';
                }
            }, {
                field : 'access_token',
                title : 'token值',
                align : 'center',
                width : 120,
                styler : function(value, row, index) {
                    return 'font-size:12px;';
                }
            }, {
                field : 'baidu_id',
                title : 'Baidu ID值',
                align : 'center',
                width : 120,
                styler : function(value, row, index) {
                    return 'font-size:12px;';
                }
            }, {
                field : 'is_root',
                title : '是否root',
                align : 'center',
                width : 120,
                styler : function(value, row, index) {
                    return 'font-size:12px;';
                }
            }, {
                field : 'is_double',
                title : '是否双卡',
                align : 'center',
                width : 120,
                styler : function(value, row, index) {
                    return 'font-size:12px;';
                }
            }, {
                field : 'status',
                title : '状态',
                align : 'center',
                width : 120,
                styler : function(value, row, index) {
                    return 'font-size:12px;';
                }
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
</script>
<style type="text/css">
.align-right {
	text-align: right;
}
</style>
</head>
<body>

  <table id="deviceManageList" toolbar="#tb"></table>

  <div id="tb" style="height: auto">
    <form id="searchForm">
      <table>
          <tr>
            <td>手机号：</td>
            <td><input id="phone" name="phone" placeholder="请输入手机号" class="easyui-validatebox" /></td>
            <td>客户端版本：</td>
            <td><input id="clientVersion" name="clientVersion"  placeholder="请输入客户端版本" class="easyui-validatebox" /></td>
          </tr>
          <tr>
            <td>操作系统信息：</td>
            <td><input id="osInfo" name="osInfo" placeholder="请输入操作系统信息"  class="easyui-validatebox" /></td>
            <td>设备信息：</td>
            <td><input id="deviceInfo" name="deviceInfo"  placeholder="请输入设备信息" class="easyui-validatebox" /></td>
          </tr>
          <tr>
            <td>状态：</td>
            <td colspan="2"><input name="status" placeholder="请选择状态" editable="false" class="easyui-combobox"
              data-options="url:'${ctx}/code/getCombobox/device_status'" /></td>
            <td>
               <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" id="searchBtn" onclick="searchBtn();">查询</a>
               <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" id="startBtn" onclick="startBtn();">启用</a> 
               <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true"id="stopBtn" onclick="stopBtn();">停用</a>
               <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" id="resetSn" onclick="resetSn();">重置sn号</a></td>
          </tr>
      </table>
    </form>
  </div>
</body>
</html>