package net.FAQ.Action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.FAQ.controller.Action;
import net.FAQ.controller.ActionForward;
import net.FAQ.db.FAQBean;
import net.FAQ.db.FAQDAO;



public class FAQ_boardContentAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("contentAction execute()");
		request.setCharacterEncoding("UTF-8");
//-----------------------------------------------
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		
		FAQDAO bdao = new FAQDAO();
		bdao.updateReadcount(num);
		FAQBean fb = bdao.getFAQ_board(num);
		
		request.setAttribute("fb", fb);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("num", num);

//-----------------------------------------------
		ActionForward forward = new ActionForward();
		forward.setPath("./FAQ_boardContentAction.fa");
		forward.setRedirect(false);

		return forward;
	}	
}
