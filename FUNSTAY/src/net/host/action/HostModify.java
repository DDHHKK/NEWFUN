package net.host.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.conv.db.ConvBean;
import net.host.db.HostBean;
import net.host.db.HostDAO;

public class HostModify implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("HostModify execute()");
		
		int home_num=Integer.parseInt(request.getParameter("home_num"));
		
		HostDAO hdao=new HostDAO();
		
		HostBean hb=hdao.getHost(home_num);
		ConvBean cb=hdao.getConvenience(home_num);
		
		request.setAttribute("hb", hb);
		request.setAttribute("cb", cb);
		
		ActionForward forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./host/host_modify.jsp");
		return forward;
	}
	
	

}

