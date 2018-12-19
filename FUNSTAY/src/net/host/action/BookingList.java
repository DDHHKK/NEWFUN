package net.host.action;

import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.booking.db.BookingBean;
import net.booking.db.BookingDAO;
import net.booking.db.PaymentBean;
import net.member.db.MemberDAO;
import net.member.db.QnaBean;

public class BookingList implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("BookingList execute()");
		int room_num = Integer.parseInt(request.getParameter("home_num"));
		HttpSession session = request.getSession();
		String member_email = (String)session.getAttribute("email");
		ActionForward forward = new ActionForward();
		
		if(member_email==null)
		{
			forward.setRedirect(false);
			forward.setPath("./Main.me");
			return forward;
		}
		
		
		BookingDAO bdao = new BookingDAO();
		MemberDAO mdao = new MemberDAO();
		Vector<?> vector = bdao.getBookingList(room_num,member_email);
	
		List<BookingBean> bookinglist = (List<BookingBean>) vector.get(0);
		List<PaymentBean> paymentlist=(List<PaymentBean>) vector.get(1);
		List<QnaBean> q_list = mdao.getQnAList_host(room_num);
		
		
		request.setAttribute("q_list", q_list);
		request.setAttribute("bookinglist", bookinglist);
		request.setAttribute("paymentlist", paymentlist);
		
		forward.setRedirect(false);
		forward.setPath("./host/host_book_check.jsp");
		return forward;
	}

}
