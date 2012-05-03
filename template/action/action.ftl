<#--
package com.kaoshidian.cms.action.memberzone;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kaoshidian.cms.action.BaseAction;
import com.kaoshidian.cms.action.JsonResult;
import com.kaoshidian.cms.manager.memberzone.${classObject.className!}Mng;
import com.kaoshidian.common.dao.page.PageContext;
import com.kaoshidian.common.entity.memberzone.${classObject.className!};
import com.kaoshidian.common.exception.KsdBizException;
import com.kaoshidian.common.util.EnumActivityStatus;

/**
 * @author lip 创建于	2012-3-29	上午10:28:07 
 */
 -->
@Controller
public class ${classObject.className!}Action extends BaseAction{

	@Autowired
	private ${classObject.className!}Mng ${classObject.className?uncap_first!}Mng;
	
	@RequestMapping("${module!}/${classObject.className?lower_case!}/list")
	public String list(${classObject.className!} ${classObject.className?uncap_first!},ModelMap model,Integer pageNum,Integer numPerPage) throws Exception{
		PageContext pageCtx = ${classObject.className?uncap_first!}Mng.queryPage(pageNum, numPerPage);
 		model.addAttribute("pageCtx", pageCtx);
		model.addAttribute("${classObject.className?uncap_first!}",${classObject.className?uncap_first!});
		return "${module!}/${classObject.className?uncap_first!}/list";
	}
	
	@RequestMapping("${module!}/${classObject.className?lower_case!}/add")
	public String add() throws Exception{
		return "${module!}/${classObject.className?lower_case!}/edit";
	}
	
	@RequestMapping("${module!}/${classObject.className?lower_case!}/beforemodify")
	public String beforeModify(Integer id,ModelMap model) {
		${classObject.className!} ${classObject.className?uncap_first!} = ${classObject.className?uncap_first!}Mng.getById(id);
		model.addAttribute("${classObject.className?uncap_first!}", ${classObject.className?uncap_first!});
		return "${module!}/${classObject.className?lower_case!}/edit";
	}
	
	@RequestMapping("${module!}/${classObject.className?lower_case!}/save")
	@ResponseBody
	public String save(HttpServletRequest request, ${classObject.className!} ${classObject.className?uncap_first!}) throws Exception {
		boolean isAddNew = ${classObject.className?uncap_first!}.getId() == null;
		if(isAddNew)
		{
			${classObject.className?uncap_first!}.setCreateTime(new Date());
		}
		${classObject.className?uncap_first!}Mng.save(${classObject.className?uncap_first!});
		if (isAddNew) {
			JsonResult.CUSTOM_SUCCESS_CLOSE.put("message", "保存成功");
		} else {
			JsonResult.CUSTOM_SUCCESS_CLOSE.put("message", "修改成功");
		}
		return JsonResult.SAVE_SUCCESS_CLOSE.toString();
	}
	
	@RequestMapping("${module!}/${classObject.className?lower_case!}/delete")
	@ResponseBody
	public String delete(Integer id) {
		${classObject.className!} ${classObject.className?uncap_first!} = ${classObject.className?uncap_first!}Mng.getById(id);
		${classObject.className?uncap_first!}Mng.delete(${classObject.className?uncap_first!});
		return JsonResult.DELETE_SUCCESS_CLOSE.toString();
	}

}
