package com.thinkgem.jeesite.modules.sys.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 个人主页访问
 * @author ThinkGem
 * @version 2013-8-29
 */
@Controller
@RequestMapping(value = "homepage/user")
public class HomePageController {

	@RequestMapping(value = "personage")
	public String list(String id, HttpServletRequest request, HttpServletResponse response, Model model) {
		User user = UserUtils.get(id);
		model.addAttribute("user", user);
		return "modules/sys/homePage";
	}
	
	
}












