package com.bbsstep.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.bbsstep.po.TSystemUser;
import com.bbsstep.service.TSystemUserService;
import com.bbsstep.util.MD5Util;
import com.google.code.kaptcha.Constants;

@Controller
@RequestMapping(value = "/tusercontroller")
public class TSystemUserController {
	@Autowired
	private TSystemUserService service;

	@RequestMapping(value = "/checklogin", method = RequestMethod.POST)
	public ModelAndView checklogin(String username, String password, String imageContent, HttpSession session) {
		TSystemUser user = null;
		ModelAndView mv = new ModelAndView();
		String oriContent = (String) session.getAttribute(Constants.KAPTCHA_SESSION_KEY);
		if (oriContent.equalsIgnoreCase(imageContent)) {
			try {
				user = service.checkUser(password, username);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if (null == user) {
				// 用户名密码不正确
				mv.setViewName("redirect:/login.jsp?msg=1");

			} else {
				session.setAttribute("loginUser", user);
				mv.setViewName("redirect:/pages/home/index.jsp");
			}

		} else {
			// 验证码不正确
			mv.setViewName("redirect:/login.jsp?msg=0");
		}
		return mv;
	}

	@RequestMapping(value = "/updatePassword", method = RequestMethod.POST)
	@ResponseBody
	public String ChangePassword(String password, HttpSession session) {

		String str = "更新失败";
		TSystemUser user = (TSystemUser) session.getAttribute("loginUser");
		user.setPassword(MD5Util.makePassword(password));
		boolean flag = service.ChangePassword(user);
		if (flag) {

			str = "更新成功";
		}
		return JSON.toJSONString(str);

	}

}
