package net.member.action;

public class ActionForward {
	/**
	 * @uml.property  name="isRedirect"
	 */
	private boolean isRedirect=false;
	/**
	 * @uml.property  name="path"
	 */
	private String path=null;
	
	/**
	 * @return
	 * @uml.property  name="isRedirect"
	 */
	public boolean isRedirect(){
		return isRedirect;
	}
	
	/**
	 * @return
	 * @uml.property  name="path"
	 */
	public String getPath(){
		return path;
	}
	
	public void setRedirect(boolean b){
		isRedirect=b;
	}
	
	/**
	 * @param string
	 * @uml.property  name="path"
	 */
	public void setPath(String string){
		path=string;
	}
}