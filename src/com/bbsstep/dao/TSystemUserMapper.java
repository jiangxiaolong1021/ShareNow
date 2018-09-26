package com.bbsstep.dao;

import java.util.Map;

import com.bbsstep.po.TSystemUser;

public interface TSystemUserMapper {

	TSystemUser checkUser(Map<String, String> map);

	int UpdatePassword(TSystemUser user);
}
