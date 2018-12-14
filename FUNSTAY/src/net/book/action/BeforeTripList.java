package net.book.action;

import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.book.controller.Action;
import net.book.controller.ActionForward;
import net.book.db.BeforeBean;
import net.book.db.BookBean;
import net.book.db.BookDAO;
import net.booking.db.BookingBean;
import net.booking.db.PaymentBean;
import net.host.db.HostBean;
import net.search.db.SearchBean;

public class BeforeTripList implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BeforeTripList execute()");
		//request 한글처리
		request.setCharacterEncoding("utf-8");
		
		//home_num파라미터 가져오기
		HttpSession session=request.getSession();
		String member_email=(String)session.getAttribute("email");
		
		
		BookingBean bb=new BookingBean();
		PaymentBean pb=new PaymentBean();
		HostBean hb=new HostBean();
		BeforeBean BeforeB=new BeforeBean();
		
		BookDAO bdao=new BookDAO();
		//완료된 숙소 vector
		Vector vector=bdao.GetBeforeTrip(member_email);
		//예정된 숙소 vector2
		Vector vector2=bdao.GetAfterTrip(member_email);
		//취소된 숙소 vector3
		Vector vector3=bdao.GetCancelTrip(member_email);
		
		
		
		
		//완료된 숙소
		/*List<BookingBean> bookingList=(List<BookingBean>)vector.get(0);
		List<PaymentBean> paymentList=(List<PaymentBean>)vector.get(1);
		List<HostBean> hostList=(List<HostBean>)vector.get(2);*/
		List<BeforeBean> beforeList=(List<BeforeBean>)vector.get(0);
		
		//예정된숙소
		List<BookingBean> bookingList2=(List<BookingBean>)vector2.get(0);
	    List<PaymentBean> paymentList2=(List<PaymentBean>)vector2.get(1);
		List<HostBean> hostList2=(List<HostBean>)vector2.get(2);
		List<BeforeBean> afterList=(List<BeforeBean>)vector2.get(3);
		
		//취소된 숙소
		List<BookingBean> bookingList3=(List<BookingBean>)vector3.get(0);
	    List<PaymentBean> paymentList3=(List<PaymentBean>)vector3.get(1);
		List<HostBean> hostList3=(List<HostBean>)vector3.get(2);
		List<BeforeBean> afterList3=(List<BeforeBean>)vector3.get(3);
		
		
		
        //완료된 숙소 request 저장 
		/*request.setAttribute("bookingList", bookingList);
		request.setAttribute("paymentList", paymentList);
		request.setAttribute("hostList", hostList);*/
		request.setAttribute("beforeList", beforeList);
		
		 //예정된 숙소 request 저장 
		request.setAttribute("bookingList2", bookingList2);
		request.setAttribute("paymentList2", paymentList2);
		request.setAttribute("hostList2", hostList2);
		request.setAttribute("afterList", afterList);

		request.setAttribute("BeforeB", BeforeB);
		
		
		//취소된 숙소 request 저장
		request.setAttribute("bookingList3", bookingList3);
		request.setAttribute("paymentList3", paymentList3);
		request.setAttribute("hostList3", hostList3);
		request.setAttribute("afterList3", afterList3);
		
		
		
		
/*		
int pageSize = 10;

		
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null)
			pageNum = "1";

	
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;

	
		int endRow = currentPage * pageSize;
		
		
		
		List<SearchBean> SearchList = null;
		
			SearchList = bdao.getSearchList(startRow, pageSize);
		
		request.setAttribute("searchList", SearchList);
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("currentPage", currentPage);
		*/
		
		
		
		
		
		
		
		ActionForward forward=new ActionForward();
		//이동./myinfo/my_reserve.jsp
		forward.setRedirect(false); 
		forward.setPath("./myinfo/my_reserve.jsp");//포워딩 경로 설정
				
		return forward;
		
		
		
		
		
		
		
	}
	

}
