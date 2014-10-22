<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="inc/header.jsp"%>
<%@ include file="inc/resource.inc"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>电器售后系统</title>
<style type="text/css">
* {
	font-size: 20px;
}

#header-inner {
	text-align: left;
	margin: 0 auto;
	padding: 10px 0;
}

#topmenu {
	text-align: right;
}

#topmenu a {
	display: inline-block;
	padding: 1px 3px;
	text-decoration: none;
	color: #fff;
}

#topmenu a:hover {
	text-decoration: underline;
}

html {
	height: 100%
}

body {
	height: 100%;
	margin: 0px;
	padding: 0px
}
</style>
</head>
<body class="easyui-layout" style="text-align: left">
	<div region="north" border="false"
		style="background: #666; text-align: center">
		<div id="header-inner">
			<table cellpadding="0" cellspacing="0" style="width: 100%;">
				<tr>
					<td rowspan="2" style="width: 20px;"></td>
					<td style="height: 60px;" rowspan="2">
						<div style="color: #fff; font-size: 22px; font-weight: bold;">
							<a href="javascript:void();"
								style="color: #fff; font-size: 22px; font-weight: bold; text-decoration: none">电器售后系统 V1.0.1</a>
						</div>
					</td>
					<td
						style="padding-right: 5px; text-align: right; vertical-align: bottom;">
						<div id="topmenu">
							<span>${user.name }</span>
							<button onclick="$('#newPwdWin').window('open');" style="font-size: 12px;">修改密码</button>
							<button onclick="logout()" style="font-size: 12px;">注销</button>
						</div>
					</td>
				</tr>
			</table>
		</div>

	</div>

	<div data-options="region:'south',split:false" style="height: 25px;"></div>

	<div region="west" split="false" title="导航菜单"
		style="width: 250px; ">

		<div class="easyui-accordion" id="left_nav" fit="false" border="false" style="height:420px;">
		</div>

	</div>
	<div region="center">
		<div id="tabs" class="easyui-tabs" fit="true" border="false"
			plain="true">
			<div title="welcome" style="padding: 10px;font-size: 20px">
				欢迎使用电器售后系统
			</div>
		</div>
	</div>

	<div id="mm" class="easyui-menu" style="width:150px;">
		<div id="tabupdate">刷新</div>
		<div class="menu-sep"></div>
		<div id="close">关闭</div>
		<div id="closeall">全部关闭</div>
		<div id="closeother">除此之外全部关闭</div>
		<div class="menu-sep"></div>
		<div id="closeright">当前页右侧全部关闭</div>
		<div id="closeleft">当前页左侧全部关闭</div>
		<div class="menu-sep"></div>
		<div id="exit">退出</div>
	</div>
	
	<div id="newPwdWin" class="easyui-window" title="修改密码" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:500px;height:300px;padding:10px;font-size: 16px;">
	    	<table cellpadding="5">
	    		<tr>
	    			<td>用户名:</td>
	    			<td><input class="easyui-validatebox textbox" type="text" name="name" value="${user.name }" readonly="readonly"></input></td>
	    		</tr>
	    		<tr>
	    			<td>原密码<span style="color:red">(*)</span>:</td>
	    			<td><input class="easyui-validatebox textbox" type="password" name="oldPwd" ></input></td>
	    		</tr>
	    		<tr>
	    			<td>新密码<span style="color:red">(*)</span>:</td>
	    			<td><input class="easyui-validatebox textbox" type="password" name="newPwd" ></input></td>
	    		</tr>
	    		<tr>
	    			<td>新密码确认<span style="color:red">(*)</span>:</td>
	    			<td><input class="easyui-validatebox textbox" type="password" name="newPwd" ></input></td>
	    		</tr>
	    	</table>
	    	
	    		<div style="text-align:center;padding:5px">
			    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">确认</a>
			    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#newPwdWin').window('close')">取消</a>
	   			</div>
	</div>

</body>

<script type="text/javascript">

	var onlyOpenTitle="welcome";

	window.onload = function() {
		showProgressing();
		$.ajax({
            type: "POST",
            url:ctx+"/menu/getMenuTree",
			async : true,
			error : function(request) {
				closeProgressing();
				alert("发送请求错误!");
			},
			success : function(rows) {
				
				rows = convert(rows);
				InitLeftMenu(rows);
			}
		});
	};
	
	
	
	var resources;
	function InitLeftMenu(menuStr) {
		
		resources = menuStr;
		
		$('#left_nav').empty();
		
	    $.each(resources, function(i, n) {
	    	
	    	var menulist="";
	       
			menulist += '<ul id="left_nav_tree_'+n.id+'" class="easyui-tree" style="margin-top:3px;">';
	        
	        menulist += '</ul>';
	        
	        $('#left_nav').accordion('add', {
	            title: n.text,
	            content: menulist,
				border:false,
				selected:true,
	            iconCls: n.icon
       		 });
       		 
       		 $('#left_nav_tree_'+n.id).tree();
	        
	    });
		 setTimeout('addMenuTree()',500);
	    
	}
	
	
	function logout(){
		window.location.href="${ctx}/logout";
	}
	
	function  alterPwd(){
		$('#newPwdWin').window('open');
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
				showProgressing();
				$.ajax({
		            type: "POST",
		            data : {
		            	name:$("input[name='name']").eq(0).val(),
		            	oldPwd:$("input[name='oldPwd']").eq(0).val(),
		            	newPwd:$("input[name='newPwd']").eq(0).val()
		            },
		            url:ctx+"/alterPwd",
					error : function(request) {
						closeProgressing();
						$.messager.alert('消息提示',"发送请求错误!",'error');
					},
					success : function(msg) {
						closeProgressing();
						if ($.parseJSON(msg).flag == "oldPwdNull") {
		                    $.messager.alert('提示:', '旧密码为空!');
		                } else if ($.parseJSON(msg).flag == "newPwdNull") {
                            $.messager.alert('提示:', '新密码为空!');
                        } else if ($.parseJSON(msg).flag == "accountNull") {
		                    $.messager.alert('提示:', '账号不存在!');
		                } else if ($.parseJSON(msg).flag == "oldPwdError") {
		                    $.messager.alert('提示:', '旧密码错误!');
		                } else if ($.parseJSON(msg).flag == "success") {
		                    $('#newPwdWin').window('close');
		                    window.location.href = "${ctx}/logout";
		                }
					}
				});
			};
	      };

	}

	
