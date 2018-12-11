package net.FAQ.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.FAQ.controller.Action;
import net.FAQ.controller.ActionForward;
import net.FAQ.db.FAQBean;
import net.FAQ.db.FAQDAO;

public class FAQ_boardWriteAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("FAQ_boardreWriteAction execute()");
		request.setCharacterEncoding("UTF-8");
		// -----------------------------------------------

		FAQDAO bdao = new FAQDAO();
		FAQBean fb = new FAQBean();
		
		/*fb.setFAQ_num(Integer.parseInt(request.getParameter("num")));*/
		fb.setFAQ_subject(request.getParameter("FAQ_subject"));
		fb.setFAQ_content(request.getParameter("FAQ_content"));
		
		
		bdao.FAQ_boardInsert(fb);

		// -----------------------------------------------
		ActionForward forward = new ActionForward();
		forward.setPath("./FAQ_boardList.fa");
		forward.setRedirect(false);

		return forward;
	}
}

