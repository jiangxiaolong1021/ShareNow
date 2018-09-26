package com.bbsstep.dao;

import java.util.List;

import com.bbsstep.po.TCity;
import com.bbsstep.po.TActive;

public interface TActiveMapper {

	List<TActive> selectActiveByCity(String cityName) ;

	TCity getProvinceByCity(String cityName);

	

}