function addMenuTree(){
		
		$.each(resources, function(i, n) {
				
			   	$('#left_nav_tree_'+n.id).tree();
	       		 $('#left_nav_tree_'+n.id).tree({
						data: n.children,
						onClick : function(node) {
							
							var arr = node.children;
							if (arr == undefined) {
								var attrs = node.attributes;
								var menu = node.text;
								if ($('#tabs').tabs('exists', menu)) {
									$('#tabs').tabs('select', menu);
								} else {
									$('#tabs').tabs('add', {
										title : menu,
										content:"<iframe  scrolling='no' frameborder='0' src='"+attrs.url+"' style='width: 100%; height: 100%; overflow: hidden;'></iframe>",
										closable : true
									});
									tabClose();
								}
							}
							
						}
				});
			
		});
		
		$('#left_nav').accordion('select',0);
		tabClose();
		tabCloseEven();
		
		closeProgressing();
	
	}
	
function tabClose()
{
	/*双击关闭TAB选项卡*/
	$(".tabs-inner").dblclick(function(){
		var subtitle = $(this).children(".tabs-closable").text();
		$('#tabs').tabs('close',subtitle);
	});
	/*为选项卡绑定右键*/
	$(".tabs-inner").bind('contextmenu',function(e){
		
		$('#mm').menu('show', {
			left: e.pageX,
			top: e.pageY
		});

		var subtitle =$(this).children(".tabs-closable").text();

		$('#mm').data("currtab",subtitle);
		$('#tabs').tabs('select',subtitle);
		return false;
	});
}



//绑定右键菜单事件
function tabCloseEven() {

    $('#mm').menu({
        onClick: function (item) {
            closeTab(item.id);
        }
    });

    return false;
}

function closeTab(action)
{
    var alltabs = $('#tabs').tabs('tabs');
    var currentTab =$('#tabs').tabs('getSelected');
	var allTabtitle = [];
	$.each(alltabs,function(i,n){
		allTabtitle.push($(n).panel('options').title);
	});

	
    switch (action) {
        case "tabupdate":
            var iframe = $(currentTab.panel('options').content);
            var src = iframe.attr('src');
            $('#tabs').tabs('update', {
                tab: currentTab,
                options: {
                    content: "<iframe  scrolling='no' frameborder='0' src='"+src+"' style='width: 100%; height: 100%; overflow: hidden;'></iframe>"
                }
            });
            break;
        case "close":
            var currtab_title = currentTab.panel('options').title;
            $('#tabs').tabs('close', currtab_title);
            break;
        case "closeall":
            $.each(allTabtitle, function (i, n) {
                if (n != onlyOpenTitle){
                    $('#tabs').tabs('close', n);
				}
            });
            break;
        case "closeother":
            var currtab_title = currentTab.panel('options').title;
            $.each(allTabtitle, function (i, n) {
                if (n != currtab_title && n != onlyOpenTitle)
				{
                    $('#tabs').tabs('close', n);
				}
            });
            break;
        case "closeright":
            var tabIndex = $('#tabs').tabs('getTabIndex', currentTab);

            if (tabIndex == alltabs.length - 1){
                return false;
            }
            $.each(allTabtitle, function (i, n) {
                if (i > tabIndex) {
                    if (n != onlyOpenTitle){
                        $('#tabs').tabs('close', n);
					}
                }
            });

            break;
        case "closeleft":
            var tabIndex = $('#tabs').tabs('getTabIndex', currentTab);
            if (tabIndex == 1) {
                return false;
            }
            $.each(allTabtitle, function (i, n) {
                if (i < tabIndex) {
                    if (n != onlyOpenTitle){
                        $('#tabs').tabs('close', n);
					}
                }
            });

            break;
        case "exit":
            $('#closeMenu').menu('hide');
            break;
    }
}
	
	

	function convert(rows) {
		rows = jQuery.parseJSON(rows);
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
				if (row.parentId == node.id) {
					if (row.menuUrl) {
						var child = {
							id : row.menuId,
							text : row.menuName,
							attributes : {
								url : ctx + row.menuUrl
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
	}
	
 	function showProgressing(){
		
		$.messager.progress({
			title:'请稍候',
			msg:'数据加载...',
			text: '加载中.......' ,
			interval:100,
			closed:false
		});
			
	}
 	
 	function closeProgressing(){
		$.messager.progress('close');
	}
</script>
</html>