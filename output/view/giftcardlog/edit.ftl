<div class="pageContent">
	<form method="post" action="/giftcardlog/save" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<input type="hidden" name="id" value="${(giftCardLog.id)!}" />
		<input type="hidden" name="createTime" value="${(giftCardLog.createTime?string('yyyy-MM-dd HH:mm:ss'))!}" />
		<div class="pageFormContent" layoutH="56">
			<p>
				<label>cardNo：</label>
				<input name="cardNo" class="required" type="text" size="20" value="${(giftCardLog.cardNo)!}"/>
			</p>
			<p>
				<label>amount：</label>
				<input name="amount" class="required" type="text" size="20" value="${(giftCardLog.amount)!}"/>
			</p>
			<p>
				<label>memberId：</label>
				<input name="memberId" class="required" type="text" size="20" value="${(giftCardLog.memberId)!}"/>
			</p>
			<p>
				<label>nickName：</label>
				<input name="nickName" class="required" type="text" size="20" value="${(giftCardLog.nickName)!}"/>
			</p>
			<p>
				<label>orderId：</label>
				<input name="orderId" class="required" type="text" size="20" value="${(giftCardLog.orderId)!}"/>
			</p>
			<p>
				<label>orderNo：</label>
				<input name="orderNo" class="required" type="text" size="20" value="${(giftCardLog.orderNo)!}"/>
			</p>
			<p>
				<label>createTime：</label>
				<input name="createTime" class="required" type="text" size="20" value="${(giftCardLog.createTime)!}"/>
			</p>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>
