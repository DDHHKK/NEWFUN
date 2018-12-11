package net.host.action;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.bed.db.BedBean;






public class HostJoinAction  implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("HostJoinAction execute()");
		
		request.setCharacterEncoding("utf-8");
		
		
	
		String room_subject=request.getParameter("room_subject");
		String room_content=request.getParameter("room_content");
		int restroom=Integer.parseInt(request.getParameter("restroom"));
		int price=Integer.parseInt(request.getParameter("price"));
		String address=request.getParameter("address");
		String start_date=request.getParameter("start_date");
		String end_date=request.getParameter("end_date");
		String[] convenience=request.getParameterValues("convenience");
		String in_time=request.getParameter("in_time");
		String out_time=request.getParameter("out_time");
		String room_type=request.getParameter("room_type");
		int re_room=Integer.parseInt(request.getParameter("re_room"));
		
		/*List<BedBean> bed_type = new ArrayList<BedBean>();
		BedBean bb = new BedBean();

		for(int i=0; i<re_room; i++){
		
		int room_single = Integer.parseInt(request.getParameter("room"+(i+1)+"_single"));
		int room_bunk = Integer.parseInt(request.getParameter("room"+(i+1)+"_bunk"));
		int room_double = Integer.parseInt(request.getParameter("room"+(i+1)+"_double"));
		bb.setSingle_bed(room_single);
		bb.setDouble_bed(room_double);
		bb.setBunk_bed(room_bunk);
		bed_type.add(bb);
		
		
		}*/
		
	
		//request.setAttribute("bed_type", bed_type);
		request.setAttribute("room_subject",room_subject);
		request.setAttribute("room_content",room_content);
		request.setAttribute("restroom",restroom);
		request.setAttribute("price",price);
		request.setAttribute("start_date",start_date);
		request.setAttribute("end_date",end_date);
		request.setAttribute("address",address);
		request.setAttribute("in_time",in_time);
		request.setAttribute("out_time",out_time);
		request.setAttribute("room_type",room_type);
		request.setAttribute("convenience",convenience);
		request.setAttribute("re_room",re_room);

		
		
	
		
		ActionForward forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./host/host_join3.jsp");
		return forward;
	}
}
