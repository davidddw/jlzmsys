package org.cloud.ssm.domain;

import org.cloud.ssm.domain.base.BaseEntity;

public class Attendance extends BaseEntity {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String ymd;
	private String userId;
	private String attdncDiv;
	private String strwkTime;
	private String endwkTime;
	private int lateTime;
	private int earlyTime;
	private int absncTime;
	private double absentHours;
	private int ovtmwkTime;
	private int wkTime;
	private String attdncChgRsnDiv;
	private String attdncChgRsnCont;
	private String attdncImpRsltCd;
	private String cpsthldTimeWork;
	private String cpsthldTimeHld;
	private String cpsthldTimeOffhld;
	private int hldRest;
	private int hldLieu;
	private int hldSick;
	private int hldLeave;
	private int hldMarry;
	private int hldMater;
	private int hldFuner;
	private int hldBusin;
	private int hldOther;
	private int punCardTimes;
	private int forCardTimes;
	private String remarks;
	private String workOnDes;
	private String workOffDes;
	public String getYmd() {
		return ymd;
	}
	public void setYmd(String ymd) {
		this.ymd = ymd;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getAttdncDiv() {
		return attdncDiv;
	}
	public void setAttdncDiv(String attdncDiv) {
		this.attdncDiv = attdncDiv;
	}
	public String getStrwkTime() {
		return strwkTime;
	}
	public void setStrwkTime(String strwkTime) {
		this.strwkTime = strwkTime;
	}
	public String getEndwkTime() {
		return endwkTime;
	}
	public void setEndwkTime(String endwkTime) {
		this.endwkTime = endwkTime;
	}
	public int getLateTime() {
		return lateTime;
	}
	public void setLateTime(int lateTime) {
		this.lateTime = lateTime;
	}
	public int getEarlyTime() {
		return earlyTime;
	}
	public void setEarlyTime(int earlyTime) {
		this.earlyTime = earlyTime;
	}
	public int getAbsncTime() {
		return absncTime;
	}
	public void setAbsncTime(int absncTime) {
		this.absncTime = absncTime;
	}
	public double getAbsentHours() {
		return absentHours;
	}
	public void setAbsentHours(double absentHours) {
		this.absentHours = absentHours;
	}
	public int getOvtmwkTime() {
		return ovtmwkTime;
	}
	public void setOvtmwkTime(int ovtmwkTime) {
		this.ovtmwkTime = ovtmwkTime;
	}
	public int getWkTime() {
		return wkTime;
	}
	public void setWkTime(int wkTime) {
		this.wkTime = wkTime;
	}
	public String getAttdncChgRsnDiv() {
		return attdncChgRsnDiv;
	}
	public void setAttdncChgRsnDiv(String attdncChgRsnDiv) {
		this.attdncChgRsnDiv = attdncChgRsnDiv;
	}
	public String getAttdncChgRsnCont() {
		return attdncChgRsnCont;
	}
	public void setAttdncChgRsnCont(String attdncChgRsnCont) {
		this.attdncChgRsnCont = attdncChgRsnCont;
	}
	public String getAttdncImpRsltCd() {
		return attdncImpRsltCd;
	}
	public void setAttdncImpRsltCd(String attdncImpRsltCd) {
		this.attdncImpRsltCd = attdncImpRsltCd;
	}
	public String getCpsthldTimeWork() {
		return cpsthldTimeWork;
	}
	public void setCpsthldTimeWork(String cpsthldTimeWork) {
		this.cpsthldTimeWork = cpsthldTimeWork;
	}
	public String getCpsthldTimeHld() {
		return cpsthldTimeHld;
	}
	public void setCpsthldTimeHld(String cpsthldTimeHld) {
		this.cpsthldTimeHld = cpsthldTimeHld;
	}
	public String getCpsthldTimeOffhld() {
		return cpsthldTimeOffhld;
	}
	public void setCpsthldTimeOffhld(String cpsthldTimeOffhld) {
		this.cpsthldTimeOffhld = cpsthldTimeOffhld;
	}
	public int getHldRest() {
		return hldRest;
	}
	public void setHldRest(int hldRest) {
		this.hldRest = hldRest;
	}
	public int getHldLieu() {
		return hldLieu;
	}
	public void setHldLieu(int hldLieu) {
		this.hldLieu = hldLieu;
	}
	public int getHldSick() {
		return hldSick;
	}
	public void setHldSick(int hldSick) {
		this.hldSick = hldSick;
	}
	public int getHldLeave() {
		return hldLeave;
	}
	public void setHldLeave(int hldLeave) {
		this.hldLeave = hldLeave;
	}
	public int getHldMarry() {
		return hldMarry;
	}
	public void setHldMarry(int hldMarry) {
		this.hldMarry = hldMarry;
	}
	public int getHldMater() {
		return hldMater;
	}
	public void setHldMater(int hldMater) {
		this.hldMater = hldMater;
	}
	public int getHldFuner() {
		return hldFuner;
	}
	public void setHldFuner(int hldFuner) {
		this.hldFuner = hldFuner;
	}
	public int getHldBusin() {
		return hldBusin;
	}
	public void setHldBusin(int hldBusin) {
		this.hldBusin = hldBusin;
	}
	public int getHldOther() {
		return hldOther;
	}
	public void setHldOther(int hldOther) {
		this.hldOther = hldOther;
	}
	public int getPunCardTimes() {
		return punCardTimes;
	}
	public void setPunCardTimes(int punCardTimes) {
		this.punCardTimes = punCardTimes;
	}
	public int getForCardTimes() {
		return forCardTimes;
	}
	public void setForCardTimes(int forCardTimes) {
		this.forCardTimes = forCardTimes;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getWorkOnDes() {
		return workOnDes;
	}
	public void setWorkOnDes(String workOnDes) {
		this.workOnDes = workOnDes;
	}
	public String getWorkOffDes() {
		return workOffDes;
	}
	public void setWorkOffDes(String workOffDes) {
		this.workOffDes = workOffDes;
	}
}
