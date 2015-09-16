<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<!DOCTYPE html>
<html>
<head>
	<title><sitemesh:title default="欢迎光临"/> - ${site.title} - Powered By we-dian</title>
	<%@include file="/WEB-INF/views/modules/cms/front/include/head.jsp" %>
	<!-- Baidu tongji analytics --><script>var _hmt=_hmt||[];(function(){var hm=document.createElement("script");hm.src="//hm.baidu.com/hm.js?82116c626a8d504a5c0675073362ef6f";var s=document.getElementsByTagName("script")[0];s.parentNode.insertBefore(hm,s);})();</script>
	<sitemesh:head/>
</head>
<body>
<!-- Navigation -->
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <c:choose>
                <c:when test="${not empty site.logo}">
                    <img class="navbar-brand" alt="${site.title}" src="${site.logo}" class="container" onclick="location='${ctx}/index-${site.id}${fns:getUrlSuffix()}'">
                </c:when>
                <c:otherwise><a class="navbar-brand" href="${ctx}/index-${site.id}${fns:getUrlSuffix()}">${site.title}</a></c:otherwise>
            </c:choose>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <c:forEach items="${fnc:getMainNavList(site.id)}" var="category" varStatus="status"><c:if test="${status.index lt 6}">
                    <c:set var="menuCategoryId" value=",${category.id},"/>
                    <li class="${requestScope.category.id eq category.id||fn:indexOf(requestScope.category.parentIds,menuCategoryId) ge 1?'active':''}"><a href="${category.url}" target="${category.target}"><span>${category.name}</span></a></li>
                </c:if></c:forEach>
                <li id="siteSwitch" class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" title="站点"><i class="icon-retweet"></i></a>
                    <ul class="dropdown-menu">
                        <c:forEach items="${fnc:getSiteList()}" var="site"><li><a href="#" onclick="location='${ctx}/index-${site.id}${urlSuffix}'">${site.title}</a></li></c:forEach>
                    </ul>
                </li>
                <li id="themeSwitch" class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" title="主题切换"><i class="icon-th-large"></i></a>
                    <ul class="dropdown-menu">
                        <c:forEach items="${fns:getDictList('theme')}" var="dict"><li><a href="#" onclick="location='${pageContext.request.contextPath}/theme/${dict.value}?url='+location.href">${dict.label}</a></li></c:forEach>
                    </ul>
                    <!--[if lte IE 6]><script type="text/javascript">$('#themeSwitch').hide();</script><![endif]-->
                </li>
            </ul>
            <form class="navbar-form pull-right" action="${ctx}/search" method="get">
                <input type="text" name="q" maxlength="20" class="form-control" placeholder="全站搜索..." value="${q}">
            </form>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>
<sitemesh:body/>
<footer id="footer" class="midnight-blue">
    <div class="container">
        <div class="row">
            <div class="col-sm-6">
                ${site.copyright}
            </div>
            <div class="col-sm-6">
                <ul class="pull-right">
                    <li><a href="${ctx}/guestbook" target="_blank">公共留言</a></li>
                    <li><a href="${ctx}/search" target="_blank">全站搜索</a></li>
                    <li><a href="${ctx}/map-${site.id}${fns:getUrlSuffix()}" target="_blank">站点地图</a></li>
                    <li><a href="mailto:thinkgem@163.com">技术支持</a> </li>
                    <li><a href="${pageContext.request.contextPath}${fns:getAdminPath()}" target="_blank">后台管理</a></li>
                </ul>
            </div>
        </div>
    </div>
</footer>
</body>
</html>