package net.member.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberDAO;
import net.member.db.QnaBean;

public class MemberQnaList implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("Member QnA check execute()");
		ActionForward forward = new ActionForward();
		
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		//email="kim@gmail.com";
		
		MemberDAO mdao = new MemberDAO();
		List<QnaBean> q_list = mdao.getQnAList(email);
		
		request.setAttribute("q_list", q_list);
		
		
		forward.setRedirect(false);
		forward.setPath("./mypage/QnAcheckList.jsp");
		return forward;
	}

}
