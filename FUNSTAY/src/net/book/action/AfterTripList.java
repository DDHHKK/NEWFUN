package net.book.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.book.controller.Action;
import net.book.controller.ActionForward;

public class AfterTripList implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AfterTripList execute()");
		//request 한글처리
		request.setCharacterEncoding("utf-8");
		return null;
	}
	
	

}
