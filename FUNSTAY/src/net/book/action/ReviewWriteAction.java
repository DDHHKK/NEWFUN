package net.book.action;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.book.controller.Action;
import net.book.controller.ActionForward;
import net.book.db.ReviewBean;
import net.book.db.BookDAO;

public class ReviewWriteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ReviewWriteAction execute()");
		//request 한글처리
		request.setCharacterEncoding("utf-8");
		
		//ReviewBean bb객체생성
		ReviewBean bb=new ReviewBean();
		
	    bb.setPayment_num(request.getParameter("payment_num"));	    
		bb.setContent(request.getParameter("content"));
		bb.setSatisfaction(request.getParameter("satisfaction"));		
		bb.setClean(request.getParameter("clean"));	
		bb.setAccess(request.getParameter("access"));
		bb.setMember_email(request.getParameter("Member_email"));		
		
		int home_num = (Integer.parseInt(request.getParameter("home_num")));
		bb.setHome_num(home_num);
		/*bb.setStar(request.getParameter("star"));*/
		
		int pageNum=10;
		
		request.setAttribute("home_num", home_num);
		
		//BookDAO bdao객체생성
		BookDAO bdao=new BookDAO();
		//메서드호출 insertReview(폼파라미터 저장된 자바빈 주소)
		bdao.insertReview(bb);
		//이동  ./ReviewList.bo
		ActionForward forward=new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./RoomDetail.sc?num="+home_num+"&pageNum="+pageNum);
		return forward;
	}
	

}
















