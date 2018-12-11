package net.search.controller;

public class ActionForward {
	private boolean redirect; //이동방식 true sendRedirect()
	                  //false forward()
	private String path; //이동경로
	
	public boolean isRedirect() {
		return redirect;
	}
	public void setRedirect(boolean redirect) {
		this.redirect = redirect;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	
	
}
