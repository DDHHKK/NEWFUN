package net.FAQ.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.FAQ.controller.Action;
import net.FAQ.controller.ActionForward;
import net.FAQ.db.FAQBean;
import net.FAQ.db.FAQDAO;


public class FAQ_boardUpdate implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardUpdate execute()");

		// 세션가져오기
		// 없으면 ./MemberLogin.me ActionForward 이용 이동

		
		request.setCharacterEncoding("UTF-8");		
		
		
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		String FAQ_subject= request.getParameter("FAQ_subject");
		String FAQ_content = request.getParameter("FAQ_content");
		
		
		ActionForward forward = new ActionForward();
		if(pageNum==null){
			forward.setPath("./FAQ_boardList.fa");
			forward.setRedirect(true);
			return forward;
		}

		

		FAQDAO bdao = new FAQDAO();
		FAQBean fb = bdao.getFAQ_board(num);

		//데이터저장 fb
		request.setAttribute("fb", fb);
		request.setAttribute("num", num);
		request.setAttribute("FAQ_subject", FAQ_subject);
		request.setAttribute("FAQ_content", FAQ_content);
		
		
		// ActionForward 이동정보를 담아서 로그인 이동
		forward = new ActionForward();
		forward.setPath("./FAQ_boardUpdateForm.fa");
		forward.setRedirect(false);

		return forward;
	}
}