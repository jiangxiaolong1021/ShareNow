package com.bbsstep.service;

import com.bbsstep.po.TSystemUser;

public interface TSystemUserService {

	// 给他一个用户名，他将密码加密之后到数据库查询，如果有返回这个用户，如果没有反回null
	TSystemUser checkUser(String pwd, String username) throws Exception;

	boolean ChangePassword(TSystemUser user);

}
