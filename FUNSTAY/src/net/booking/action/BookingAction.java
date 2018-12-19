package net.booking.action;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.booking.db.BookingBean;
import net.booking.db.BookingDAO;
import net.booking.db.PaymentBean;

public class BookingAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("bookingAction execute()");
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String member_email = (String)session.getAttribute("email");
		String check_in = request.getParameter("check_in");
		String check_out = request.getParameter("check_out");
		int people = Integer.parseInt(request.getParameter("people"));
		String host_email = request.getParameter("host_email");
		int fees = Integer.parseInt(request.getParameter("fees"));
		int sum_price= Integer.parseInt(request.getParameter("sum_price"));
		int home_num = Integer.parseInt(request.getParameter("home_num"));
		String room_subject = request.getParameter("room_subject");
		String request_msg = request.getParameter("request_msg");
		int storage_m = Integer.parseInt(request.getParameter("storage_m"));
		int used_m = Integer.parseInt(request.getParameter("used_m"));
		String payment_status = "결제완료";
		int room_price = Integer.parseInt(request.getParameter("room_price"));
		int add_price = Integer.parseInt(request.getParameter("add_price"));
		int price = Integer.parseInt(request.getParameter("price")); 
		
		//payment테이블에 들어갈 내용 paymentbean에 저장
		PaymentBean pb = new PaymentBean();
		pb.setFees(fees);
		pb.setHost_email(host_email);
		pb.setMember_email(member_email);
		pb.setPayment_status(payment_status);
		pb.setRequest_msg(request_msg);
		pb.setStorage_m(storage_m);
		pb.setUsed_m(used_m);
		pb.setSum_price(sum_price);
		
		BookingBean bb = new BookingBean();
		bb.setAdd_price(add_price);
		bb.setRoom_price(room_price);
		bb.setHome_num(home_num);
		bb.setPeople(people);
		
		BookingDAO bdao = new BookingDAO();
		//결제 내역과 정보를 payment테이블에 저장
		bdao.insertPayment(pb, bb, check_in, check_out);;
		
		//보유 마일리지 업데이트
		//bdao.updatemileage(member_email);
		//보유 캐시 업데이트
		//bdao.updateCash(host_email);
		//결제 정보를 booking 테이블에 저장
		request.setAttribute("room_subject", room_subject);
		request.setAttribute("room_subject", room_subject);
		request.setAttribute("storage_m", storage_m);
		request.setAttribute("used_m", used_m);
		request.setAttribute("sum_price", sum_price);
		request.setAttribute("check_in", check_in);
		request.setAttribute("check_out", check_out);
		request.setAttribute("people", people);
		
		
		forward.setRedirect(false);
		forward.setPath("./payment/Payment_Complete.jsp");
		
		return forward;
	}

}
