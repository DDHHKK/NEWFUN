package net.search.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.db.QnaBean;
import net.search.controller.Action;
import net.search.controller.ActionForward;
import net.search.db.SearchDAO;

public class Qna_boardWrite implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ReviewWrite execute()");

		// 세션가져오기
		// 없으면 ./MemberLogin.me ActionForward 이용 이동

		
		request.setCharacterEncoding("UTF-8");		
		
		
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		
		int qna_num = num;
		SearchDAO bdao = new SearchDAO();
		bdao.qna_updateReadcount(qna_num);
		QnaBean qb= bdao.getQnaboard(num);
		
		request.setAttribute("qb", qb);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("num", num);
		ActionForward forward = new ActionForward();
		
		forward = new ActionForward();
		forward.setPath("./Qna_boardWriteForm.sc");
		forward.setRedirect(false);

		return forward;
	}
}