package net.search.Action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.db.QnaBean;
import net.review.db.ReviewBean;
import net.review.db.ReviewDAO;
import net.search.controller.Action;
import net.search.controller.ActionForward;
import net.search.db.SearchBean;
import net.search.db.SearchDAO;



public class RoomDetailAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("RoomDetailAction execute()");
		request.setCharacterEncoding("UTF-8");
//-----------------------------------------------
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		
		SearchDAO bdao = new SearchDAO();
		bdao.updateReadcount(num); 
		SearchBean sc= bdao.getSearchboard(num);
		
		request.setAttribute("sc", sc);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("num", num);
		
		
//-----------------------------------------------
		ReviewDAO rdao = new ReviewDAO();
		int count = rdao.getReviewCount();
		// 한페이지에 보여줄 글의 개수
		int pageSize = 10;

		// 현페이지가 몇페이지인지 가져오기(기본 1페이지)
		if (pageNum == null)
			pageNum = "1"; // pageNum없으면 무조건 1페이지

		// 시작글 구하기 1 11 21 31 ... <= pageNum, pageSize 조합
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;

		// 끝행구하기
		int endRow = currentPage * pageSize;
		int home_num = num;
		System.out.println(num);
		List<ReviewBean> ReviewList = null;
		if (count != 0)
			ReviewList = rdao.getReviewList(startRow, pageSize, home_num);
//-----------------------------------------------		
		SearchDAO sdao = new SearchDAO();
		int count1 = sdao.getQnaCount();
		List<QnaBean> QnAList = null;
		if (count1 != 0)
			QnAList = sdao.getQnAList(home_num);
		
		request.setAttribute("count1", count1);
		request.setAttribute("QnAList", QnAList);
		
		
		request.setAttribute("boardList", ReviewList);
		request.setAttribute("count", count);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("currentPage", currentPage);
		
		
		
		ActionForward forward = new ActionForward();
		forward.setPath("./RoomDetailAction.sc");
		forward.setRedirect(false);

		return forward;
	}	
}
