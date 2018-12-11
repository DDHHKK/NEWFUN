package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class MemberLoginAction2 implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = null;
		
		MemberBean mb = new MemberBean();
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		
		
		MemberDAO mdao = new MemberDAO();
		int check = mdao.userCheck(email, pass);
		if(check == 1){
			//로그인성공 세션값 생성 메인이동
			HttpSession session = request.getSession();
			session.setAttribute("email", email);
			
			forward = new ActionForward();
			forward.setPath("./SubMain.me");
			forward.setRedirect(true);
			return forward;
		}else if(check == 0){
			//비밀번호 틀림 뒤로 이동
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호틀림');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		}else{
		//아이디 없음
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('아이디없음');");
		out.println("history.back();");
		out.println("</script>");
		out.close();
		return null;	
		}
		return null;	
	}	
}
