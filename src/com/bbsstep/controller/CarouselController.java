package com.bbsstep.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bbsstep.po.TCarousel;
import com.bbsstep.po.TSystemUser;
import com.bbsstep.service.TCarouselService;
import com.bbsstep.util.DataTablePageUtil;

@Controller
@RequestMapping("/carousel")
public class CarouselController {

	@Autowired
	private TCarouselService service;

	/*
	 *
	 * 启动页手机开屏广告的显示、添加、修改和删除
	 * 
	 */
	@RequestMapping("/peacocklist")
	@ResponseBody
	public DataTablePageUtil<TCarousel> peacocklist(WebRequest request) {
		DataTablePageUtil<TCarousel> dataTable = new DataTablePageUtil<TCarousel>(request);
		// 设置查询类型为开屏广告(a)
		dataTable.getCondition().put("type", "a");
		return service.getlist(dataTable);
	}

	@RequestMapping("/peacockAdd")
	public ModelAndView peacockAdd(TCarousel bean, MultipartFile myfiles, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		// 原始文件名称
		String pictureFile_name = myfiles.getOriginalFilename();
		// 新文件名称
		String newFileName = UUID.randomUUID().toString()
				+ pictureFile_name.substring(pictureFile_name.lastIndexOf("."));

		// 上传图片
		File uploadPic = new java.io.File("E:\\cihsi\\imgs\\" + newFileName);

		if (!uploadPic.exists()) {
			uploadPic.mkdirs();
		}
		// 向磁盘写文件
		try {
			myfiles.transferTo(uploadPic);
		} catch (IllegalStateException | IOException e) {
			mv.addObject("msg", "开屏广告上传失败");
			e.printStackTrace();
		}
		bean.setPath("upload/" + newFileName);
		TSystemUser user = (TSystemUser) session.getAttribute("loginUser");
		bean.setUserId(user.getId());
		String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		bean.setCreatetime(time);
		bean.setEdittime(time);
		bean.setIschoose("f");
		bean.setType("a");

		// 保存到数据库
		try {
			int row = service.add(bean);
			if (row == 0) {
				mv.addObject("msg", "开屏广告新增失败");
			} else {
				mv.addObject("msg", "开屏广告新增成功");
			}
		} catch (Exception ex) {
			mv.addObject("msg", "开屏广告新增失败");
		}
		mv.setViewName("redirect:/pages/operconfig/peacock/peacock_list.jsp");
		return mv;
	}

	@RequestMapping(value = "/ChangePeacock", method = RequestMethod.POST)
	public ModelAndView ChangePeacock(String title, Integer weight, String ischoose, String imageFrontOld, Long id,
			MultipartFile myfiles, HttpSession session) {
		TCarousel bean = new TCarousel();
		bean.setId(id);
		bean.setTitle(title);
		bean.setWeight(weight);
		bean.setIschoose(ischoose);

//		File delloadPic = new java.io.File(imageFrontOld);
//		if (!delloadPic.exists()) {
//		} else {
//			delloadPic.delete();
//		}
		ModelAndView mv = new ModelAndView();
		// 原始文件名称
		String pictureFile_name = myfiles.getOriginalFilename();
		// 新文件名称
		String newFileName = UUID.randomUUID().toString()
				+ pictureFile_name.substring(pictureFile_name.lastIndexOf("."));

		// 上传图片
		File uploadPic = new java.io.File("E:\\cihsi\\imgs\\" + newFileName);
		// 判断是否存在
		if (!uploadPic.exists()) {

			uploadPic.mkdirs();
		}

		// 向磁盘写文件
		try {
			myfiles.transferTo(uploadPic);
		} catch (IllegalStateException | IOException e) {
			mv.addObject("msg", "开屏广告上传失败");
			e.printStackTrace();
		}

		TSystemUser user = (TSystemUser) session.getAttribute("loginUser");
		bean.setUserId(user.getId());
		bean.setPath("upload/" + newFileName);
		String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		bean.setCreatetime(time);
		bean.setEdittime(time);
		// 保存到数据库
		try {
			int row = service.updateimg(bean);
			if (row == 0) {
				mv.addObject("msg", "开屏广告修改失败");
			} else {
				mv.addObject("msg", "开屏广告修改成功");
			}
		} catch (Exception ex) {
			mv.addObject("msg", "开屏广告修改失败");
		}
		mv.setViewName("redirect:/pages/operconfig/peacock/peacock_list.jsp");
		return mv;

	}

