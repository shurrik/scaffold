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
import java.util.Date;

public class ${classObject.className!} extends BaseEntity implements java.io.Serializable{

	private Integer id;
	private Date createTime;
<#list classObject.properties as property>
	private ${property.type!} ${property.name!};
</#list>

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
<#list classObject.properties as property>
	public ${property.type!} get${property.name?cap_first!}() {
		return ${property.name!};
	}
	public void set${property.name?cap_first!}(${property.type!} ${property.name!}) {
		this.${property.name!} = ${property.name!};
	}
</#list>
	
}
