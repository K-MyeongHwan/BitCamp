package kr.or.bit.dto;


import java.util.Date;

public class product {
	private int p_num;
	private int b_num;
	private String storename;
	private String p_addr;
	private String p_subj;
	private String p_dcharge;
	private int p_price;
	private String p_content;
	private Date p_wr_time;
	private Date p_ed_time;
	private String p_status;
	
	@Override
	public String toString() {
		return "product [p_num=" + p_num + ", b_num=" + b_num + ", storename=" + storename + ", p_addr=" + p_addr
				+ ", p_subj=" + p_subj + ", p_dcharge=" + p_dcharge + ", p_price=" + p_price + ", p_content="
				+ p_content + ", p_wr_time=" + p_wr_time + ", p_ed_time=" + p_ed_time + ", p_status=" + p_status + "]";
	}

	public int getP_num() {
		return p_num;
	}

	public void setP_num(int p_num) {
		this.p_num = p_num;
	}

	public int getB_num() {
		return b_num;
	}

	public void setB_num(int b_num) {
		this.b_num = b_num;
	}

	public String getStorename() {
		return storename;
	}

	public void setStorename(String storename) {
		this.storename = storename;
	}

	public String getP_addr() {
		return p_addr;
	}

	public void setP_addr(String p_addr) {
		this.p_addr = p_addr;
	}

	public String getP_subj() {
		return p_subj;
	}

	public void setP_subj(String p_subj) {
		this.p_subj = p_subj;
	}

	public String getP_dcharge() {
		return p_dcharge;
	}

	public void setP_dcharge(String p_dcharge) {
		this.p_dcharge = p_dcharge;
	}

	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	public String getP_content() {
		return p_content;
	}

	public void setP_content(String p_content) {
		this.p_content = p_content;
	}

	public Date getP_wr_time() {
		return p_wr_time;
	}

	public void setP_wr_time(Date p_wr_time) {
		this.p_wr_time = p_wr_time;
	}

	public Date getP_ed_time() {
		return p_ed_time;
	}

	public void setP_ed_time(Date p_ed_time) {
		this.p_ed_time = p_ed_time;
	}

	public String getP_status() {
		return p_status;
	}

	public void setP_status(String p_status) {
		this.p_status = p_status;
	}

	public product() {};
	
	public product(int p_num, int b_num, String storename, String p_addr, String p_subj, String p_dcharge, int p_price,
			String p_content, Date p_wr_time, Date p_ed_time, String p_status) {
		super();
		this.p_num = p_num;
		this.b_num = b_num;
		this.storename = storename;
		this.p_addr = p_addr;
		this.p_subj = p_subj;
		this.p_dcharge = p_dcharge;
		this.p_price = p_price;
		this.p_content = p_content;
		this.p_wr_time = p_wr_time;
		this.p_ed_time = p_ed_time;
		this.p_status = p_status;
	};
	
	
	
/*
	private String name;
	private int age;
	private String addr;
	private String image ="images/main_0.jpg";
	
	
	public product(String name, int age, String addr) {
		
		this.name = name;
		this.age = age;
		this.addr = addr;
	}
	
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}

	*/
}
