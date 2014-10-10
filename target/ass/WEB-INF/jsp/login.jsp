<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="inc/header.jsp"%>
<%@ include file="inc/resource.inc"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>电器售后系统</title>
<link rel="stylesheet" type="text/css" href="css/backstagelogin.css">
</head>

<body scroll="no" style="overflow-y: hidden">
	<div style="background-image: url(images/user/background.jpg)" class="pagebg"></div>
	<div class="loginbtn">
		<a></a>
	</div>
	<div class="login" style="display: none;">
		<div class="logindiv">
			<form id="baseForm" name="baseForm" method="post">
				<input type="hidden" name="indexRandomCode" class="textbox" value="3456"></input>
				<input type="hidden" name="needRandomCode" class="textbox" value="0"></input>
				<div class="loginbox">
					<ul>
                        <li>
                            <select id="fromType" name="fromType" style="width:300px;height:40px;" editable="false" class="easyui-combobox" >
                                <option value="emp" selected>国美用户</option>
                                <option value="jl">第三方网点账户</option>
                            </select>
                        </li>
						<li><input id="account" name="account" type="text" class="inputbox inputTxtByName" placeholder="用户名" /></li>
						<li><input id="password" name="password" type="password" class="inputbox inputTxtByPwd" placeholder="密码" /></li>
						<li><input type="button" value="立即登录" class="loginsubmit" onclick="loginSubmit();" /></li>
					</ul>
				</div>
			</form>
		</div>
	</div>

	<div class="footer">
		<label>国美电器股份有限公司</label>
	</div>
	
	<div style="display: none; height: 0px;">
		<a id="baseHref" href="" target="hiddenFrame"></a>
		<iframe name="hiddenFrame" id="hiddenFrame" style="display: none;"/></iframe>
	</div>
</body>



<script type="text/javascript">
    var animation = {//动画部分 从jQuery剥离
        "swing": function (p) {
            return 0.5 - Math.cos(p * Math.PI) / 2;
        },
        "chang": 200,
        "rate": 25
    };
    
    var flag = 1;
   
    
    $(".login").bind("click", function (event) {
        if (window.event) {
            window.event.cancelBubble = true;
        } else {
            event.stopPropagation();
        }
    });
    $(".loginbtn").bind("click", function (event) {
    	if (flag == -1)$(".pagebg").click();
    	
        if (flag == 1) {
            flag = 0;
            if (window.event) {
                window.event.cancelBubble = true;
            } else {
                event.stopPropagation();
            }
            event.stopPropagation();
            var _conts = 141;
            var h = $(this).height();
            var t = $(this).position().top;
            var ml = $(this).css("margin-top").replace("px", "") * 1;
            var _logTop = t + ml + h + 60;
            $(".login").css("top", _logTop);
            var _logHeight = $(window).height() - _logTop + _conts;
            $(".login").height(0);
            $(".login").css("display", "");
            $(".login").css("overflow", "hidden");
            var end = animation.chang;
            var start = 0;
            var cur = 0;
            var step = animation.rate;
            var timer = setInterval(function () {
                cur += step;
                var ant = animation.swing(cur / (end - start)) * _conts;
                var anh = animation.swing(cur / (end - start)) * _logHeight;
                var __top = t - ant;
                var __logTop = _logTop - ant;
                $(".loginbtn").css("top", __top + "px");
                $(".login").css("top", __logTop + "px");
                $(".login").height(anh);
                if (cur == end) {
                    clearInterval(timer);
                    $(".login").css("overflow", "");
                    $(".login").css("top", "");
                    flag = -1;
                }
            }, step);
        }
    });
    
    $(function() {
		$(".combo-text").css("width","266px");
		$(".combo").css("width","300px");
	});
    
    function loginSubmit(){
    	$.post("${ctx}/login",$('#baseForm').serialize(),
		function(msg){
    		if($.parseJSON(msg).flag == "loginIdNull"){
                $.messager.alert('提示:','用户名为空!');
            }else if($.parseJSON(msg).flag == "loginPwdNull"){
                $.messager.alert('提示:','密码为空!');
            }else if($.parseJSON(msg).flag == "accountNull"){
                $.messager.alert('提示:','账号不存在!');
            }else if($.parseJSON(msg).flag == "loginPwdError"){
                $.messager.alert('提示:','密码输入错误!');
            }else if($.parseJSON(msg).flag == "success"){
                window.location.href="${ctx}/index";
            }
		});
	}
 	
  	if(window.top != window) {
		if(window.top.opener){
			window.top.opener.document.location.href = window.location.href; 
		}else{
			window.top.location = window.location;
		}
	}
  
   	document.onkeydown = function(evt){
	var evt = window.event?window.event:evt;
   	  	if (evt.keyCode==13) {
           loginSubmit();
   	  	}
   	};
   	
   	$(".pagebg").bind("click", function () {
    	if (flag == -1) {
            flag = 0;
            var _conts = 141;
            var h = $(".loginbtn").height();
            var t = $(".loginbtn").position().top;
            var ml = $(".loginbtn").css("margin-top").replace("px", "") * 1;
            var _logTop = t + ml + h + 60;
            $(".login").css("top", _logTop);
            var _logHeight = $(".login").height();
            $(".login").css("display", "");
            $(".login").css("overflow", "hidden");
            var end = animation.chang;
            var start = 0;
            var cur = 0;
            var step = animation.rate;
            var timer = setInterval(function () {
                cur += step;
                var ant = animation.swing(cur / (end - start)) * _conts;
                var anh = animation.swing(cur / (end - start)) * _logHeight;
                var __top = t + ant;
                var __logTop = _logTop + ant;
                $(".loginbtn").css("top", __top + "px");
                $(".login").css("top", __logTop + "px");
                $(".login").height(_logHeight - anh);
                if (cur == end) {
                    clearInterval(timer);
                    $(".login").css("height", "");
                    $(".login").css("display", "none");
                    $(".login").css("overflow", "");
                    $(".login").css("top", "");
                    flag = 1;
                }
            }, step);
    	}
  	});
</script>
</html>