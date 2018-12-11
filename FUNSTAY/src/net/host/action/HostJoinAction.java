package net.host.action;


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
		String room_content=request.getParameter("room_content");
		int restroom=Integer.parseInt(request.getParameter("restroom"));
		int price=Integer.parseInt(request.getParameter("price"));
		String address=request.getParameter("address");
		String start_date=request.getParameter("start_date");
		String end_date=request.getParameter("end_date");
		String in_time=request.getParameter("in_time");
		String out_time=request.getParameter("out_time");
		String room_type=request.getParameter("room_type");
		int re_room=Integer.parseInt(request.getParameter("re_room"));
		
		
		String[] convenience = null;
		if(request.getParameter("convenience") != null)
		{
			convenience=request.getParameterValues("convenience");
			for(String checkbox : convenience){System.out.println(checkbox);}
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
			try{single_bed = Integer.parseInt(single_beds[i]);	} catch(Exception e){single_bed=0;}
			try{double_bed = Integer.parseInt(double_beds[i]);	} catch(Exception e){double_bed=0;}	
			try{ bunk_bed = Integer.parseInt(bunk_beds[i]);		} catch(Exception e){ bunk_bed=0;}
			int room_maxP = Integer.parseInt(room_maxPs[i]);	
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
