<div class="pageContent">
	<form method="post" action="${module!}/${classObject.className?lower_case!}/save" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<input type="hidden" name="id" value="${r"${("}${classObject.className?uncap_first!}${r".id)!}"}" />
		<input type="hidden" name="createTime" value="${r"${("}${classObject.className?uncap_first!}${r".createTime?string('yyyy-MM-dd HH:mm:ss'))!}"}" />
		<div class="pageFormContent" layoutH="56">
		<#list classObject.properties as property>
			<p>
				<label>${(property.name)!}：</label>
				<input name="${(property.name)!}" class="required" type="text" size="20" value="${r"${("}${classObject.className?uncap_first!}${r"."}${property.name}${r")!}"}"/>
			</p>
		</#list>
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
