package kr.or.bit.dto;

public class category_bottom {

	private int b_num;
	private String b_name;
	private int m_num;
	
	public category_bottom() {	}
	
	public category_bottom(int b_num, String b_name, int m_num) {
		super();
		this.b_num = b_num;
		this.b_name = b_name;
		this.m_num = m_num;
	}
	public int getB_num() {
		return b_num;
	}
	public void setB_num(int b_num) {
		this.b_num = b_num;
	}
	public String getB_name() {
		return b_name;
	}
	public void setB_name(String b_name) {
		this.b_name = b_name;
	}
	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	@Override
	public String toString() {
		return "category_bottom [b_num=" + b_num + ", b_name=" + b_name + ", m_num=" + m_num + "]";
	}
	
	
}
