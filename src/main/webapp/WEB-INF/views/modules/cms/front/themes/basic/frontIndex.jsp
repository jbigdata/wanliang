<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>首页</title>
	<meta name="decorator" content="cms_default_${site.theme}"/>
	<meta name="description" content="JeeSite ${site.description}" />
	<meta name="keywords" content="JeeSite ${site.keywords}" />
</head>
<body>

<div class="jumbotron" id="home">
    <div class="container">
        <div class="media">
            <a href="#" class="pull-right"><img class="media-object" src="${ctxStaticTheme}/images/Finder_256.png"></a>

            <div class="media-body">
                <div class="col-md-11">
                    <h1 class="title"><c:set var="article" value="${fnc:getArticle('2')}"/>${fns:abbr(article.title,28)}</h1>

                    <p>${fns:abbr(article.description,150)}</p>

                    <p><a href="${article.url}" class="btn btn-success btn-lg">查看详情 <i class="icon icon-angle-right"></i></a></p>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container">

    <div class="row">

        <div class="col-sm-9">

            <div class="panel panel-default">
                <div class="panel-heading">每日资讯<small><a href="${ctx}/list-2${urlSuffix}" class="pull-right">更多&gt;&gt;</a></small></div>

                <c:forEach items="${fnc:getArticleList(site.id, 10, 8, '')}" var="article" varStatus="status">
                    <article class="article box_white">
                        <div class="row">

                            <div>

                                <h2><a href="${article.url}" target="_blank" title="${article.title}">
                                        ${status.count}.${fns:abbr(article.title,68)}
                                </a></h2>
                                <p class="text">${article.description}<a href="${article.url}" target="_blank" title="阅读全文">阅读全文</a></p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-8 metatag">
                                <i class="glyphicon glyphicon-th"></i>
                                <span class="source" title="来源">${article.articleData.copyfrom}</span>
                                <i class="glyphicon glyphicon-calendar"></i>
                                <span class="date" title="发布日期"><fmt:formatDate value="${article.updateDate}" pattern="yyyy-MM-dd"/></span>
                                <i class="glyphicon glyphicon-user"></i>
                                <span class="author" title="作者">${article.user.name}</span>

                            </div>
                            <div class="col-md-4 metatag text-right">
						<span class="view" title="阅读数">
							<i class="glyphicon glyphicon-eye-open"></i>
							阅读:<span>${article.hits}</span>次
						</span>
                                <a href="/articles/4812#commentForm" class="cmt" target="_blank" title="评论数">
                                    <i class="glyphicon glyphicon-comment"></i>
                                    评论:<span>1</span>条
                                </a>

                                <a href="#" class="like" title="我喜欢" data-objid="4812" data-objtype="1" data-flag="0">
                                    <i class="glyphicon glyphicon-heart-empty"></i>

                                    <span class="likenum">0</span>人喜欢
                                </a>
                            </div>
                        </div>
                    </article>
               </c:forEach>
                <!-- List group -->

            </div>

            <div class="panel panel-default">
                <div class="panel-heading">热门讨论<small><a href="${ctx}/list-6${urlSuffix}" class="pull-right">更多&gt;&gt;</a></small></div>
                <!-- List group -->
                    <c:forEach items="${fnc:getArticleList(site.id, 6, 8, '')}" var="article" varStatus="status">
                        <article class="article box_white">
                            <div class="row">

                                <div>

                                    <h2><a href="${article.url}" target="_blank" title="${article.title}">
                                           ${fns:abbr(article.title,68)}
                                    </a></h2>
                                    <p class="text">${article.description}<a href="${article.url}" target="_blank" title="阅读全文">阅读全文</a></p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-8 metatag">
                                    <i class="glyphicon glyphicon-th"></i>
                                    <span class="source" title="来源">${article.articleData.copyfrom}</span>
                                    <i class="glyphicon glyphicon-calendar"></i>
                                    <span class="date" title="发布日期"><fmt:formatDate value="${article.updateDate}" pattern="yyyy-MM-dd"/></span>
                                    <i class="glyphicon glyphicon-user"></i>
                                    <span class="author" title="作者">${article.user.name}</span>

                                </div>
                                <div class="col-md-4 metatag text-right">
						<span class="view" title="阅读数">
							<i class="glyphicon glyphicon-eye-open"></i>
							阅读:<span>${article.hits}</span>次
						</span>
                                    <a href="/articles/4812#commentForm" class="cmt" target="_blank" title="评论数">
                                        <i class="glyphicon glyphicon-comment"></i>
                                        评论:<span>1</span>条
                                    </a>

                                    <a href="#" class="like" title="我喜欢" data-objid="4812" data-objtype="1" data-flag="0">
                                        <i class="glyphicon glyphicon-heart-empty"></i>

                                        <span class="likenum">0</span>人喜欢
                                    </a>
                                </div>
                            </div>
                        </article>
                    </c:forEach>
            </div>

            <%--<div class="panel panel-default">--%>
                <%--<div class="panel-heading">博文推荐<small><a href="${ctx}/list-10${urlSuffix}" class="pull-right">更多&gt;&gt;</a></small></div>--%>
                <%--<!-- List group -->--%>
                <%--<ul class="list-group">--%>
                    <%--<c:forEach items="${fnc:getArticleList(site.id, 2, 8, '')}" var="article" varStatus="status">--%>
                        <%--<li class="list-group-item"><span class="pull-right"><fmt:formatDate value="${article.updateDate}" pattern="yyyy-MM-dd"/></span> <a href="${article.url}" style="color:${article.color}">${status.count}.${fns:abbr(article.title,28)}</a></li>--%>
                    <%--</c:forEach>--%>
                <%--</ul>--%>
            <%--</div>--%>

        </div><!--/col-->
        <div class="col-sm-3">
            <ul class="list-group">
                <c:forEach items="${fnc:getArticleList(site.id, 2, 8, '')}" var="article" varStatus="status">
                    <li class="list-group-item"><span class="pull-right"><fmt:formatDate value="${article.updateDate}" pattern="yyyy-MM-dd"/></span> <a href="${article.url}" style="color:${article.color}">${status.count}.${fns:abbr(article.title,28)}</a></li>
                </c:forEach>
            </ul>

        </div>
    </div>
</div>
</body>
</html>