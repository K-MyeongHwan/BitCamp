package kr.or.bit.action;

//이 클래스의 역할은 servlet이 요청을 받으면 
//1.  화면을 보여 주기
//2.  1번에서 보여준 화면에 요청 처리

//그래서 여기서 처리 할 거는 화면이냐 로직이냐 뷰의 경로
public class ActionForward {
	private boolean isRedirect = false; // 화면 전환 여부 
	private String path = null; // 이동경로 (뷰의 주소)
	
	public boolean isRedirect() {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}

	


}
