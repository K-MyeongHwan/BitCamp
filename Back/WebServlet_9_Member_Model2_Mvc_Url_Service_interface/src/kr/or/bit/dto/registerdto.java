package kr.or.bit.dto;

public class registerdto {
	private int id;
	private String pwd;
	private String email;
	
	//필요에 따라서 생성자 추가 ...
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	@Override
	public String toString() {
		return "mvcregister [id=" + id + ", pwd=" + pwd + ", email=" + email + "]";
	}
}
