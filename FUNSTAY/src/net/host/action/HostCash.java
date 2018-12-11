package net.host.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.booking.db.PaymentBean;
import net.host.db.HostBean;
import net.host.db.HostDAO;

public class HostCash implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("HostCash execute()");
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		String host_email = (String)session.getAttribute("email");
		int[] totalCash;
		
		HostDAO hdao = new HostDAO();
		
		//	호스트 여부 체크
		int result = hdao.hostCheck(host_email);
		
		if(result==1){
			System.out.println("host");
			// 해당 호스트의 cash 누적적립/인출 
			totalCash = hdao.getCashAmount(host_email);
			
			// 해당 호스트의 cash내역
			List<PaymentBean> c_list = hdao.getCashList(host_email);
			
			// 해당 호스트가 소유하고 있는 home정보
			List<HostBean> hostHome = hdao.getHostHomes(host_email);
			
			
			request.setAttribute("c_list", c_list);
			request.setAttribute("totalCash[0]", totalCash[0]);
			request.setAttribute("hostHome", hostHome);
			System.out.println(request.getAttribute("hostHome"));
			
			forward.setRedirect(false);
			forward.setPath("./mypage/HostCash.jsp");
		}else{
			System.out.println("not host");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("aler('유효한 접근이 아닙니다');");
			out.println("history.back();");
			out.println("</script>");
			return null;
		}
		
		return forward;
	}
	
	

}
