package net.FAQ.Action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.FAQ.controller.Action;
import net.FAQ.controller.ActionForward;
import net.FAQ.db.FAQBean;
import net.FAQ.db.FAQDAO;


public class FAQ_boardUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberUpdateAction execute()");

		// 세션가져오기
		// 없으면 ./MemberLogin.me ActionForward 이용 이동

		request.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();
		
		FAQDAO bdao = new FAQDAO();
		FAQBean fb = new FAQBean();

		fb.setFAQ_num(Integer.parseInt(request.getParameter("FAQ_num")));
		fb.setFAQ_subject(request.getParameter("FAQ_subject"));
		fb.setFAQ_content(request.getParameter("FAQ_content"));
		bdao.FAQ_boardUpdate(fb);

		int result = bdao.FAQ_boardUpdate(fb);
		
		if(result == 1){
			forward = new ActionForward();
			forward.setPath("./FAQ_boardList.fa");
			forward.setRedirect(true);
			return forward;
		}
		else{
			response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('수정안되요');");
		out.println("history.back();");
		out.println("</script>");
		out.close();
		return null;
		}
		

	}
}