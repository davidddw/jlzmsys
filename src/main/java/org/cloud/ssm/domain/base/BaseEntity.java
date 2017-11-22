package org.cloud.ssm.domain.base;

import java.io.Serializable;

public class BaseEntity implements Serializable {
	
	private static final long serialVersionUID = 1L;
	private int id;
	private String deleteSign;
	private String addBy;
	private String addDate;
	private String updateBy;
	private String updateDate;
	private String lockVersionCount;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDeleteSign() {
		return deleteSign;
	}
	public void setDeleteSign(String deleteSign) {
		this.deleteSign = deleteSign;
	}
	public String getAddBy() {
		return addBy;
	}
	public void setAddBy(String addBy) {
		this.addBy = addBy;
	}
	public String getAddDate() {
		return addDate;
	}
	public void setAddDate(String addDate) {
		this.addDate = addDate;
	}
	public String getUpdateBy() {
		return updateBy;
	}
	public void setUpdateBy(String updateBy) {
		this.updateBy = updateBy;
	}
	public String getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
	public String getLockVersionCount() {
		return lockVersionCount;
	}
	public void setLockVersionCount(String lockVersionCount) {
		this.lockVersionCount = lockVersionCount;
	}
}
