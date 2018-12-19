package net.search.Action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.book.db.HomeBean;
import net.host.db.HostBean;
import net.member.db.MemberDAO;
import net.search.controller.Action;
import net.search.controller.ActionForward;
import net.search.db.SearchDAO;

public class SideSearch implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("SearchSide execute()");
		request.setCharacterEncoding("UTF-8");
		
		HostBean hb = new HostBean();

		String[] num_conv = null;
		try{	num_conv=request.getParameterValues("num_conv");	}
		catch(Exception e){
			for(int i=0; i<num_conv.length; i++)
			{
			
				num_conv[i]="0";
			
			}
			
		}
		
		
		String[] convenience = null;
		try{	convenience=request.getParameterValues("conven");
		request.setAttribute("convenience",convenience);}
		catch(Exception e){
		e.printStackTrace();
			
		}
		
	
		
		
			System.out.println("111");
		int from=0;
		int to=0;
		try{	from = Integer.parseInt(request.getParameter("from"));
				System.out.println("222");
				to = Integer.parseInt(request.getParameter("to"));
			if(to==0)
			{System.out.println("333");to=10000000;}
			}
		catch(Exception e){
			from=0;
			to=10000000;
		}
		
		System.out.println("from : "+from);
		System.out.println("to : "+to);
	
		int satis =0;
		try{satis= Integer.parseInt(request.getParameter("star"));}
		catch(Exception e){satis=0;}
		
		System.out.println("satis" + satis);

		
		String address = request.getParameter("address");
		System.out.println("address" + address);
		hb.setAddress(address);
		
		String start_date = request.getParameter("start_date");
		String end_date = request.getParameter("end_date");
		System.out.println("start_date" + start_date);
		System.out.println("end_date" + end_date); 
		java.sql.Date start = java.sql.Date.valueOf(start_date);
		java.sql.Date end = java.sql.Date.valueOf(end_date);
		System.out.println("start_date" + start);
		System.out.println("end_date" + end); 

		hb.setStart_date(start);
		hb.setEnd_date(end);
		
		int num = Integer.parseInt(request.getParameter("num"));
		System.out.println("num"+num );

		
		int pageSize = 10;

		System.out.println("searchAction" + num);

		MemberDAO mdd= new MemberDAO();
		SearchDAO sdao = new SearchDAO();
		//Vector vector0 = mdd.getsearchList(hb, start_date, end_date,num);
		Vector vector = sdao.getSideSearch(hb, convenience, num, satis, from, to);
		Vector vector2 = mdd.getsearchList2(hb, num);
		Vector vector3 = mdd.getsearchList3(hb);
		int listcheck=0;
		List a = new ArrayList();
		List list =null;
		try{list=(List)vector.get(0);}
		catch(ArrayIndexOutOfBoundsException e)
		{list = a;}
	    
		List past =(List)vector2.get(0);
		List rest =(List)vector3.get(0);
		HttpSession session = request.getSession();

		session.setAttribute("list", list);
		session.setAttribute("past", a);
		session.setAttribute("rest", a);
		session.setAttribute("address", address);
		request.setAttribute("pageSize", pageSize);
		session.setAttribute("start_date", start_date);
		session.setAttribute("end_date", end_date);
		session.setAttribute("num", num);
		
	
		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./search.me?listcheck="+listcheck);
		return forward;
	}

}
