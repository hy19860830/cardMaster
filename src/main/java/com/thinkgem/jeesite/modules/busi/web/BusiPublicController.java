/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.busi.web;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.busi.entity.BusiPublic;
import com.thinkgem.jeesite.modules.busi.service.BusiPublicService;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 公告发布Controller
 * @author yang.hu
 * @version 2015-04-13
 */
@Controller
@RequestMapping(value = "${adminPath}/busi/busiPublic")
public class BusiPublicController extends BaseController {

	@Autowired
	private BusiPublicService busiPublicService;
	
	@ModelAttribute
	public BusiPublic get(@RequestParam(required=false) String id) {
		BusiPublic entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = busiPublicService.get(id);
		}
		if (entity == null){
			entity = new BusiPublic();
		}
		return entity;
	}
	
	@RequiresPermissions("busi:busiPublic:view")
	@RequestMapping(value = {"list", ""})
	public String list(BusiPublic busiPublic, HttpServletRequest request, HttpServletResponse response, Model model) {
		User user = UserUtils.getUser();
		busiPublic.setCompanyId(user.getCompany().getId());
		Page<BusiPublic> page = busiPublicService.findPage(new Page<BusiPublic>(request, response), busiPublic); 
		model.addAttribute("page", page);
		return "modules/busi/busiPublicList";
	}

	@RequiresPermissions("busi:busiPublic:view")
	@RequestMapping(value = "form")
	public String form(BusiPublic busiPublic, Model model) {
		model.addAttribute("busiPublic", busiPublic);
		return "modules/busi/busiPublicForm";
	}

	@RequiresPermissions("busi:busiPublic:edit")
	@RequestMapping(value = "save")
	public String save(BusiPublic busiPublic, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, busiPublic)){
			return form(busiPublic, model);
		}
		User user = UserUtils.getUser();
		if(busiPublic.getId()==null||"".equals(busiPublic.getId())){  //新增
			busiPublic.setCompanyId(user.getCompany().getId());
			busiPublic.setCompanyName(user.getCompany().getName());
			busiPublic.setCreateId(user.getId());
			busiPublic.setCreateName(user.getName());
			busiPublic.setCreateDate(new Date());
		}
		//更新新增都要
		busiPublic.setUpdateId(user.getId());
		busiPublic.setUpdateName(user.getName());
		busiPublic.setUpdateDate(new Date());
		
		busiPublicService.save(busiPublic);
		addMessage(redirectAttributes, "保存公告成功");
		return "redirect:"+Global.getAdminPath()+"/busi/busiPublic/?repage";
	}
	
	@RequiresPermissions("busi:busiPublic:edit")
	@RequestMapping(value = "delete")
	public String delete(BusiPublic busiPublic, RedirectAttributes redirectAttributes) {
		busiPublicService.delete(busiPublic);
		addMessage(redirectAttributes, "删除公告成功");
		return "redirect:"+Global.getAdminPath()+"/busi/busiPublic/?repage";
	}

}