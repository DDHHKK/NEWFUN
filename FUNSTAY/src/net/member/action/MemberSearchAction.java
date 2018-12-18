package net.member.action;

import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;
import java.util.Vector;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sun.org.apache.xalan.internal.xsltc.compiler.sym;

import net.host.db.HostBean;
import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class MemberSearchAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		HostBean hb = new HostBean();
		request.setCharacterEncoding("utf-8");
		String address = request.getParameter("address");
		hb.setAddress(address);
		String start_date = request.getParameter("start_date");
		String end_date = request.getParameter("end_date");
		int num = (Integer.parseInt(request.getParameter("text11")))+(Integer.parseInt(request.getParameter("text12")));

		//mb.setText11(Integer.parseInt(request.getParameter("text11")));
		//mb.setText12(Integer.parseInt(request.getParameter("text12")));
		
	

		System.out.println("searchAction" + hb.getAddress());
		System.out.println("searchAction" + start_date);
		System.out.println("searchAction" + end_date);
		System.out.println("searchAction" + num);
		
		if(hb.getAddress().equals(""))
		{
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('검색할 지역을 입력해 주세요');");
			out.println("history.back();");
			out.println("</script>");
			out.close();		
		}
		
		MemberDAO mdd= new MemberDAO();

		int pageSize = 10;

		Vector vector = mdd.getsearchList(hb, start_date, end_date,num);
		Vector vector2 = mdd.getsearchList2(hb, num);
		Vector vector3 = mdd.getsearchList3(hb);
	    List list=(List)vector.get(0);
		List past =(List)vector2.get(0);
		List rest =(List)vector3.get(0);
		HttpSession session = request.getSession();
		session.setAttribute("list", list);
		session.setAttribute("past", past);
		session.setAttribute("rest", rest);
		session.setAttribute("address", address);
		request.setAttribute("pageSize", pageSize);
		session.setAttribute("start_date", start_date);
		session.setAttribute("end_date", end_date);
		session.setAttribute("num", num);
		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./search.me");
	
		
		return forward;
	}

	
	
}
