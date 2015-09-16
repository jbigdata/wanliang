<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>${article.title} - ${category.name}</title>
	<meta name="decorator" content="cms_default_${site.theme}"/>
	<meta name="description" content="${article.description} ${category.description}" />
	<meta name="keywords" content="${article.keywords} ${category.keywords}" />
	<script type="text/javascript">
		$(document).ready(function() {
			if ("${category.allowComment}"=="1" && "${article.articleData.allowComment}"=="1"){
				$("#comment").show();
				page(1);
			}
		});
		function page(n,s){
			$.get("${ctx}/comment",{theme: '${site.theme}', 'category.id': '${category.id}',
				contentId: '${article.id}', title: '${article.title}', pageNo: n, pageSize: s, date: new Date().getTime()
			},function(data){
				$("#comment").html(data);
			});
		}
	</script>
</head>
<body>
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
	   <div class="span10">
	     <div class="row page box_white">
	       <div class="span10">
			<div class="title text-center"><h1 style="color:#555555;font-size:20px;text-align:center;border-bottom:1px solid #ddd;padding-bottom:15px;margin:25px 0;">${article.title}</h1></div>
               <div class="meta">
                   <div class="p-author">
                       <i class="glyphicon glyphicon-calendar"></i>
                       <span title="发布日期"><fmt:formatDate value="${article.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/> </span>&nbsp;
                       <i class="glyphicon glyphicon-user"></i>
                       ${article.user.name}
                   </div>


                   <div class="p-comment text-right">
					<span class="view" title="阅读数">
						<i class="glyphicon glyphicon-eye-open"></i>
						阅读 <span>${article.hits}</span> 次&nbsp;
					</span>
					<span class="like" title="喜欢人数">
						<i class="glyphicon glyphicon-heart"></i>
						<span class="likenum">0</span> 人喜欢&nbsp;
					</span>
                       <a href="/articles/4814#commentForm" title="我要评论"><i class="glyphicon glyphicon-comment"></i> <span class="cmtnum">0</span> 条评论</a>&nbsp;
                       <a class="favorite collect " href="#" title="稍后再读" data-objid="4814" data-objtype="1" data-collect="0">
                           <i class="glyphicon glyphicon-star-empty"></i> 收藏
                       </a>
                   </div>

               </div>
               <div class="tags">

               </div>
                <c:if test="${not empty article.description}"><div>摘要：${article.description}</div></c:if>
			<div>${article.articleData.content}</div>
  	       </div>
  	     </div>
	     <div class="row">
			<div id="comment" class="hide span10">
				正在加载评论...
			</div>
	     </div>
	     <div class="row">
	       <div class="span10">
			<h5>相关文章</h5>
			<ol><c:forEach items="${relationList}" var="relation">
				<li style="float:left;width:230px;"><a href="${ctx}/view-${relation[0]}-${relation[1]}${urlSuffix}">${fns:abbr(relation[2],30)}</a></li>
			</c:forEach></ol>
	  	  </div>
  	    </div>
  	  </div>
   </div>
   </div>
</body>
</html>