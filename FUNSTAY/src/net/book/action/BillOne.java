package net.book.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.book.controller.Action;
import net.book.controller.ActionForward;
import net.book.db.BeforeBean;
import net.book.db.BookDAO;

public class BillOne implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("BillOne execute()");
		//request 한글처리
		request.setCharacterEncoding("utf-8");
		
		String payment_num=request.getParameter("payment_num");
		System.out.println(payment_num);
		
		BookDAO bdao=new BookDAO();
		BeforeBean BeforeB=bdao.GetOne(payment_num);
		request.setAttribute("BeforeB", BeforeB);
		
		ActionForward forward=new ActionForward();
		//이동./myinfo/my_reserve.jsp
		forward.setRedirect(false); 
		forward.setPath("./myinfo/my_reserve.jsp");//포워딩 경로 설정
		
		return forward;
	}
	

}
