package net.review.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.FAQ.Action.FAQ_boardContentAction;
import net.FAQ.Action.FAQ_boardDeleteAction;
import net.FAQ.Action.FAQ_boardListAction;
import net.FAQ.Action.FAQ_boardUpdate;
import net.FAQ.Action.FAQ_boardUpdateAction;
import net.FAQ.Action.FAQ_boardWriteAction;
import net.review.action.ReviewListAction;




public class ReviewFrontController extends HttpServlet{
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//가상주소 뽑아오기
		// http://localhost:8080/Model2/FAQ_boardWrite.fa
		String requestURI=request.getRequestURI ();
		
		String contextPath=request.getContextPath();
	
		String command=requestURI.substring(contextPath.length());
		
		System.out.println("뽑아온 가상주소 : "+command);
		//뽑아온 가상주소 비교
		ActionForward forward=null;
		Action action=null;
		
		//list
		if (command.equals("/ReviewList.re")){
			action = new ReviewListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace(
						);
			}
		}
		
		
			
		//이동
		if(forward!=null){ //forward정보가 있으면
			if(forward.isRedirect()){
				//true sendRedirect()
				response.sendRedirect(forward.getPath());
			}else{
				//false forward()
				RequestDispatcher dispatcher
				=request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	}
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
}
