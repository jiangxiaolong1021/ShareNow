package com.bbsstep.service;

import java.util.List;

import com.bbsstep.po.TActive;
import com.bbsstep.po.TCity;

public interface TActiveService {
	
	List<TActive> selectActiveByCity(String cityName);

	TCity getProvinceByCity(String cityName);

}
