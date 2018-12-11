package net.book.controller;

public class ActionForward {
	
	//이동방식  true response.sendRedirect /false  forward
		private boolean redirect;
		//이동경로
		private String path;
		
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
