package net.member.action;

import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
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
import net.wishlist.db.WishlistBean;
import net.wishlist.db.WishlistDAO;

public class MemberSearchAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
	
	
		HostBean hb = new HostBean();
		request.setCharacterEncoding("utf-8");
		String address = request.getParameter("address");
		hb.setAddress(address);
		String start_date = request.getParameter("start_date");
		String end_date = request.getParameter("end_date");
		int num = (Integer.parseInt(request.getParameter("text11")))+(Integer.parseInt(request.getParameter("text12")));

		//mb.setText11(Integer.parseInt(request.getParameter("text11")));
		//mb.setText12(Integer.parseInt(request.getParameter("text12")));
		
	

/*		System.out.println("searchAction" + hb.getAddress());
		System.out.println("searchAction" + start_date);
		System.out.println("searchAction" + end_date);
		System.out.println("searchAction" + num);*/
		String email = (String)session.getAttribute("email");
		System.out.println(email);
		
		 if(email!=null)
		    { 
		    WishlistDAO wdao = new WishlistDAO();
		    List wishlist = wdao.getWishList(email);
		    System.out.println("d333333");
		    session.setAttribute("wishlist", wishlist);
		    }
		    
		
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

		List a = new ArrayList();
		List rest = null;
	    List list = null;
	    List past = null;
		Vector vector = mdd.getsearchList(hb, start_date, end_date,num);
		Vector vector2 = mdd.getsearchList2(hb, num);
		Vector vector3 = mdd.getsearchList3(hb);
		
		System.out.println(vector.size());
		int s = vector.size();
	    System.out.println("dwwwwww");
	    if(s==2)
	    {System.out.println("d22222wwwww");
	    	List avg=(List)vector.get(1);System.out.println("d233222wwwww");
	    	list=(List)vector.get(0);System.out.println("d242wwwww");
	    	session.setAttribute("avg", avg);System.out.println("d22552wwwww");
	    	session.setAttribute("list", list);System.out.println("d2226666wwww");
	    }
	    else if(vector.size()==1)
	    {System.out.println("dw333ww");
	    	list=(List)vector.get(0);
	    	session.setAttribute("list", list);
	    }
	    else if(vector2.size()==2)
	    {System.out.println("dwwww4444ww");
	    	List avg=(List)vector2.get(1);
	    	past =(List)vector2.get(0);
	    	session.setAttribute("avg", avg);
	    	session.setAttribute("past", past);
	    }
	    else if(vector2.size()==1)
	    {System.out.println("dwwww4444ww");
	    	past =(List)vector2.get(0);
	    	session.setAttribute("past", past);
	    }
	    
	    else if(vector3.size()==2)
	    {System.out.println("dwwww4444ww");
	    	List avg=(List)vector3.get(1);
	    	rest =(List)vector3.get(0);
	    	session.setAttribute("avg", avg);
	    	session.setAttribute("rest", rest);
	    }
	    else if(vector3.size()==1)
	    {System.out.println("dwwww4444ww");
	    	rest =(List)vector3.get(0);
	    	session.setAttribute("rest", rest);
	    }
	    else{System.out.println("dwwww4444ww");session.setAttribute("avg", a);
	    System.out.println("dww111111111ww");
		System.out.println(email);
	   
	    System.out.println("dww111111111ww");
		System.out.println(email);
	    session.setAttribute("rest", a);
	    session.setAttribute("past", a);
		session.setAttribute("list", a);}
	
		session.setAttribute("address", address);
	
		session.setAttribute("start_date", start_date);
		session.setAttribute("end_date", end_date);
		session.setAttribute("num", num);
		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./search.me?pageSize="+pageSize);
	
		
		return forward;
	}

	
	
}
