package org.cloud.ssm.dto;

import org.cloud.ssm.domain.WorkCalendar;

public class WorkCalendarDto extends BaseDto<WorkCalendar> {
	
	private String ymd;
	private String hldSgn;
	private String memo;
	private String filter;
	
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
	
	public String getFilter() {
		return filter;
	}
	public void setFilter(String filter) {
		this.filter = filter;
	}
	@Override
    public WorkCalendar generateBean() {
	    WorkCalendar workCalendar = new WorkCalendar();
	    workCalendar.setMemo(memo);
	    workCalendar.setYmd(ymd);
	    workCalendar.setHldSgn(hldSgn);
	    if(!"".equals(getId())) {
	    	workCalendar.setId(Integer.parseInt(getId()));
		}
	    return workCalendar;
    }
}
