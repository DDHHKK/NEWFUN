package net.host.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.conv.db.ConvBean;
import net.host.db.HostBean;
import net.host.db.HostDAO;

public class HostModifyAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("HostModifyAction execute()"); 
		
		//한글 처리
		request.setCharacterEncoding("utf-8");
		
		//세션 이메일값 불러오기
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email"); 
		
		HostBean hb=new HostBean();
		HostDAO hdao=new HostDAO();
		ConvBean cb = new ConvBean();
		
		String [] num_conv = null;
		if(request.getParameter("num_conv") != null)
		{num_conv = request.getParameterValues("num_conv");
		
		cb.setEssential(Integer.parseInt(num_conv[0]));
		cb.setWifi(Integer.parseInt(num_conv[1]));
		cb.setParking(Integer.parseInt(num_conv[2]));
		cb.setShampoo(Integer.parseInt(num_conv[3]));
		cb.setAir_conditioner(Integer.parseInt(num_conv[4]));
		cb.setHeat(Integer.parseInt(num_conv[5]));
		cb.setAnimal(Integer.parseInt(num_conv[6]));
		cb.setDisabled(Integer.parseInt(num_conv[7]));
		cb.setParty(Integer.parseInt(num_conv[8]));
		cb.setPickup(Integer.parseInt(num_conv[9]));
		cb.setElevator(Integer.parseInt(num_conv[10]));
		System.out.println(Integer.parseInt(num_conv[10]));
		cb.setBreakfast(Integer.parseInt(num_conv[11]));
		cb.setSmoking(Integer.parseInt(num_conv[12]));
		cb.setLaundry(Integer.parseInt(num_conv[13]));
		cb.setIron(Integer.parseInt(num_conv[14]));
		cb.setDesk(Integer.parseInt(num_conv[15]));
		System.out.println(Integer.parseInt(num_conv[15]));
		cb.setExtra_bed(Integer.parseInt(num_conv[16]));
		cb.setHair_dryer(Integer.parseInt(num_conv[17]));
		cb.setHome_num(Integer.parseInt(request.getParameter("home_num")));
		}
		
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
		hb.setHost_email(email);
		hb.setAddress(address);
		hb.setRoom_type(room_type);
		hb.setRoom_subject(room_subject);
		hb.setRoom_content(room_content);
		hb.setRestroom(restroom);
		hb.setIn_time(in_time);
		hb.setOut_time(out_time);
		hb.setPrice(price);
		
		hdao.updateHome(hb);
		hdao.updateConvenience(cb);

		ActionForward forward=new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./HostRoomList.ho");
		return forward;
		
	}
	
	

}
