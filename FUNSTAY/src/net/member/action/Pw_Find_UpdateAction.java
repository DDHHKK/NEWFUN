package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class Pw_Find_UpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");


		String pass=request.getParameter("me_pass");
		String email=request.getParameter("email");
		String pass_check=request.getParameter("me_pass_check");
		
		/*System.out.println(pass_check);
		System.out.println(email);*/
		
		MemberDAO mdao=new MemberDAO();
		MemberBean mb=new MemberBean();

		mb.setPass(pass);
		mb.setEmail(email);
		
		
	if(pass.equals(pass_check)){
			
		
		mdao.updatePw(mb);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('비밀번호가 변경되었습니다.');");
		out.print("location.href='./Main.me'");
		out.println("</script>");
		out.close();
		return null;
		
	}else if(!pass.equals(pass_check)) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호가 일치하지 않습니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
	}
		
		return null;

}
	
	

}
