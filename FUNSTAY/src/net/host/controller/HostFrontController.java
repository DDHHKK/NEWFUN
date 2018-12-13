package net.host.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.host.action.Action;
import net.host.action.ActionForward;
import net.host.action.BookingList;
import net.host.action.HostCash;
import net.host.action.HostDeleteAction;
import net.host.action.HostInsertAction;
import net.host.action.HostJoinAction;
import net.host.action.HostPassCheckAction;
import net.host.action.HostRoomListAction;
import net.host.action.HostModify;
import net.host.action.HostModifyAction;





public class HostFrontController extends HttpServlet{
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		
		String requestURI = request.getRequestURI();
		String ContextPath = request.getContextPath();
		String command= requestURI.substring(ContextPath.length());
		System.out.println("가상의 주소:" + command);
		
		ActionForward forward = null;
		Action action = null;
		
		
		if(command.equals("/HostMain.ho")){
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./host/host_main.jsp");
		
		}else if(command.equals("/HostJoin1.ho")){
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./host/host_join1.jsp");
			
			
			
			
		}else if(command.equals("/HostJoinAction.ho")){
			action = new HostJoinAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/HostInsertAction.ho")){
			action = new HostInsertAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//호스트 캐쉬
		else if(command.equals("/HostCash.ho")){
			action = new HostCash();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){e.printStackTrace();}
		}
		
		//호스트 페이지 패스워드 체크
		else if(command.equals("/HostPassCheck.ho")){
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./host/hostPassCheck.jsp");
		
		//패스워드 체크 후 호스트 숙소 관리 페이지 들어가는 곳
		}/*else if(command.equals("/HostPage.ho")){
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./host/host_page.jsp");
			
		}*/
		//호스트 페이지 패스워드 체크 액션페이지
		else if(command.equals("/HostPassCheckAction.ho")){
			action = new HostPassCheckAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){e.printStackTrace();}
		}
				
		//호스트 숙소 삭제페이지(디비에 삭제되는거 아니고 비활성화 상태가 됨)
		else if(command.equals("/HostDelete.ho")){
			action = new HostDeleteAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){e.printStackTrace();}
		}
		
		//숙소 정보 수정하는 곳
		else if(command.equals("/HostModifyAction.ho")){
			action = new HostModifyAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){e.printStackTrace();}
			
		}else if(command.equals("/HostModify.ho")){
			action = new HostModify();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){e.printStackTrace();}
		}
		
			// 예약내역 확인
		else if(command.equals("/BookingList.ho")){
			action =  new BookingList();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){e.printStackTrace();}
			/*forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./payment/PaymentForm.jsp");*/
		} 
		
		//호스트 페이지에 호스트가 등록한 숙소 보여주는 list
		else if(command.equals("/HostRoomList.ho")){
			action = new HostRoomListAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){e.printStackTrace();}
		}
		
		
		
		
		
		if (forward != null) {
			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doProcess(request, response);
	}
	

}