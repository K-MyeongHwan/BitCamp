package kr.or.bit.dto;

public class category_top {
	private int t_num;
	private String t_name;
	public category_top() {	}
	public category_top(int t_num, String t_name) {
		super();
		this.t_num = t_num;
		this.t_name = t_name;
	}
	public int getT_num() {
		return t_num;
	}
	public void setT_num(int t_num) {
		this.t_num = t_num;
	}
	public String getT_name() {
		return t_name;
	}
	public void setT_name(String t_name) {
		this.t_name = t_name;
	}
	@Override
	public String toString() {
		return "category_top [t_num=" + t_num + ", t_name=" + t_name + "]";
	}
	
	
	
}
