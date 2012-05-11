package com.soushi.scaffold.core;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.soushi.scaffold.model.ClassObject;
import com.soushi.scaffold.util.ClassObjectHelper;
import com.soushi.scaffold.util.FileHelper;
import com.soushi.scaffold.util.FreeMarkerHelper;
import com.soushi.scaffold.util.GlobalVariables;

import freemarker.template.TemplateException;

/**
 * @author lip 创建于	2012-4-13	上午10:46:16 
 */
public class Generator {

	public static void generate() throws IOException, TemplateException
	{
		List<ClassObject> classObjectList = getClassObjectList();
		
		for(ClassObject co:classObjectList)
		{
			Map<String, Object> model = new HashMap();
			model.put("classObject", co);
			generateEntity(model);
			generateDao(model);
			generateManager(model);
			generateAction(model);
			generateViewList(model);
			generateViewEdit(model);
		}
	}
	
	public static void generateEntity(Map<String, Object> model) throws IOException, TemplateException
	{
		ClassObject co = (ClassObject) model.get("classObject");
		FileHelper fileHelper = new FileHelper();
		FreeMarkerHelper fmHelper = new FreeMarkerHelper();
		String content = fmHelper.render(model, GlobalVariables.ENTITY_TEMPLATE_PATH);
		String outputPath = GlobalVariables.OUTPUT_ROOTPATH+GlobalVariables.OUTPUT_RELATIVE_ENTITY_PATH;
		fileHelper.createFile(outputPath, co.getClassName(), content, "java");
	}
	
	public static void generateDao(Map<String, Object> model) throws IOException, TemplateException
	{
		ClassObject co = (ClassObject) model.get("classObject");
		FileHelper fileHelper = new FileHelper();
		FreeMarkerHelper fmHelper = new FreeMarkerHelper();
		String content = fmHelper.render(model, GlobalVariables.DAO_TEMPLATE_PATH);
		String outputPath = GlobalVariables.OUTPUT_ROOTPATH+GlobalVariables.OUTPUT_RELATIVE_DAO_PATH;
		fileHelper.createFile(outputPath, co.getClassName()+"DAO", content, "java");
	}
	
	public static void generateManager(Map<String, Object> model) throws IOException, TemplateException
	{
		ClassObject co = (ClassObject) model.get("classObject");
		FileHelper fileHelper = new FileHelper();
		FreeMarkerHelper fmHelper = new FreeMarkerHelper();
		String content = fmHelper.render(model, GlobalVariables.MANAGER_TEMPLATE_PATH);
		String outputPath = GlobalVariables.OUTPUT_ROOTPATH+GlobalVariables.OUTPUT_RELATIVE_MANAGER_PATH;
		fileHelper.createFile(outputPath, co.getClassName()+"Mng", content, "java");
	}
	
	public static void generateAction(Map<String, Object> model) throws IOException, TemplateException
	{
		ClassObject co = (ClassObject) model.get("classObject");
		FileHelper fileHelper = new FileHelper();
		FreeMarkerHelper fmHelper = new FreeMarkerHelper();
		String content = fmHelper.render(model, GlobalVariables.ACTION_TEMPLATE_PATH);
		String outputPath = GlobalVariables.OUTPUT_ROOTPATH+GlobalVariables.OUTPUT_RELATIVE_ACTION_PATH;
		fileHelper.createFile(outputPath, co.getClassName()+"Action", content, "java");
	}
	
	
	public static void generateViewList(Map<String, Object> model) throws IOException, TemplateException
	{
		ClassObject co = (ClassObject) model.get("classObject");
		FileHelper fileHelper = new FileHelper();
		FreeMarkerHelper fmHelper = new FreeMarkerHelper();
		String content = fmHelper.render(model, GlobalVariables.VIEW_LIST_TEMPLATE_PATH);
		String outputPath = GlobalVariables.OUTPUT_ROOTPATH+GlobalVariables.OUTPUT_RELATIVE_VIEW_PATH.toLowerCase();
		fileHelper.createFile(outputPath+co.getClassName().toLowerCase()+"/", "list", content, "ftl");
	}
	
	public static void generateViewEdit(Map<String, Object> model) throws IOException, TemplateException
	{
		ClassObject co = (ClassObject) model.get("classObject");
		FileHelper fileHelper = new FileHelper();
		FreeMarkerHelper fmHelper = new FreeMarkerHelper();
		String content = fmHelper.render(model, GlobalVariables.VIEW_EDIT_TEMPLATE_PATH);
		String outputPath = GlobalVariables.OUTPUT_ROOTPATH+GlobalVariables.OUTPUT_RELATIVE_VIEW_PATH.toLowerCase();
		fileHelper.createFile(outputPath+co.getClassName().toLowerCase()+"/", "edit", content, "ftl");
	}
	
	/**	从json文件获取类对象队列
	 * @return
	 */
	public static List<ClassObject> getClassObjectList()
	{
		ClassObjectHelper coHelper = new ClassObjectHelper();
		return  coHelper.getClassObjectListFromJson();
	}
}
