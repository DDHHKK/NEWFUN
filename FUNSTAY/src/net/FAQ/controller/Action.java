package net.FAQ.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action { //클래스 틀
	//추상메서드 : 메서드 틀
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception;
	// request,response 항상 가지고 다니면서 처리
	//예외처리는 메서드 호출하는 곳에서 처리
	// 처리작업 후에 이동 => 이동정보를 저장(ActionForward)해서 가지고 감
}
