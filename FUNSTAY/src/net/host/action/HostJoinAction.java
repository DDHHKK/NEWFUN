package net.host.action;


import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.bed.db.BedBean;
import net.conv.db.ConvBean;
import net.room.db.RoomBean;






public class HostJoinAction  implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("HostJoinAction execute()");
		
		request.setCharacterEncoding("utf-8");
		
		
	
		String room_subject=request.getParameter("room_subject");
		
		if(room_subject==null)
		{
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('방 제목이 입력되지 않았습니다.');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
		}
		String room_content=request.getParameter("room_content");
		if(room_content==null)
		{
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('방 정보가 입력되지 않았습니다.');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
		}
		
		int restroom=0;

		try{restroom=Integer.parseInt(request.getParameter("restroom"));} 
		catch(Exception e)
		{
			restroom=0;
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('욕실의 개수가 선택되지 않았습니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();}
		
		int price=0;
		try{price=Integer.parseInt(request.getParameter("price"));} 
		catch(Exception e)
		{	response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('방 가격이 입력되지 않았습니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		}
		String address= null;
		try{address=request.getParameter("address");} 
		catch(Exception e)
		{	response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('주소가 입력되지 않았습니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		}
				
		int end_date=0;
		try{end_date=Integer.parseInt(request.getParameter("end_date"));} 
		catch(Exception e)
		{	response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('호스팅 기간이 선택되지 않았습니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		}
	

		String in_time=null;
		String out_time=null;
		try
		{
			in_time=request.getParameter("in_time");
			out_time=request.getParameter("out_time");
		} 
		catch(Exception e){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('체크인 및 체크아웃이 가능한 시간이 입력되지 않았습니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		}
		
		String room_type=null;
		try{	room_type =request.getParameter("room_type");}
		catch(Exception e){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('룸 타입이 입력되지 않았습니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		}
		
		int re_room=0;
		try{	re_room =Integer.parseInt(request.getParameter("re_room"));}
		catch(Exception e){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('방 개수가 선택되지 않았습니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		}
		
		
		
		String[] convenience = null;
		if(request.getParameter("convenience") != null)
		{
			convenience=request.getParameterValues("convenience");
			
		}
		
		String [] num_conv = null;
		if(request.getParameter("num_conv") != null)
		{num_conv = request.getParameterValues("num_conv");}

		
		
		
		
		List bedlist = new ArrayList();
		List roomlist = new ArrayList();
		String[] single_beds =request.getParameterValues("room_single");
		String[] double_beds =request.getParameterValues("room_double");
		String[] bunk_beds =request.getParameterValues("room_bunk");
		String[] room_maxPs =request.getParameterValues("room_maxP");
		for(int i = 1; i<=re_room; i++)
		{
			
			BedBean bb = new BedBean();
			int single_bed=0;int double_bed=0;int bunk_bed=0;
			try{single_bed = Integer.parseInt(single_beds[i-1]);	} catch(Exception e){single_bed=0;}
			try{double_bed = Integer.parseInt(double_beds[i-1]);	} catch(Exception e){double_bed=0;}	
			try{ bunk_bed = Integer.parseInt(bunk_beds[i-1]);		} catch(Exception e){ bunk_bed=0;}
			int room_maxP = Integer.parseInt(room_maxPs[i-1]);	
			bb.setSingle_bed(single_bed);
			bb.setDouble_bed(double_bed);
			bb.setBunk_bed(bunk_bed);
			RoomBean rb = new RoomBean();
			int min_people = single_bed+(double_bed*2)+(bunk_bed*2);
			rb.setRe_room(i);
			
			rb.setMin_people(min_people);
			rb.setMax_people(room_maxP);
			bedlist.add(bb);
			roomlist.add(rb);
			
			
		}

		
	
		//request.setAttribute("bed_type", bed_type);
		request.setAttribute("room_subject",room_subject);
		request.setAttribute("room_content",room_content);
		request.setAttribute("restroom",restroom);
		request.setAttribute("price",price);
		request.setAttribute("end_date",end_date);
		request.setAttribute("address",address);
		request.setAttribute("in_time",in_time);
		request.setAttribute("out_time",out_time);
		request.setAttribute("room_type",room_type);
		request.setAttribute("convenience",convenience);
		request.setAttribute("re_room",re_room);
		request.setAttribute("num_conv", num_conv);
		HttpSession session=request.getSession();
		session.setAttribute("bedlist", bedlist);
		session.setAttribute("roomlist", roomlist);
		
		
		
		
		
		ActionForward forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./host/host_join3.jsp");
		return forward;
	}
}
