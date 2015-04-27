/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.busi.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.busi.entity.BusiPublic;

/**
 * 公告发布DAO接口
 * @author yang.hu
 * @version 2015-04-13
 */
@MyBatisDao
public interface BusiPublicDao extends CrudDao<BusiPublic> {
	
}