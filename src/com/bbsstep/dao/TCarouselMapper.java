package com.bbsstep.dao;

import java.util.List;

import com.bbsstep.po.TCarousel;
import com.bbsstep.util.DataTablePageUtil;

public interface TCarouselMapper {

	List<TCarousel> selectByParam(DataTablePageUtil<TCarousel> dataTablePageUtil);

	int selectNumByParam(DataTablePageUtil<TCarousel> param);

	int insert(TCarousel bean);

	int UpdateState(TCarousel bean);

	int updateimg(TCarousel bean);

	int Delete(Long id);

}
