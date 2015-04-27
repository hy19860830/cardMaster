/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.busi.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 公告发布Entity
 * @author yang.hu
 * @version 2015-04-13
 */
public class BusiPublic extends DataEntity<BusiPublic> {
	
	private static final long serialVersionUID = 1L;
	private String title;		// 公告标题
	private String content;		// 公告内容
	private String companyId;		// 归属公司编号
	private String companyName;		// 归属公司名称
	private String createId;		// 创建者工号
	private String createName;		// 创建者名称
	private String updateId;		// 更新者工号
	private String updateName;		// 更新者名称
	
	public BusiPublic() {
		super();
	}

	public BusiPublic(String id){
		super(id);
	}

	@Length(min=1, max=120, message="公告标题长度必须介于 1 和 120 之间")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	@Length(min=1, max=4000, message="公告内容长度必须介于 1 和4000 之间")
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	@Length(min=1, max=64, message="归属公司编号长度必须介于 1 和 64 之间")
	public String getCompanyId() {
		return companyId;
	}

	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}
	
	@Length(min=1, max=64, message="归属公司名称长度必须介于 1 和 64 之间")
	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	
	@Length(min=1, max=64, message="创建者工号长度必须介于 1 和 64 之间")
	public String getCreateId() {
		return createId;
	}

	public void setCreateId(String createId) {
		this.createId = createId;
	}
	
	@Length(min=1, max=64, message="创建者名称长度必须介于 1 和 64 之间")
	public String getCreateName() {
		return createName;
	}

	public void setCreateName(String createName) {
		this.createName = createName;
	}
	
	@Length(min=1, max=64, message="更新者工号长度必须介于 1 和 64 之间")
	public String getUpdateId() {
		return updateId;
	}

	public void setUpdateId(String updateId) {
		this.updateId = updateId;
	}
	
	@Length(min=1, max=64, message="更新者名称长度必须介于 1 和 64 之间")
	public String getUpdateName() {
		return updateName;
	}

	public void setUpdateName(String updateName) {
		this.updateName = updateName;
	}
	
}