package net.review.action;

import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.review.controller.Action;
import net.review.controller.ActionForward;
import net.review.db.ReviewBean;
import net.review.db.ReviewDAO;

public class ReviewListAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("ReviewListAction execute()");

		request.setCharacterEncoding("UTF-8");

		ReviewDAO bdao = new ReviewDAO();
		System.out.println("1");
		int count = bdao.getReviewCount();
		System.out.println("2");
		// 한페이지에 보여줄 글의 개수
		int pageSize = 10;

		// 현페이지가 몇페이지인지 가져오기(기본 1페이지)
		String pageNum = request.getParameter("pageNum");
		System.out.println("3");
		if (pageNum == null)
			pageNum = "1"; // pageNum없으면 무조건 1페이지

		// 시작글 구하기 1 11 21 31 ... <= pageNum, pageSize 조합
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;

		// 끝행구하기
		int endRow = currentPage * pageSize;
		System.out.println("4");
		int home_num = 1;
		List<ReviewBean> ReviewList = null;
		if (count != 0)
			ReviewList = bdao.getReviewList(startRow, pageSize, home_num);
		
		request.setAttribute("boardList", ReviewList);
		request.setAttribute("count", count);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("currentPage", currentPage);

		System.out.println(ReviewList);
		System.out.println( count);
		System.out.println(pageNum);
		System.out.println(pageSize);
		System.out.println(currentPage);
		ActionForward forward = new ActionForward();
		forward.setPath("./room_info/room_review.jsp");
		forward.setRedirect(false);

		return forward;
	}
}