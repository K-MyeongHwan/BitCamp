package Board.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
	//메서드
	public ActionForward execute(
			HttpServletRequest request,
			HttpServletResponse response) throws Exception;
}
