package com.${company!}.${project!}.entity.${module!};

<#--
import java.math.BigDecimal;
import java.util.Date;

import com.kaoshidian.common.entity.BaseEntity;
import com.kaoshidian.common.util.EnumActivityStatus;
import com.kaoshidian.common.util.EnumExchangeType;
/**
 * @author lip 创建于	2012-3-29	上午10:31:54 
 */
-->

public class ${className!} extends BaseEntity implements java.io.Serializable{

	<#list propertyNames as propertyName>
	<#assign propertyType=propertyField['propertyName']>
		private ${propertyType!} ${propertyName!};
	</#list>

	<#list propertyNames as propertyName>
	<#assign propertyType=propertyField['propertyName']>
		public ${propertyType!} get${propertyName!}() {
			return id;
		}
		public void set${propertyName!}(${propertyType!} ${propertyName!}) {
			this.${propertyName!} = ${propertyName!};
		}
	</#list>
	
}
