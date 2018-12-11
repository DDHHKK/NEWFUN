package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class Pw_FindAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		request.setCharacterEncoding("UTF-8");
		String email = request.getParameter("me_email"); 
		String name = request.getParameter("me_name"); 
				
		
		System.out.println(email);
		System.out.println(name);
		
		MemberBean mb = new MemberBean();
		mb.setEmail(email);
		mb.setName(name);
		
		MemberDAO mdao = new MemberDAO();
		String pass = mdao.findpw(mb);
		
		System.out.println("확인"+pass);
		if(pass!=null){
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호는"+pass+"입니다');");
			out.print("location.href='./Main.me'");
			out.println("</script>");
			out.close();
			return null;
		}else if(pass==null){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('정보가없습니다');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		}

		
		/*forward = new ActionForward();
		forward.setPath("./Main.me");
		forward.setRedirect(true);*/
		
		return forward;
	
	}
	
}
