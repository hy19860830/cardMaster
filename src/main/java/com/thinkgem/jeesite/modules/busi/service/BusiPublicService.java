/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.busi.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.busi.entity.BusiPublic;
import com.thinkgem.jeesite.modules.busi.dao.BusiPublicDao;

/**
 * 公告发布Service
 * @author yang.hu
 * @version 2015-04-13
 */
@Service
@Transactional(readOnly = true)
public class BusiPublicService extends CrudService<BusiPublicDao, BusiPublic> {

	public BusiPublic get(String id) {
		return super.get(id);
	}
	
	public List<BusiPublic> findList(BusiPublic busiPublic) {
		return super.findList(busiPublic);
	}
	
	public Page<BusiPublic> findPage(Page<BusiPublic> page, BusiPublic busiPublic) {
		return super.findPage(page, busiPublic);
	}
	
	@Transactional(readOnly = false)
	public void save(BusiPublic busiPublic) {
		super.save(busiPublic);
	}
	
	@Transactional(readOnly = false)
	public void delete(BusiPublic busiPublic) {
		super.delete(busiPublic);
	}
	
}