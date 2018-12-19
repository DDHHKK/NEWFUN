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
		//int people = Integer.parseInt(request.getParameter("text00"));
		String host_email = request.getParameter("host_email");
		//int home_num = 3;
		//int [] room_num = {8,9};
		//String check_in = "2018-11-20";
		//Date check_in = Date.valueOf("2018-11-20");
		//String check_out = "2018-11-26";
		//Date check_out = Date.valueOf("2018-11-26");
		int price = Integer.parseInt(request.getParameter("price11"));
		int select_people = Integer.parseInt(request.getParameter("select_people"));
		int max_people = Integer.parseInt(request.getParameter("R_max_people"));
		int basic_people = Integer.parseInt(request.getParameter("basic_people"));
		int days = Integer.parseInt(request.getParameter("days00"));
		System.out.println(price);
		System.out.println(select_people);
		System.out.println(max_people);
		System.out.println(basic_people);
		System.out.println(days);
		int add_people = 0;
		int add_price = 0;
		int people = 0;
		//int price = 50000;
		//int people = 11;
		
		if(select_people>basic_people){
			add_people=select_people-basic_people;
			select_people = basic_people;
			// 추가요금 -> 10000*add_people*days
			add_price = 10000*add_people*days;
		}
		// 기본요금 -> price*days
		int basic_price = price*days;
		// 예약일수 -> days
		int reserve_days = days;
		// 수수료 -> (basic_price+add_price)/20
		int fees = (basic_price+add_price)/20;
		// 적립예정 마일리지 -> (basic_price+add_price)/100
		int storage_m = (basic_price+add_price)/100;
		
		// 결제 합계  basic_price+add_price+fees
		int sum_price = basic_price+add_price+fees;
		
		
		// 예약 인원
		people = select_people+add_people;
		
		//String member_email = "funfun@gmail.com";
		//String request_msg ="2,3번방 예약했어요. 문의답변으로 2번방에는 침구, 2번방에는 간이베드 추가된다고 하셨는데 잊지 말고 잘 준비해주세요! :)";
		//String host_email = "jeju@gmail.com";
		//int storage_m = 1255;
		//int used_m = 0;
		//int fees = 25500;
		//int sum_price=500000;
		
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
		request.setAttribute("select_people", select_people);
		request.setAttribute("max_people", max_people);
		request.setAttribute("basic_people", basic_people);
		request.setAttribute("days", days);
		request.setAttribute("member_email", member_email);
		request.setAttribute("basic_price", basic_price);
		request.setAttribute("add_price", add_price);
		request.setAttribute("reserve_days", reserve_days);
		request.setAttribute("fees", fees);
		request.setAttribute("storage_m", storage_m);
		request.setAttribute("sum_price", sum_price);
		
		System.out.println(request.getAttribute("check_in"));
		System.out.println(request.getAttribute("check_out"));
		System.out.println(request.getAttribute("getMileage"));
		forward.setRedirect(false);
		forward.setPath("./payment/PaymentForm.jsp");
		return forward;
	}
	
	

}
