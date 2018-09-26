package com.bbsstep.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbsstep.dao.TCarouselMapper;
import com.bbsstep.po.TCarousel;
import com.bbsstep.service.TCarouselService;
import com.bbsstep.util.DataTablePageUtil;

@Service
public class TCarouselServiceImpl implements TCarouselService {

	@Autowired
	private TCarouselMapper mapper;

	public DataTablePageUtil<TCarousel> getlist(DataTablePageUtil<TCarousel> param) {
		int total = mapper.selectNumByParam(param);
		param.setRecordsTotal(total);
		param.setRecordsFiltered(total);
		param.setData(mapper.selectByParam(param));
		return param;
	}

	@Override
	public int add(TCarousel record) {

		return mapper.insert(record);
	}

	@Override
	public boolean ChangeIMgState(Long id, String state) {
		TCarousel bean = new TCarousel();
		bean.setId(id);
		bean.setIschoose(state);
		int count = mapper.UpdateState(bean);
		if (count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public int updateimg(TCarousel bean) {
		return mapper.updateimg(bean);
	}

	@Override
	public boolean Delete(Long id) {
		int count=mapper.Delete(id);
		if (count > 0) {
			return true;
		}
		return false;
	}

}
