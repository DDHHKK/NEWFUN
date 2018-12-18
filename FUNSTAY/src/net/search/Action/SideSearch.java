package net.search.Action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.book.db.HomeBean;
import net.search.controller.Action;
import net.search.controller.ActionForward;
import net.search.db.SearchDAO;

public class SideSearch implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("SearchSide execute()");
		request.setCharacterEncoding("UTF-8");
		
		HomeBean hb = new HomeBean();
		Vector list = new Vector<>();
		String[] num_conv = null;
		try{	num_conv=request.getParameterValues("num_conv");	}
		catch(Exception e){
			for(int i=0; i<num_conv.length; i++)
			{
			
				num_conv[i]="0";
			
			}
			
		}
		list.add(num_conv);
		
		String[] convenience = null;
		try{	convenience=request.getParameterValues("conven");
		request.setAttribute("convenience",convenience);}
		catch(Exception e){
		e.printStackTrace();
			
		}
		for(int i =0; i<convenience.length; i++)
		{
			try{	System.out.print(convenience[i]);
			System.out.println(": "+num_conv[i]);
			}
			catch(NullPointerException e){

					e.printStackTrace();
					break;
			}
			
		}
		
		int from = Integer.parseInt(request.getParameter("from"));
		int to = Integer.parseInt(request.getParameter("to"));
		System.out.println("from : "+from);
		System.out.println("to : "+to);
		list.add(from);
		list.add(to);
		
		String satis = request.getParameter("star");
		System.out.println("satis" + satis);
		list.add(satis);
		
		String address = request.getParameter("address");

		list.add(address);
		
		String start_date = request.getParameter("start_date");
		String end_date = request.getParameter("end_date");
		list.add(start_date);
		list.add(end_date);
		
		int num = (Integer.parseInt(request.getParameter("text11")))+(Integer.parseInt(request.getParameter("text12")));
		list.add(num);
		
		int pageSize = 10;

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
		
		SearchDAO sdao = new SearchDAO();
		Vector<?> vec = sdao.getSideSearch(list,convenience,num_conv);
		
		HttpSession session = request.getSession();
		session.setAttribute("address", address);
		request.setAttribute("pageSize", pageSize);
	
		
		
		ActionForward forward = new ActionForward();
		forward.setPath("./room/search.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
