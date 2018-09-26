package com.bbsstep.service;

import java.util.Map;

public interface TUserService {

	// 获取首页里需要的所有关于用户的数据
	Map<String, Integer> getAllIndexUserCount() throws Exception;

}
