<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>公告管理</title>
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
		<li class="active"><a href="${ctx}/busi/busiPublic/">公告列表</a></li>
		<shiro:hasPermission name="busi:busiPublic:edit"><li><a href="${ctx}/busi/busiPublic/form">公告添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="busiPublic" action="${ctx}/busi/busiPublic/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>公告标题：</label>
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
				<th>公告标题</th>
				<th>归属公司名称</th>
				<th>创建者名称</th>
				<th>更新者名称</th>
				<th>更新时间</th>
				<th>删除标记</th>
				<shiro:hasPermission name="busi:busiPublic:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="busiPublic">
			<tr>
				<td><a href="${ctx}/busi/busiPublic/form?id=${busiPublic.id}">
					${busiPublic.title}
				</a></td>
				<td>
					${busiPublic.companyName}
				</td>
				<td>
					${busiPublic.createName}
				</td>
				<td>
					${busiPublic.updateName}
				</td>
				<td>
					<fmt:formatDate value="${busiPublic.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${fns:getDictLabel(busiPublic.delFlag, 'del_flag', '')}
				</td>
				<shiro:hasPermission name="busi:busiPublic:edit"><td>
    				<a href="${ctx}/busi/busiPublic/form?id=${busiPublic.id}">修改</a>
					<a href="${ctx}/busi/busiPublic/delete?id=${busiPublic.id}" onclick="return confirmx('确认要删除该公告吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>