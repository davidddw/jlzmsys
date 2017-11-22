<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="keywords" content="jquery,ui,easy,easyui,web">
<meta name="description" content="easyui help you build your web page easily!">
<title>Login</title>
<link rel="shortcut icon" href="${contextPath}/images/favicon.ico" />
<link rel="stylesheet" type="text/css" href="${contextPath}/assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/assets/jquery/jquery-confirm.min.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/css/login.css">
<script type="text/javascript" src="${contextPath}/assets/easyui/jquery.min.js"></script>
<script type="text/javascript" src="${contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${contextPath}/assets/jquery/jquery.validate.min.js"></script>
<script type="text/javascript" src="${contextPath}/assets/jquery/jquery-confirm.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/extJs.js"></script>
<script type="text/javascript" src="${contextPath}/js/login.js"></script>
<script type="text/javascript">
	var basePath = "${contextPath}";
</script>
</head>
<body onkeydown="enterlogin();">
	<div class="main">
		<div class="login-box">
			<form id="login-form" method="post">
				<div class="input-box">
					<p>
						用户名： <input type="text" class="user required" name="userid" autofocus="autofocus" maxlength="20" />
					</p>
					<p>
						<span style="padding-right: 12px;">密</span>码： <input type="password" class="password required" name="password" />
					</p>
					<p>
						<input type="checkbox" name="rememberMe" value="1" class="check" /><span class="record">记住登录名</span>
					</p>
					<a href="javascript:;" class="log" onclick="submitForm()">登&nbsp;录</a>
					<a href="javascript:;" class="reset" onclick="clearForm()">重&nbsp;置</a>
				</div>
			</form>
		</div>
		<div class="text">
			<p>
				Copyright © 2013-2017 sinocom.com<br> 吉林智明社内管理システム
			</p>
		</div>
	</div>
</body>
</html>