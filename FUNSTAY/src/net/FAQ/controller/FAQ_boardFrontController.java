package net.FAQ.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.FAQ.Action.FAQ_boardContentAction;
import net.FAQ.Action.FAQ_boardDeleteAction;
import net.FAQ.Action.FAQ_boardListAction;
import net.FAQ.Action.FAQ_boardUpdate;
import net.FAQ.Action.FAQ_boardUpdateAction;
import net.FAQ.Action.FAQ_boardWriteAction;




public class FAQ_boardFrontController extends HttpServlet{
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//가상주소 뽑아오기
		// http://localhost:8080/Model2/FAQ_boardWrite.fa
		String requestURI=request.getRequestURI ();
		
		String contextPath=request.getContextPath();
	
		String command=requestURI.substring(contextPath.length());
		
		System.out.println("뽑아온 가상주소 : "+command);
		//뽑아온 가상주소 비교
		ActionForward forward=null;
		Action action=null;
		
		//list
		if (command.equals("/FAQ_boardList.fa")){
			action = new FAQ_boardListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace(
						);
			}
		}
		
		//content
		else if (command.equals("/FAQ_boardContent.fa")){
			action = new FAQ_boardContentAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/FAQ_boardContentAction.fa")){
			forward = new ActionForward();
			forward.setPath("./FAQ/content.jsp");
			forward.setRedirect(false);
		}
		
		//write
		if(command.equals("/FAQ_boardWrite.fa")){
			//   ./board/writeForm.jsp 이동
			//  ActionForward 이동정보 저장
			//ActionForward 객체 생성
			forward=new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./FAQ/writeForm.jsp");
		}else if(command.equals("/FAQ_boardWriteAction.fa")){
			// BoardWriteAction자바 파일 만들기 <= Action틀 적용
			// execute() 강제적으로 메서드 오버라이딩 ,틀 강제적으로 적용
			// 부모 = BoardWriteAction 객체생성
			// 메서드 호출한 곳에서 예외처리
			//  forward 이동정보에 저장 =execute() 메서드 호출
			action=new FAQ_boardWriteAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		/*delete*/
		else if (command.equals("/FAQ_boardDelete.fa")) {
			// AdminGoodsDeleteAction
			action = new FAQ_boardDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
				
				
		//update
				else if (command.equals("/FAQ_boardUpdate.fa")){
					action = new FAQ_boardUpdate();
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						e.printStackTrace();
					}
				} else if (command.equals("/FAQ_boardUpdateForm.fa")){
					forward = new ActionForward();
					forward.setPath("./FAQ/updateForm.jsp");
					forward.setRedirect(false);
				} else if (command.equals("/FAQ_boardUpdateAction.fa")){
					action = new FAQ_boardUpdateAction();
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
