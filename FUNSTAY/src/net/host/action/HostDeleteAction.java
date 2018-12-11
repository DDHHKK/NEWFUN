package net.host.action;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.host.db.HostBean;
import net.host.db.HostDAO;

public class HostDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("HostDeleteAction execute()");
		
		int home_num=Integer.parseInt(request.getParameter("home_num"));
		
		HostDAO hdao=new HostDAO();
		HostBean hb=new HostBean();
		

		
		hdao.hostDelete(hb, home_num);
		
		
		ActionForward forward=new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./HostRoomList.ho");
		
		return forward;
	}
	
	
	

}
