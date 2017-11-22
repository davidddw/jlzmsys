<%@ page import="java.util.*" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="keywords" content="jquery,ui,easy,easyui,web">
    <meta name="description" content="easyui help you build your web page easily!">
    <title>吉林智明社内管理システム</title>
    <link rel="shortcut icon" href="${contextPath}/images/favicon.ico"/>
    <link rel="stylesheet" type="text/css" href="${contextPath}/assets/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="${contextPath}/css/superBlue.css" id="themeCss">
    <script type="text/javascript" src="${contextPath}/assets/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="${contextPath}/assets/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${contextPath}/assets/easyui/locale/easyui-lang-zh_CN.js" charset="utf-8"></script>
    <script type="text/javascript" src="${contextPath}/js/extJs.js"></script>
    <script type="text/javascript" src="${contextPath}/js/super.js"></script>
    <script type="text/javascript" src="${contextPath}/js/custom.js"></script>
    <script type="text/javascript">
    	var basePath = "${contextPath }";
	</script>
</head>
<body id="main" class="easyui-layout">
<div data-options="region:'north',border:false" class="super-north">
    <!--顶部-->
    <div class="super-navigation">
        <!--自定义导航-->
        <div class="super-navigation-main">
            <div class="super-setting-left">
            	<div class="super-navigation-title">
            	<img src="images/logo.png" width="40" height="40" align="absmiddle">  吉林智明社内管理システム</div>
            </div>
            <div class="super-setting-right">
                <ul>
                    <li class="user">
                        <div class="super-setting-icon">
                        <span class="user-icon">
                            <shiro:hasRole name="lv5" ><img src="images/lv5.png"/></shiro:hasRole>
                            <shiro:hasRole name="lv4" ><img src="images/lv4.png"/></shiro:hasRole>
                            <shiro:hasRole name="lv3" ><img src="images/lv3.png"/></shiro:hasRole>
                            <shiro:hasRole name="lv2" ><img src="images/lv2.png"/></shiro:hasRole>
                            <shiro:hasRole name="lv1" ><img src="images/lv1.png"/></shiro:hasRole>
                        </span>当前用户：<shiro:principal />
                        </div>
                        <div id="mm" class="easyui-menu">
                            <div id="change-pass">更改密码</div>
                            <div class="menu-sep"></div>
                            <div id="logout">退出</div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div data-options="region:'west',title:'导航菜单',border:false" class="super-west">
    <!--左侧导航-->
    <div class="easyui-accordion" data-options="border:false,fit:true,selected:true">
        <c:forEach items="${menuLists}" var="menulist" >
        <div title="${menulist.name}" data-options="iconCls:'fa fa-${menulist.icon}'">
            <ul>
            <c:forEach items="${menulist.children}" var="item" >
            	<li data-url='${item.url}'><i class="fa fa-${item.icon}"></i>${item.name}</li>
            </c:forEach>
            </ul>
        </div>
        </c:forEach>
    </div>
</div>
<div data-options="region:'center'" style="padding-top: 2px;">
    <!--主要内容-->
    <div id="tt" class="easyui-tabs" data-options="border:false,fit:true">
        <div title="首页" data-options="iconCls:'fa fa-home'">
            <div style="padding: 20px;">
                放点什么好呢......放点什么好呢......

                Language: <a href="?lang=zh_CN"><spring:message code="language.cn" /></a> - <a href="?lang=en_US"><spring:message code="language.en" /></a>
                <h2>
                    <spring:message code="welcome" />
                </h2>
                <shiro:hasPermission name="/user/editPwdPage">
                   <a href="javascript:void(0)" onclick="editUserPwd()" class="easyui-linkbutton" plain="true" icon="fi-unlock" >修改密码</a>
                </shiro:hasPermission>
                Locale: ${pageContext.response.locale }
            </div>
        </div>
    </div>
</div>
<div data-options="region:'south'" class="super-south">
    <!--页脚-->
    <div class="super-footer-info">
        <span><i class="fa fa-info-circle"></i> 吉林智明社内管理システム</span>
        <span><i class="fa fa-copyright"></i> CopyRight 2017 版权所有 <i class="fa fa-caret-right"></i></span>
    </div>
</div>
</body>
</html>
