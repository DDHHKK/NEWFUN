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
		Vector list = new Vector<>();
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
		
			try{	for(int i =0; i<convenience.length; i++)
				{	System.out.print(convenience[i]);
					System.out.println(": "+num_conv[i]);
				}
			}
			catch(NullPointerException e){

					e.printStackTrace();
				
			}
			
		
		
		int from = Integer.parseInt(request.getParameter("from"));
		int to = Integer.parseInt(request.getParameter("to"));
		System.out.println("from : "+request.getParameter("from"));
		System.out.println("to : "+request.getParameter("to"));
		list.add(from);
		list.add(to);
		
		int satis = Integer.parseInt(request.getParameter("star"));
		System.out.println("satis" + satis);
		list.add(satis);
		
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
		
		System.out.println(convenience.length);
		
		SearchDAO sdao = new SearchDAO();
		Vector<?> vec = sdao.getSideSearch(hb,convenience,num,satis,from,to);
		List Searchlist = (List)vec.get(0);
		List roomlist = (List)vec.get(1);
		
		HttpSession session = request.getSession();
		
		session.setAttribute("address", address);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("roomlist", roomlist);
		request.setAttribute("Searchlist", Searchlist);
		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./search.me");
		return forward;
	}

}
