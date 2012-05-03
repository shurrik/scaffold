<form id="pagerForm" method="post" action="${module!}/${classObject.className?lower_case!}/list">
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="numPerPage" value="${r"${pageCtx.pageBean.pageSize}"}" />
	<!-- 自定义的一些查询参数 -->
</form>

<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="${module!}/${classObject.className?lower_case!}/list" method="post">
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td><div class="buttonActive"><div class="buttonContent"><button type="submit">检索</button></div></div></td>
			</tr>
		</table>
	</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a fresh="true" class="add" href="${module!}/${classObject.className?lower_case!}/add" target="navTab"><span>添加</span></a></li>
			<li><a class="delete" href="${module!}/${classObject.className?lower_case!}/delete?id={id}" target="ajaxTodo" title="确定要删除吗?"><span>删除</span></a></li>
			<li><a fresh="true" class="edit" href="${module!}/${classObject.className?lower_case!}/beforemodify?id={id}" target="navTab"><span>修改</span></a></li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="20"></th>
			<#list classObject.properties as property>
				<th>${property.name!}</th>
			</#list>
			</tr>
		</thead>
		<tbody>
			${r"<#list pageCtx.itemList as "}${classObject.className?uncap_first!}${r">"}
				<tr target="id" rel="${r'${('}${classObject.className?uncap_first!}${r'.id)!}'}">
					<td>${r"${"}${classObject.className?uncap_first!}${r"_index+1}"}</td>
				<#list classObject.properties as property>
					<td>${r"${("}${classObject.className?uncap_first!}${r"."}${property.name}${r")!}"}</td>
				</#list>
				</tr>
			${r"</#list>"}
		</tbody>
	</table>
	<div class="panelBar">
		${r"<@p.page pageCtx=pageCtx/>"}
	</div>
</div>