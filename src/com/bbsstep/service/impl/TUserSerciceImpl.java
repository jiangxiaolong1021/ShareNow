package com.bbsstep.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbsstep.dao.TUserMapper;
import com.bbsstep.service.TUserService;

@Service
public class TUserSerciceImpl implements TUserService {
	@Autowired
	private TUserMapper dao;

	@Override
	public Map<String, Integer> getAllIndexUserCount() throws Exception {
		Map<String, Integer> usermap = new HashMap<>();
		Integer dayUserCount = null;
		Integer mounthUserCount = null;
		Integer allUserCount = null;

		dayUserCount = dao.getDayUserCount();
		mounthUserCount = dao.getMouthUserCount();
		allUserCount = dao.getAllUserCount();
		usermap.put("dayUserCount", dayUserCount);
		usermap.put("mounthUserCount", mounthUserCount);
		usermap.put("allUserCount", allUserCount);

		Integer dayActivityCount = null;
		Integer mounthActivityCount = null;
		Integer allActivityCount = null;
		dayActivityCount = dao.getDayActivityCount();
		mounthActivityCount = dao.getMouthActivityCount();
		allActivityCount = dao.getAllActivityCount();
		usermap.put("dayActivityCount", dayActivityCount);
		usermap.put("mounthActivityCount", mounthActivityCount);
		usermap.put("allActivityCount", allActivityCount);

		return usermap;

	}

}
