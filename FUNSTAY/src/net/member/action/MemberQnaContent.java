package net.member.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberDAO;
import net.member.db.QnaBean;

public class MemberQnaContent implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("Member QnA check execute()");
		ActionForward forward = new ActionForward();
		
		int QnA_num = Integer.parseInt(request.getParameter("QnA_num"));
		int re_ref = Integer.parseInt(request.getParameter("re_ref"));
		
		MemberDAO mdao = new MemberDAO();
		List<QnaBean> q_list = mdao.getQnAcontent(re_ref);
		
		request.setAttribute("q_list", q_list);
		request.setAttribute("QnA_num", QnA_num);
		
		forward.setRedirect(false);
		forward.setPath("./mypage/QnAcheckContent.jsp");
		return forward;
	}

}