	@RequestMapping(value = "/deletepeacock", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView DeletePeacock(Long id) {

		ModelAndView mv = new ModelAndView();
		service.Delete(id);
		mv.setViewName("redirect:/pages/operconfig/peacock/peacock_list.jsp");
		return mv;
	}

	/*
	 * 
	 * 开屏广告和引导页状态的修改
	 * 
	 */
	@RequestMapping(value = "/changestate", method = RequestMethod.GET)
	public ModelAndView ChangeImgState(Long id, String state) {
		ModelAndView mv = new ModelAndView();
		service.ChangeIMgState(id, state);
		if (state.equals("t")) {

			mv.setViewName("redirect:/pages/operconfig/peacock/peacock_list.jsp");

		} else {

			mv.setViewName("redirect:/pages/operconfig/carousel/guid_list.jsp");
		}

		return mv;
	}

	/*
	 * 
	 * 引导页手机开机引导图的显示、添加、修改和删除
	 * 
	 */
	@RequestMapping("/guidlist")
	@ResponseBody
	public DataTablePageUtil<TCarousel> list(WebRequest request) {
		DataTablePageUtil<TCarousel> dataTable = new DataTablePageUtil<TCarousel>(request);
		// 设置查询类型为引导图片(y)
		dataTable.getCondition().put("type", "y");
		return service.getlist(dataTable);
	}

	@RequestMapping("/guidAdd")
	public ModelAndView guidAdd(TCarousel bean, MultipartFile myfiles, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		// 原始文件名称
		String pictureFile_name = myfiles.getOriginalFilename();
		// 新文件名称
		String newFileName = UUID.randomUUID().toString()
				+ pictureFile_name.substring(pictureFile_name.lastIndexOf("."));

		// 上传图片
		File uploadPic = new java.io.File("E:\\cihsi\\imgs\\" + newFileName);

		if (!uploadPic.exists()) {
			uploadPic.mkdirs();
		}
		// 向磁盘写文件
		try {
			myfiles.transferTo(uploadPic);
		} catch (IllegalStateException | IOException e) {
			mv.addObject("msg", "引导图上传失败");
			e.printStackTrace();
		}
		bean.setPath("upload/" + newFileName);
		TSystemUser user = (TSystemUser) session.getAttribute("loginUser");
		bean.setUserId(user.getId());
		String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		bean.setCreatetime(time);
		bean.setEdittime(time);
		bean.setIschoose("f");
		bean.setType("y");

		// 保存到数据库
		try {
			int row = service.add(bean);
			if (row == 0) {
				mv.addObject("msg", "引导图新增失败");
			} else {
				mv.addObject("msg", "引导图新增成功");
			}
		} catch (Exception ex) {
			mv.addObject("msg", "引导图新增失败");
		}
		mv.setViewName("redirect:/pages/operconfig/carousel/guid_list.jsp");
		return mv;
	}

	@RequestMapping(value = "/ChangeGuid", method = RequestMethod.POST)
	public ModelAndView ChangeGuid(String title, Integer weight, String ischoose, String imageFrontOld, Long id,
			MultipartFile myfiles, HttpSession session) {
		TCarousel bean = new TCarousel();
		bean.setId(id);
		bean.setTitle(title);
		bean.setWeight(weight);
		bean.setIschoose(ischoose);

//		File delloadPic = new java.io.File(imageFrontOld);
//		if (!delloadPic.exists()) {
//		} else {
//			delloadPic.delete();
//		}
		ModelAndView mv = new ModelAndView();
		// 原始文件名称
		String pictureFile_name = myfiles.getOriginalFilename();
		// 新文件名称
		String newFileName = UUID.randomUUID().toString()
				+ pictureFile_name.substring(pictureFile_name.lastIndexOf("."));

		// 上传图片
		File uploadPic = new java.io.File("E:\\cihsi\\imgs\\" + newFileName);
		// 判断是否存在
		if (!uploadPic.exists()) {

			uploadPic.mkdirs();
		}

		// 向磁盘写文件
		try {
			myfiles.transferTo(uploadPic);
		} catch (IllegalStateException | IOException e) {
			mv.addObject("msg", "引导图上传失败");
			e.printStackTrace();
		}

		TSystemUser user = (TSystemUser) session.getAttribute("loginUser");
		bean.setUserId(user.getId());
		bean.setPath("upload/" + newFileName);
		String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		bean.setCreatetime(time);
		bean.setEdittime(time);
		// 保存到数据库
		try {
			int row = service.updateimg(bean);
			if (row == 0) {
				mv.addObject("msg", "引导图修改失败");
			} else {
				mv.addObject("msg", "引导图修改成功");
			}
		} catch (Exception ex) {
			mv.addObject("msg", "引导图修改失败");
		}
		mv.setViewName("redirect:/pages/operconfig/carousel/guid_list.jsp");
		return mv;

	}

	@RequestMapping(value = "/deleteguid", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView DeleteGuid(Long id) {

		ModelAndView mv = new ModelAndView();
		service.Delete(id);
		mv.setViewName("redirect:/pages/operconfig/carousel/guid_list.jsp");
		return mv;
	}

}
