﻿package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class Id_FindAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
	
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("me_name"); 
		String phone = (request.getParameter("me_hp1")+request.getParameter("me_hp2")+request.getParameter("me_hp3"));
		
		System.out.println(name);
		System.out.println(phone);
		
		MemberBean mb = new MemberBean();
		
		mb.setName(name);
		mb.setPhone(phone);
		
		MemberDAO mdao = new MemberDAO();
		String email = mdao.findid(mb);
		
		System.out.println("확인"+email);
		
		if(email!=null){
			forward = new ActionForward();
			forward.setPath("./id_pw_find/find_result.jsp");
			forward.setRedirect(false);
			return forward;
			
		}else if(email==null){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('정보가없습니다');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		}
			
	
		
		return null;
	}
	
}
