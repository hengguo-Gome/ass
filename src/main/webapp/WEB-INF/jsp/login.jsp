<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="inc/header.jsp"%>
<%@ include file="inc/resource.inc"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>电器售后系统</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/backstagelogin.css">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/login/fun.base.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/login/script.js"></script>
<link>
</head>
<body>
	<!--http://www.lanoss.com/login.html-->
	<div class="login">
		<div class="box png">
			<div class="logo png">
				<font style="font-size: 250%; font-weight: bold">售后App系统</font>
			</div>
			<div class="input">
				<div class="log">
					<form id="loginForm" name="loginForm" method="post">

						<table>
							<tr>
								<td width="30%"><label>账号类型:</label></td>
								<td width="70%"><select id="fromType" name="fromType"
									editable="false" class="easyui-combobox">
										<option value="0" selected>国美用户</option>
										<option value="1">第三方网点账户</option>
										<option value="2">系统自建用户</option>
								</select></td>
							</tr>
							<tr>
								<td width="30%"><label>账&nbsp; &nbsp;号:</label></td>
								<td width="70%"><input class="name text" type="text"
									id="account" placeholder="账号 " name="account" tabindex="1"></td>
							</tr>
							<tr>
								<td width="30%"><label>密    &nbsp; &nbsp;码:</label></td>
								<td width="70%"><input class="pwd text" type="password"
									id="password" placeholder="密 码" name="password"
									tabindex="2">
							</tr>
							<tr>
								<td colspan="2"><input type="button" class="submit"
									tabindex="3" value="登录" onclick="loginSubmit();"></td>
							</tr>
						</table>

					</form>
				</div>
			</div>
		</div>
		<div class="air-balloon ab-1 png"></div>
		<div class="air-balloon ab-2 png"></div>
		<div class="footer" style="text-align: center">
			国美电器股份有限公司
		</div>
	</div>
	<div id="newPwdWin" class="easyui-window" title="首次登录，请修改原始密码" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:500px;height:300px;padding:10px;font-size: 16px;">
	    	<table cellpadding="5">
	    		<tr>
	    			<td>用户名:</td>
	    			<td><input class="easyui-validatebox textbox" id="modifyPwdName" type="text name" name="name"></input></td>
	    		</tr>
	    		<tr>
	    			<td>新密码<span style="color:red">(*)</span>:</td>
	    			<td><input class="easyui-validatebox textbox  text pwd" type="password" name="newPwd" ></input></td>
	    		</tr>
	    		<tr>
	    			<td>新密码确认<span style="color:red">(*)</span>:</td>
	    			<td><input class="easyui-validatebox textbox  text pwd" type="password" name="newPwd" ></input></td>
	    		</tr>
	    	</table>
	    	
	    		<div style="text-align:center;padding:5px">
			    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">确认</a>
			    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#newPwdWin').window('close')">取消</a>
	   			</div>
	</div>
	<script type="text/javascript">
		function loginSubmit() {
			
			$.post("${ctx}/login", $('#loginForm').serialize(), function(msg) {
				if ($.parseJSON(msg).flag == "loginIdNull") {
					$.messager.alert('提示:', '用户名为空!');
				} else if ($.parseJSON(msg).flag == "loginPwdNull") {
					$.messager.alert('提示:', '密码为空!');
				} else if ($.parseJSON(msg).flag == "accountNull") {
					$.messager.alert('提示:', '账号不存在!');
				} else if ($.parseJSON(msg).flag == "loginPwdError") {
					$.messager.alert('提示:', '密码输入错误!');
				} else if($.parseJSON(msg).flag == "needModifyPass") {
					$('#modifyPwdName').val($('#account').val());
					$('#newPwdWin').window('open');
				} else if ($.parseJSON(msg).flag == "success") {
					window.location.href = "${ctx}/index";
				}
			});
		}
		function submitForm(){
		     var flag = true;
		      $(".easyui-validatebox").each(function(i, n) {
		          if ("" == n.value) {
		              flag = false;
		          }
		      });

		      if (!flag) {
		    	  $.messager.alert('消息提示',"表单数值不能为空",'error'); 
		      } else {
		  		var arr = $("input[name='newPwd']");
				if(arr[0].value != arr[1].value){
				 	$.messager.alert('消息提示',"两次密码输入不一致",'error');
				}else{
					$.ajax({
			            type: "POST",
			            data : {
			            	name:$("input[name='name']").eq(0).val(),
			            	newPwd:$("input[name='newPwd']").eq(0).val(),
			            },
			            url:ctx+"/alterEmpInitPwd",
						error : function(request) {
							$.messager.alert('消息提示',"发送请求错误!",'error');
						},
						success : function(msg) {
							if ($.parseJSON(msg).flag == "newPwdNull") {
	                            $.messager.alert('提示:', '新密码为空!');
	                        } else if ($.parseJSON(msg).flag == "accountNull") {
			                    $.messager.alert('提示:', '账号不存在!');
			                } else if ($.parseJSON(msg).flag == "success") {
			                	$('#newPwdWin').window('close');
			                	$.messager.alert('提示:', '修改成功!');
			                }
						}
					});
				};
		      };
		}
	</script>

	<!--[if IE 6]>
<script src="js/DD_belatedPNG.js" type="text/javascript"></script>
<script>DD_belatedPNG.fix('.png')</script>
<![endif]-->

</body>
</html>