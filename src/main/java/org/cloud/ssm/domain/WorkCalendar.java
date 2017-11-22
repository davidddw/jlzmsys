package org.cloud.ssm.domain;

import org.cloud.ssm.domain.base.BaseEntity;

public class WorkCalendar extends BaseEntity {
	/**
	 * 
	 */
    private static final long serialVersionUID = 1L;
	private String ymd;
	private String hldSgn;
	private String memo;
	
	public String getYmd() {
		return ymd;
	}
	public void setYmd(String ymd) {
		this.ymd = ymd;
	}
	public String getHldSgn() {
		return hldSgn;
	}
	public void setHldSgn(String hldSgn) {
		this.hldSgn = hldSgn;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	@Override
    public String toString() {
	    return "WorkCalendar [ymd=" + ymd + ", hldSgn=" + hldSgn + ", memo=" + memo + "]";
    }
	
	
}
