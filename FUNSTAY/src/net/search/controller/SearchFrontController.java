package net.search.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.search.Action.Qna_boardWrite;
import net.search.Action.Qna_boardWriteAction;
import net.search.Action.Qna_boardreWrite;
import net.search.Action.Qna_boardreWriteAction;
import net.search.Action.RoomDetailAction;
import net.search.Action.SearchListAction;
import net.search.Action.SideSearch;




public class SearchFrontController extends HttpServlet{
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//가상주소 뽑아오기
		
		String requestURI=request.getRequestURI ();
		
		String contextPath=request.getContextPath();
	
		String command=requestURI.substring(contextPath.length());
		
		System.out.println("뽑아온 가상주소 : "+command);
		//뽑아온 가상주소 비교
		ActionForward forward=null;
		Action action=null; 
		
		//list 
		if (command.equals("/SearchList.sc")){
			action = new SearchListAction();
			try { 
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace(
						);   
			}
		}
		
		//content
		else if (command.equals("/RoomDetail.sc")){
			action = (Action) new RoomDetailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/RoomDetailAction.sc")){
			forward = new ActionForward();
			forward.setPath("./room_info/subpage.jsp");
			forward.setRedirect(false);
		}
		
		//QnA write
		if(command.equals("/Qna_boardWrite.sc")){
			action = new Qna_boardWrite();
			try {  
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/Qna_boardWriteForm.sc")){
			forward = new ActionForward();  
			forward.setPath("./room_info/Qna_boardWriteForm.jsp");
			forward.setRedirect(false);
		}
		
		//Qna_boardWriteAction.sc	
			else if(command.equals("/Qna_boardWriteAction.sc")){	
				action=new Qna_boardWriteAction();	
				try {  
					forward = action.execute(request, response);
				} catch (Exception e) {						
					e.printStackTrace(); 
				}
					
			}
		

		//답변작성Action	
		if(command.equals("/Qna_boardreWrite.sc")){
			action = new Qna_boardreWrite();
			try {  
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/Qna_boardreWriteForm.sc")){
			forward = new ActionForward();  
			forward.setPath("./room_info/Qna_boardreWriteForm.jsp");
			forward.setRedirect(false);
		}
		 
		//답변 Action	
		else if(command.equals("/Qna_boardreWriteAction.sc")){	
			action=new Qna_boardreWriteAction();	
			try {  
				forward = action.execute(request, response);
			} catch (Exception e) {						
				e.printStackTrace(); 
			}
				
		}
		
	

		//옵션 검색	
			else if(command.equals("/SideSearch.sc")){
			
				action=new SideSearch();	
				try {  
					forward = action.execute(request, response);
				} catch (Exception e) {						
					e.printStackTrace(); 
				}
					
			}

			
		//이동
		if(forward!=null){ //forward정보가 있으면
			if(forward.isRedirect()){
				//true sendRedirect()
				response.sendRedirect(forward.getPath());
			}else{
				//false forward()
				RequestDispatcher dispatcher
				=request.getRequestDispatcher(forward.getPath());
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
