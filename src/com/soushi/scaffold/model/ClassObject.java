package com.soushi.scaffold.model;

import java.util.List;

/**
 * @author lip 创建于 2012-4-12 下午7:00:33
 */
public class ClassObject {

	private String className;
	private List<ClassProperty> properties;

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public List<ClassProperty> getProperties() {
		return properties;
	}

	public void setProperties(List<ClassProperty> properties) {
		this.properties = properties;
	}

}
