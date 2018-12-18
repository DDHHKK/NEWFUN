package net.booking.action;

import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.booking.db.BookingDAO;

public class Booking implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("Booking execute()");
		ActionForward forward = new ActionForward();
		
		HttpSession session = request.getSession();
		String member_email = (String)session.getAttribute("email");
		request.setCharacterEncoding("utf-8");
		String home_num = request.getParameter("home_num");
		String room_subject = request.getParameter("room_subject");
		String check_in = request.getParameter("check_in");
		String check_out = request.getParameter("check_out");
		int people = Integer.parseInt(request.getParameter("text00"));
		String host_email = request.getParameter("host_email");
		//int home_num = 3;
		//int [] room_num = {8,9};
		//String check_in = "2018-11-20";
		//Date check_in = Date.valueOf("2018-11-20");
		//String check_out = "2018-11-26";
		//Date check_out = Date.valueOf("2018-11-26");
		
		int price = 50000;
		//int people = 11;
		
		//String member_email = "funfun@gmail.com";
		//String request_msg ="2,3번방 예약했어요. 문의답변으로 2번방에는 침구, 2번방에는 간이베드 추가된다고 하셨는데 잊지 말고 잘 준비해주세요! :)";
		//String host_email = "jeju@gmail.com";
		int storage_m = 1255;
		//int used_m = 0;
		int fees = 25500;
		int sum_price=500000;
		
		BookingDAO bdao = new BookingDAO();
		int getMileage = bdao.getmileage(member_email);
		System.out.println(getMileage);
		
		request.setAttribute("home_num", home_num);
		//request.setAttribute("room_num[0]", room_num[0]);
		//request.setAttribute("room_num[1]", room_num[1]);
		request.setAttribute("check_in", check_in);	
		request.setAttribute("check_out", check_out);	
		request.setAttribute("price", price);	
		request.setAttribute("people", people);	
		//request.setAttribute("member_email", member_email);
		//request.setAttribute("request_msg", request_msg);
		request.setAttribute("host_email", host_email);
		request.setAttribute("storage_m", storage_m);
		//request.setAttribute("used_m", used_m);
		request.setAttribute("fees", fees);
		request.setAttribute("sum_price", sum_price);
		request.setAttribute("room_subject", room_subject);
		request.setAttribute("getMileage", getMileage);
		
		System.out.println(request.getAttribute("check_in"));
		System.out.println(request.getAttribute("check_out"));
		System.out.println(request.getAttribute("getMileage"));
		forward.setRedirect(false);
		forward.setPath("./payment/PaymentForm.jsp");
		return forward;
	}
	
	

}
