package net.book.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.book.controller.Action;
import net.book.controller.ActionForward;

public class My_reserve implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("My_reserve execute()");
		//request 한글처리
		request.setCharacterEncoding("utf-8");
		
		
		ActionForward forward=new ActionForward();
		return forward;
	}
	
	

}
