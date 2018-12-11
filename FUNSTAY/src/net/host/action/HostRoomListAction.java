package net.host.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.host.db.HostDAO;

public class HostRoomListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		System.out.println("HostRoomListAction execute()");
		
		HttpSession session=request.getSession();
		String host_email=(String)session.getAttribute("email");
		
		HostDAO hdao=new HostDAO();
		
		List hostHome=hdao.getHostHomes(host_email);
		
		request.setAttribute("hostHome", hostHome);
		
		ActionForward forward=new ActionForward();
		
		forward.setRedirect(false);
		forward.setPath("./host/host_page.jsp");
		return forward;
		
	}

	
}
