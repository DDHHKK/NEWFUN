package net.book.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.book.controller.Action;
import net.book.controller.ActionForward;

public class BeforeTripDetail implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BeforeTripDetail execute()");
		//request 한글처리
		request.setCharacterEncoding("utf-8");
		return null;
	}
	

}
