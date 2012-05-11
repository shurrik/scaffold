@Controller
public class GiftCardLogAction extends BaseAction{

	@Autowired
	private GiftCardLogMng giftCardLogMng;
	
	@RequestMapping("/giftcardlog/list")
	public String list(GiftCardLog giftCardLog,ModelMap model,Integer pageNum,Integer numPerPage) throws Exception{
		PageContext pageCtx = giftCardLogMng.queryPage(pageNum, numPerPage);
 		model.addAttribute("pageCtx", pageCtx);
		model.addAttribute("giftCardLog",giftCardLog);
		return "/giftcardlog/list";
	}
	
	@RequestMapping("/giftcardlog/add")
	public String add() throws Exception{
		return "/giftcardlog/edit";
	}
	
	@RequestMapping("/giftcardlog/beforemodify")
	public String beforeModify(Integer id,ModelMap model) {
		GiftCardLog giftCardLog = giftCardLogMng.getById(id);
		model.addAttribute("giftCardLog", giftCardLog);
		return "/giftcardlog/edit";
	}
	
	@RequestMapping("/giftcardlog/save")
	@ResponseBody
	public String save(HttpServletRequest request, GiftCardLog giftCardLog) throws Exception {
		boolean isAddNew = giftCardLog.getId() == null;
		if(isAddNew)
		{
			giftCardLog.setCreateTime(new Date());
		}
		giftCardLogMng.save(giftCardLog);
		if (isAddNew) {
			JsonResult.CUSTOM_SUCCESS_CLOSE.put("message", "保存成功");
		} else {
			JsonResult.CUSTOM_SUCCESS_CLOSE.put("message", "修改成功");
		}
		return JsonResult.SAVE_SUCCESS_CLOSE.toString();
	}
	
	@RequestMapping("/giftcardlog/delete")
	@ResponseBody
	public String delete(Integer id) {
		GiftCardLog giftCardLog = giftCardLogMng.getById(id);
		giftCardLogMng.delete(giftCardLog);
		return JsonResult.DELETE_SUCCESS_CLOSE.toString();
	}

}
