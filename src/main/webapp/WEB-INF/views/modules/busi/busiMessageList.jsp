<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>消息管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/busi/busiMessage/">消息列表</a></li>
		<shiro:hasPermission name="busi:busiMessage:edit"><li><a href="${ctx}/busi/busiMessage/form">消息添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="busiMessage" action="${ctx}/busi/busiMessage/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>消息标题：</label>
				<form:input path="title" htmlEscape="false" maxlength="120" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>消息标题</th>
				<th>归属公司名称</th>
				<th>创建者名称</th>
				<th>创建时间</th>
				<th>消息内容</th>
				<!-- 
				<shiro:hasPermission name="busi:busiMessage:edit"><th>操作</th></shiro:hasPermission>
				-->
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="busiMessage">
			<tr>
				<td>
				${busiMessage.title}
				<!--<a href="${ctx}/busi/busiMessage/form?id=${busiMessage.id}"></a>-->
				</td>
				<td>
					${busiMessage.companyName}
				</td>
				<td>
					${busiMessage.createName}
				</td>
				<td>
					<fmt:formatDate value="${busiMessage.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td title="${busiMessage.content}" >
				<c:choose> 
     <c:when test="${fn:length(busiMessage.content) > 5}"> 
      <c:out value="${fn:substring(busiMessage.content, 0, 5)}......" /> 
     </c:when> 
     <c:otherwise> 
      <c:out value="${busiMessage.content}" /> 
     </c:otherwise>
    </c:choose>
					
				</td>
				<!--
				<shiro:hasPermission name="busi:busiMessage:edit"><td>
    				<a href="${ctx}/busi/busiMessage/form?id=${busiMessage.id}">查看</a>
					 <a href="${ctx}/busi/busiMessage/delete?id=${busiMessage.id}" onclick="return confirmx('确认要删除该消息吗？', this.href)">删除</a> 
				</td></shiro:hasPermission>
				-->
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>