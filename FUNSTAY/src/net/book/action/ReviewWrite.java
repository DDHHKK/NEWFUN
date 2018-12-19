package net.book.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.book.controller.Action;
import net.book.controller.ActionForward;
import net.booking.db.BookingBean;
import net.review.db.ReviewDAO;
import net.search.db.SearchBean;
import net.search.db.SearchDAO;

 





public class ReviewWrite implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ReviewWrite execute()");

		// 세션가져오기
		// 없으면 ./MemberLogin.me ActionForward 이용 이동

		request.setCharacterEncoding("UTF-8");		
	
		String payment_num1 = request.getParameter("payment_num");
		
		
		
		BookingBean bb=new BookingBean();
		ReviewDAO rdao=new ReviewDAO();
		
		bb= rdao.getSearchHomenum(payment_num1);
		String payment_num=bb.getPayment_num();
		
		
		int home_num=bb.getHome_num();
		

		String pageNum = request.getParameter("pageNum");
		
		SearchDAO bdao = new SearchDAO();
		
		/*bdao.updateReadcount(num);*/ 
		

		
		HttpSession session = request.getSession();
		String Member_email = (String)session.getAttribute("email");
		
	
		request.setAttribute("payment_num", payment_num);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("home_num", home_num);
		request.setAttribute("Member_email", Member_email);
		ActionForward forward = new ActionForward();
		
		forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./ReviewWriteForm.bk");
		

		return forward;
	}
}