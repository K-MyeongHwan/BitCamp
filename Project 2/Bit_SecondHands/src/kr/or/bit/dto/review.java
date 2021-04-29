package kr.or.bit.dto;

import java.sql.Date;

public class review {

	
	private int rv_num;
	private int buy_num;
	private int p_num;
	private String rv_content;
	private int rv_star;
	private Date rv_date;
	private String storename;
	
	public review() {}

	public review(int rv_num, int buy_num, int p_num, String rv_content, int rv_star, Date rv_date, String storename) {
		super();
		this.rv_num = rv_num;
		this.buy_num = buy_num;
		this.p_num = p_num;
		this.rv_content = rv_content;
		this.rv_star = rv_star;
		this.rv_date = rv_date;
		this.storename = storename;
	}

	public int getRv_num() {
		return rv_num;
	}

	public void setRv_num(int rv_num) {
		this.rv_num = rv_num;
	}

	public int getBuy_num() {
		return buy_num;
	}

	public void setBuy_num(int buy_num) {
		this.buy_num = buy_num;
	}

	public int getP_num() {
		return p_num;
	}

	public void setP_num(int p_num) {
		this.p_num = p_num;
	}

	public String getRv_content() {
		return rv_content;
	}

	public void setRv_content(String rv_content) {
		this.rv_content = rv_content;
	}

	public int getRv_star() {
		return rv_star;
	}

	public void setRv_star(int rv_star) {
		this.rv_star = rv_star;
	}

	public Date getRv_date() {
		return rv_date;
	}

	public void setRv_date(Date rv_date) {
		this.rv_date = rv_date;
	}

	public String getStorename() {
		return storename;
	}

	public void setStorename(String storename) {
		this.storename = storename;
	}

	@Override
	public String toString() {
		return "review [rv_num=" + rv_num + ", buy_num=" + buy_num + ", p_num=" + p_num + ", rv_content=" + rv_content
				+ ", rv_star=" + rv_star + ", rv_date=" + rv_date + ", storename=" + storename + "]";
	}
	
		
	
}
