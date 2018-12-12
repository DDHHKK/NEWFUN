package net.book.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.book.controller.Action;
import net.book.controller.ActionForward;
import net.search.db.SearchBean;
import net.search.db.SearchDAO;







public class ReviewWrite implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ReviewWrite execute()");

		// 세션가져오기
		// 없으면 ./MemberLogin.me ActionForward 이용 이동

		
		request.setCharacterEncoding("UTF-8");		
		
		
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		
		
		SearchDAO bdao = new SearchDAO();
		bdao.updateReadcount(num); 
		SearchBean sc= bdao.getSearchboard(num);
		
		request.setAttribute("sc", sc);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("num", num);
		ActionForward forward = new ActionForward();
		
		forward = new ActionForward();
		forward.setPath("./ReviewWriteForm.bk");
		forward.setRedirect(false);

		return forward;
	}
}