package net.host.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.host.db.HostBean;
import net.host.db.HostDAO;

public class HostModifyAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("HostModifyAction execute()"); 
		
		request.setCharacterEncoding("utf-8");
		
		HostBean hb=new HostBean();
		HostDAO hdao=new HostDAO();
		
		int home_num=Integer.parseInt(request.getParameter("home_num"));
		String room_subject=request.getParameter("room_subject");
		String room_content=request.getParameter("room_content");
		int restroom=Integer.parseInt(request.getParameter("restroom"));
		int price=Integer.parseInt(request.getParameter("price"));
		String address=request.getParameter("address");
		String in_time=request.getParameter("in_time");
		String out_time=request.getParameter("out_time");
		String room_type=request.getParameter("room_type");

		
		hb.setHome_num(home_num);
		hb.setRoom_subject(room_subject);
		hb.setRoom_content(room_content);
		hb.setRestroom(restroom);
		hb.setPrice(price);
		hb.setAddress(address);
		hb.setIn_time(in_time);
		hb.setOut_time(out_time);
		hb.setRoom_type(room_type);
		
		hdao.HostModify(hb);


		ActionForward forward=new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./HostRoomList.ho");
		return forward;
		
	}
	
	

}
