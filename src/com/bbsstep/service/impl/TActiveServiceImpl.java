package com.bbsstep.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbsstep.po.TActive;
import com.bbsstep.dao.TActiveMapper;
import com.bbsstep.po.TCity;
import com.bbsstep.service.TActiveService;

@Service
public class TActiveServiceImpl implements TActiveService {

	@Autowired
	TActiveMapper mapper;

	@Override
	public List<TActive> selectActiveByCity(String cityName) {

		return mapper.selectActiveByCity(cityName);
	}

	@Override
	public TCity getProvinceByCity(String cityName) {

		return mapper.getProvinceByCity(cityName);
	}

}
