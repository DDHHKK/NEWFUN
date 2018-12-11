package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.db.MemberDAO;

public class MemberEmailCheckAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		String email = request.getParameter("email");
		MemberDAO mdao = new MemberDAO();
		
		int check = mdao.emailCheck(email);
		System.out.println(check);
		if(check==1){
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('중복된 email입니다');");
			out.print("location.href='./MemberCheck.me?email="+email+"'");
			out.println("</script>");
			out.close();
			
			return null;
		}else{
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('사용가능한 email입니다');");
			out.print("location.href='./MemberCheck.me?email="+email+"'");
			out.println("</script>");
			out.close();

			return null;
			
		}
		
	}
	
}

