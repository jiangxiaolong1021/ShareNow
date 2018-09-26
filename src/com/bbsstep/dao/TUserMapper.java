package com.bbsstep.dao;

public interface TUserMapper {
	
	Integer getDayUserCount() throws Exception;

	Integer getMouthUserCount()throws Exception;

	Integer getAllUserCount()throws Exception;

	Integer getDayActivityCount()throws Exception;

	Integer getMouthActivityCount()throws Exception;

	Integer getAllActivityCount()throws Exception;

}
