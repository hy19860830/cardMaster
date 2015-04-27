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
import com.thinkgem.jeesite.modules.busi.entity.BusiMessage;
import com.thinkgem.jeesite.modules.busi.service.BusiMessageService;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 消息生成Controller
 * @author yang.hu
 * @version 2015-04-15
 */
@Controller
@RequestMapping(value = "${adminPath}/busi/busiMessage")
public class BusiMessageController extends BaseController {

	@Autowired
	private BusiMessageService busiMessageService;
	
	@ModelAttribute
	public BusiMessage get(@RequestParam(required=false) String id) {
		BusiMessage entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = busiMessageService.get(id);
		}
		if (entity == null){
			entity = new BusiMessage();
		}
		return entity;
	}
	
	@RequiresPermissions("busi:busiMessage:view")
	@RequestMapping(value = {"list", ""})
	public String list(BusiMessage busiMessage, HttpServletRequest request, HttpServletResponse response, Model model) {
		User user = UserUtils.getUser();
		busiMessage.setCompanyId(user.getCompany().getId());
		Page<BusiMessage> page = busiMessageService.findPage(new Page<BusiMessage>(request, response), busiMessage); 
		model.addAttribute("page", page);
		return "modules/busi/busiMessageList";
	}

	@RequiresPermissions("busi:busiMessage:view")
	@RequestMapping(value = "form")
	public String form(BusiMessage busiMessage, Model model) {
		model.addAttribute("busiMessage", busiMessage);
		return "modules/busi/busiMessageForm";
	}

	@RequiresPermissions("busi:busiMessage:edit")
	@RequestMapping(value = "save")
	public String save(BusiMessage busiMessage, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, busiMessage)){
			return form(busiMessage, model);
		}
		User user = UserUtils.getUser();
		busiMessage.setCompanyId(user.getCompany().getId());
		busiMessage.setCompanyName(user.getCompany().getName());
		busiMessage.setCreateId(user.getId());
		busiMessage.setCreateName(user.getName());
		busiMessage.setCreateDate(new Date());
		busiMessageService.save(busiMessage);
		addMessage(redirectAttributes, "保存消息成功");
		return "redirect:"+Global.getAdminPath()+"/busi/busiMessage/?repage";
	}
	
	@RequiresPermissions("busi:busiMessage:edit")
	@RequestMapping(value = "delete")
	public String delete(BusiMessage busiMessage, RedirectAttributes redirectAttributes) {
		busiMessageService.delete(busiMessage);
		addMessage(redirectAttributes, "删除消息成功");
		return "redirect:"+Global.getAdminPath()+"/busi/busiMessage/?repage";
	}

}