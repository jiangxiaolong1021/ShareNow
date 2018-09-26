package com.bbsstep.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bbsstep.po.TActive;
import com.bbsstep.po.TCity;
import com.bbsstep.service.TActiveService;
@Controller
@RequestMapping("/active")
public class TActiveController {
	@Autowired
	TActiveService service;

	@RequestMapping(value = "/getActiveByCityName", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getActiveByCityName(String cityName) {

		List<TActive> activelist = new ArrayList<>();
		TCity city = null;
		int status = 1;
		Map<String, Object> result = new HashMap<String, Object>();

		activelist = service.selectActiveByCity(cityName);
		city = service.getProvinceByCity(cityName);

		if (city != null) {
			status = 0;

		}

		result.put("status", status);
		result.put("city", city);
		result.put("activelist", activelist);

		return result;

	}
}
