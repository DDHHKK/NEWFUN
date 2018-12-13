package net.host.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.bed.db.BedBean;
import net.conv.db.ConvBean;
import net.host.db.HostBean;
import net.host.db.HostDAO;
import net.room.db.RoomBean;

public class HostModify implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("HostModify execute()");
		
		int home_num=Integer.parseInt(request.getParameter("home_num"));
		
		HostDAO hdao=new HostDAO();
		int room_num= 0;
		
		HostBean hb= hdao.getHost(home_num);
		ConvBean cb= hdao.getConvenience(home_num);
		List<RoomBean> rooms = hdao.getRooms(home_num);
		List<BedBean> bed_list = new ArrayList<>();
		
		if(rooms!=null){
			for(int i=0; i<rooms.size(); i++) {
				room_num = rooms.get(i).getRoom_num();
				//System.out.println(room_num);
				BedBean bb = hdao.getBedType(room_num);
				//System.out.println(bb);
				bed_list.add(bb);
				//System.out.println(i);
			}
		}
		
		request.setAttribute("hb", hb);
		request.setAttribute("cb", cb);
		request.setAttribute("rooms", rooms);
		request.setAttribute("bed_list", bed_list);
		
		ActionForward forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./host/host_modify.jsp");
		return forward;
	}
	
	

}

