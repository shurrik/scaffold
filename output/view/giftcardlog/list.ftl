<form id="pagerForm" method="post" action="/giftcardlog/list">
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="numPerPage" value="${pageCtx.pageBean.pageSize}" />
	<!-- 自定义的一些查询参数 -->
</form>

<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="/giftcardlog/list" method="post">
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
			<li><a fresh="true" class="add" href="/giftcardlog/add" target="navTab"><span>添加</span></a></li>
			<li><a class="delete" href="/giftcardlog/delete?id={id}" target="ajaxTodo" title="确定要删除吗?"><span>删除</span></a></li>
			<li><a fresh="true" class="edit" href="/giftcardlog/beforemodify?id={id}" target="navTab"><span>修改</span></a></li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="20"></th>
				<th>cardNo</th>
				<th>amount</th>
				<th>memberId</th>
				<th>nickName</th>
				<th>orderId</th>
				<th>orderNo</th>
				<th>createTime</th>
			</tr>
		</thead>
		<tbody>
			<#list pageCtx.itemList as giftCardLog>
				<tr target="id" rel="${(giftCardLog.id)!}">
					<td>${giftCardLog_index+1}</td>
					<td>${(giftCardLog.cardNo)!}</td>
					<td>${(giftCardLog.amount)!}</td>
					<td>${(giftCardLog.memberId)!}</td>
					<td>${(giftCardLog.nickName)!}</td>
					<td>${(giftCardLog.orderId)!}</td>
					<td>${(giftCardLog.orderNo)!}</td>
					<td>${(giftCardLog.createTime)!}</td>
				</tr>
			</#list>
		</tbody>
	</table>
	<div class="panelBar">
		<@p.page pageCtx=pageCtx/>
	</div>
</div>