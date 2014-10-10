<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>
<%@ include file="../inc/resource.inc"%>
<script type="text/javascript">
    
    function submitForm(){
        if(validate()){
            $.post(
            "${ctx}/person/personUpdate",
            $("#form").serialize(),
            function(returnObj){
                if(returnObj.flag="success"){
                    $.messager.alert('提示:','修改成功!');
                    window.location.href="${ctx}/person/personListView";
                }else{
                    $.messager.alert('提示:','修改失败!');
                }   
            });
        }
    };
    function validate(){
        if($("#name").val()=="") {alert("姓名！");return false;}
        if($('#age').val()=="") {alert("请输入年龄");return false;}
        if($("#address").val()=="") {alert("请输入地址！");return false;}
        return true;
    };
    
    function goBack(){
            window.location.href="${ctx}/person/personListView";
    };
</script>
<div class="easyui-panel" title="修改人员信息" style="width:auto">
    <div style="padding:10px 0 10px 60px">
        <form id="form" method="post">
            <table class="table table-hover table-condensed" width="100%;">
            <td><input name="id" type="hidden" value="${person.id}"></td>
                <tr>         
                    <td width="10%">姓名:</td>
                    <td width="15%"><input name="name" id="name" type="text" placeholder="请输入姓名" class="easyui-textbox" value="${person.name}"  data-options="required:true"></td>
                    <td width="10%">年龄:</td>
                    <td width="15%"><input name="age" id="age" type="text" placeholder="请输入年龄" class="easyui-textbox" value="${person.age}"  data-options="required:true"></td> 
                    <td width="10%">地址:</td>
                    <td width="15%"><input name="address" id="address" type="text" placeholder="请输入地址" class="easyui-textbox" value="${person.address}" data-options="required:true"></td>
                </tr>
            </table>
        </form>
    </div>
    <div style="text-align:center;padding:5px">
            <a href="#" class="easyui-linkbutton"  onclick="submitForm();">保存</a>
            <a href="#" class="easyui-linkbutton"  onclick="goBack();">返回</a>
    </div>
</div>