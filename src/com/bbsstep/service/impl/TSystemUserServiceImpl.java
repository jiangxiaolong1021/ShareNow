package com.bbsstep.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbsstep.dao.TSystemUserMapper;
import com.bbsstep.po.TSystemUser;
import com.bbsstep.service.TSystemUserService;
import com.bbsstep.util.MD5Util;

@Service
public class TSystemUserServiceImpl implements TSystemUserService {
	@Autowired
	private TSystemUserMapper dao;

	@Override
	public TSystemUser checkUser(String pwd, String username) throws Exception {
		Map<String, String> map = new HashMap<>();
		// 1.将密码加密
		String md5pwd = MD5Util.makePassword(pwd);
		// 2.将所有数值放到map中
		map.put("pwd", md5pwd);
		map.put("name", username);
		return dao.checkUser(map);
	}

	@Override
	public boolean ChangePassword(TSystemUser user)  {
		
		int count = dao.UpdatePassword(user);
		if (count > 0) {
			return true;
		}
		return false;
	}

}
