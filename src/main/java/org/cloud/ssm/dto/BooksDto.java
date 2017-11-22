package org.cloud.ssm.dto;

import org.cloud.ssm.domain.Books;

public class BooksDto extends BaseDto<Books> {

	private String sn;
	private String name;
	private String press;
	private String author;
	private String purchaseDate;
	private String unitPrice;
	private String remarks;
	private String status;
	private String filter;
	
	public String getFilter() {
		return filter;
	}
	public void setFilter(String filter) {
		this.filter = filter;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getSn() {
		return sn;
	}
	public void setSn(String sn) {
		this.sn = sn;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPress() {
		return press;
	}
	public void setPress(String press) {
		this.press = press;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPurchaseDate() {
		return purchaseDate;
	}
	public void setPurchaseDate(String purchaseDate) {
		this.purchaseDate = purchaseDate;
	}
	public String getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(String unitPrice) {
		this.unitPrice = unitPrice;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	@Override
    public Books generateBean() {
		Books books = new Books();
		books.setSn(sn);
		books.setAuthor(author);
		books.setName(name);
		books.setPress(press);
		books.setPurchaseDate(purchaseDate);
		books.setRemarks(remarks);
		if(!"".equals(remarks)) {
			books.setUnitPrice(Double.parseDouble(unitPrice));
		}
		if(!"".equals(getId())) {
			books.setId(Integer.parseInt(getId()));
		}
		return books;
    }
}
