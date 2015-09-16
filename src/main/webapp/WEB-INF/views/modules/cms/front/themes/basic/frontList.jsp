<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>${category.name}</title>
	<meta name="decorator" content="cms_default_${site.theme}"/>
	<meta name="description" content="${category.description}" />
	<meta name="keywords" content="${category.keywords}" />
</head>
<body>
<br>
<br>
<br>
<div class="container">
	<div class="row">
	   <%--<div class="span2">--%>
	   	 <%--<h4>栏目列表</h4>--%>
		 <%--<ol>--%>
		 	<%--<cms:frontCategoryList categoryList="${categoryList}"/>--%>
		 <%--</ol>--%>
		 <%--<h4>推荐阅读</h4>--%>
		 <%--<ol>--%>
		 	<%--<cms:frontArticleHitsTop category="${category}"/>--%>
		 <%--</ol>--%>
	   <%--</div>--%>
	   <div class="span10">
		 <ul class="breadcrumb">
		    <cms:frontCurrentPosition category="${category}"/>
		 </ul>
	   </div>
           <br>
       <div class="span10">
           <div class="panel panel-default">
               <div class="panel-heading">${category.name}<small><a href="${ctx}/list-2${urlSuffix}" class="pull-right">更多&gt;&gt;</a></small></div>


           <c:if test="${category.module eq 'article'}">

			 <c:forEach items="${page.list}" var="article">
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
              </div>
			<div class="pagination">${page}</div>
			<script type="text/javascript">
				function page(n,s){
					location="${ctx}/list-${category.id}${urlSuffix}?pageNo="+n+"&pageSize="+s;
				}
			</script>
		  </c:if>
		  <c:if test="${category.module eq 'link'}">
			<ul class="list-group"><c:forEach items="${page.list}" var="link">
				<li class="list-group-item"><a href="${link.href}" target="_blank" style="color:${link.color}"><c:out value="${link.title}" /></a></li>
			</c:forEach></ul>
              </div>
		  </c:if>
  	  </div>
   </div>
</div>
</body>
</html>