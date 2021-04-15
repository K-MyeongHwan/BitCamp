package kr.or.bit.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response);
	//당신이 만약 Action 구현한다면
	//강제 사항으로 execute함수를 반드시 구현
	//excute(){return new ActionForward();} 강제
}
