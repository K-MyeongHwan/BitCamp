package kr.or.bit.dto;
/*
create table memo {
id varchar2(15) not null,
email varchar2(20) not null,
content varchar2(100)
}

select id, email, content from memo where id=? 
> 데이터 1건을 담을 수 있는 클래스
> hong, hong@naver.com , 방가방가

DTO --> DB 에 Table 구조와 똑같이 만들면 됨 --> 자동화

테이블과 1:1 로 설계

 */
public class memo {
	private String id;
	private String email;
	private String content;
	
	public memo() {
		
	}
	
	public memo(String id, String email, String content) {
		super();
		this.id = id;
		this.email = email;
		this.content = content;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "memo [id=" + id + ", email=" + email + ", content=" + content + "]";
	}
	
	
}
