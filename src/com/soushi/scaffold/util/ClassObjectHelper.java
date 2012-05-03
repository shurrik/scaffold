package com.soushi.scaffold.util;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import net.sf.json.JSONObject;

import com.soushi.scaffold.model.ClassObject;
import com.soushi.scaffold.model.ClassProperty;

/**
 * @author lip 创建于 2012-4-12 下午5:36:34
 */
public class ClassObjectHelper {

	public ClassObject jsonObject2ClassObject(String className,JSONObject jsonProperties)
	{
		ClassObject co = new ClassObject();
		co.setClassName(className);
		
		
		List<ClassProperty> properties = new ArrayList();
		Iterator itor = jsonProperties.keySet().iterator();
		while (itor.hasNext()) {
			ClassProperty cp = new ClassProperty();
			String propertyName = (String) itor.next();
			String propertyType = jsonProperties.getString(propertyName);
			cp.setName(propertyName);
			cp.setType(propertyType);
			properties.add(cp);

        }
		co.setProperties(properties);
		return co;
	}
	
	/**	从json文件读取数据，转换成ClassObject队列
	 * @return
	 */
	public List<ClassObject>  getClassObjectListFromJson()
	{
		List<JSONObject> jsonClasses = getJsonClasslist();
		
		List<ClassObject> classes = convertJsonClassList2ClassObjectList(jsonClasses);
		return classes;
	}
	
	/** json类对象队列转换成ClassObject队列
	 * @param jsonClasses
	 * @return
	 */
	public List<ClassObject> convertJsonClassList2ClassObjectList(List<JSONObject> jsonClasses)
	{
		List<ClassObject> classes = new ArrayList();
		ClassObjectHelper coHelper = new ClassObjectHelper();
		for(JSONObject jsonClass:jsonClasses)
		{
			Iterator itor = jsonClass.keySet().iterator();
			
			String className = null;
			JSONObject classProperties = null;
			while (itor.hasNext()) {  
				className = (String) itor.next();
				classProperties = jsonClass.getJSONObject(className);
				break;
	        }
			ClassObject co = coHelper.jsonObject2ClassObject(className, classProperties);
			classes.add(co);
		}
		return classes;
	}
	
	/**	从json文件读取类对象队列
	 * @return
	 */
	public List<JSONObject> getJsonClasslist()
	{
		JsonHelper jsonHelper = new JsonHelper();
		List<JSONObject> jsonClasses = jsonHelper.getJsonClassList();
		return jsonClasses;
	}
}
