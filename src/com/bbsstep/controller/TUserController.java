package com.bbsstep.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bbsstep.service.TUserService;

@Controller
@RequestMapping("/User")
public class TUserController {

	@Autowired
	private TUserService service;

	@RequestMapping(value = "/getIndexCount", method = RequestMethod.POST)
	@ResponseBody
	public Object getIndexCount() {
		Map<String, Object> result = new HashMap<>();
		Map<String, Integer> usercount = null;
		try {
			usercount = service.getAllIndexUserCount();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		result.put("usercounts", usercount);

		return result;

	}

}
