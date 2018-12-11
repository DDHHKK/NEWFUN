package net.book.action;

import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.book.controller.Action;
import net.book.controller.ActionForward;
import net.book.db.BookBean;
import net.book.db.BookDAO;
import net.booking.db.BookingBean;
import net.booking.db.PaymentBean;
import net.host.db.HostBean;

public class BeforeTripList implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BeforeTripList execute()");
		//request 한글처리
		request.setCharacterEncoding("utf-8");
		
		//home_num파라미터 가져오기
		HttpSession session=request.getSession();
		String member_email=(String)session.getAttribute("email");
		
		
		
		
		BookDAO bdao=new BookDAO();
		Vector vector=bdao.GetBeforeTrip(member_email);
				
		List<BookingBean> bookingList=(List<BookingBean>)vector.get(0);
		List<PaymentBean> paymentList=(List<PaymentBean>)vector.get(1);
		List<HostBean> hostList=(List<HostBean>)vector.get(2);
		
        //request 저장 bb
		request.setAttribute("bookingList", bookingList);
		request.setAttribute("paymentList", paymentList);
		request.setAttribute("hostList", hostList);
		
				
		ActionForward forward=new ActionForward();
		//이동./myinfo/my_reserve.jsp
		forward.setRedirect(false); 
		forward.setPath("./myinfo/my_reserve.jsp");//포워딩 경로 설정
				
		return forward;
		
		
		
		
		
		
		
	}
	

}
