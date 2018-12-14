package net.book.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.book.controller.Action;
import net.book.controller.ActionForward;
import net.book.db.BookDAO;
import net.booking.db.BookingBean;
import net.booking.db.PaymentBean;

public class BillCancel implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BillCancel execute()");
		//request 한글처리
		request.setCharacterEncoding("utf-8");
		
		int booking_num=Integer.parseInt(request.getParameter("booking_num"));
		String payment_num=request.getParameter("payment_num");
		
		System.out.println(booking_num);
		System.out.println(payment_num);
		
		BookDAO bdao=new BookDAO();
		BookingBean bb=new BookingBean();
		PaymentBean pb=new PaymentBean();
		
		bdao.BillCancel(payment_num, booking_num);
		
		
		
		
		ActionForward forward=new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./MyReserve.bk");
		
		return forward;
	}
	

}
