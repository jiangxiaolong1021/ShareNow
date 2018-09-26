package com.bbsstep.service;


import com.bbsstep.po.TCarousel;
import com.bbsstep.util.DataTablePageUtil;


public interface TCarouselService {

	public DataTablePageUtil<TCarousel> getlist(DataTablePageUtil<TCarousel> param);
	
	public int add(TCarousel record);

	public boolean ChangeIMgState(Long id ,String state);

	public int updateimg(TCarousel bean);

	public boolean Delete(Long id);

	
	
}
