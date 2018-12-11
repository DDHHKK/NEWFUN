package net.member.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberFrontController extends HttpServlet {

	// http://localhost:8080/FUNSTAY/MemberMain.me
	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String requestURI = request.getRequestURI();
		//System.out.println("URL 주소:" + requestURI);

		String ContextPath = request.getContextPath();
		// System.out.println("������Ʈ �̸� ����:"+ContextPath.length()); //>>
		String command = requestURI.substring(ContextPath.length());

		//System.out.println("가상의 주소" + command);//>>/*.me

		ActionForward forward = null;
		Action action = null;

		// join
		if (command.equals("/MemberJoin.me")) {
			forward = new ActionForward();
			forward.setPath("./main/index.jsp");
			forward.setRedirect(false);

		} else if (command.equals("/MemberJoinAction.me")) {
			action = new MemberJoinAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// login
		}

		// template join
		if (command.equals("/SubMain.me")) {
			forward = new ActionForward();
			forward.setPath("./zjsp_template/template.jsp");
			/* forward.setPath("./include/header.jsp"); */
			forward.setRedirect(false);

		} else if (command.equals("/MemberJoinAction2.me")) {
			action = new MemberJoinAction2();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		else if (command.equals("/MemberLogin.me")) {
			forward = new ActionForward();
			forward.setPath("./main/index.jsp");
			forward.setRedirect(false);
		} else if (command.equals("/MemberLoginAction.me")) {
			action = new MemberLoginAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// template login
		else if (command.equals("/SubMain.me")) {
			forward = new ActionForward();
			forward.setPath("./zjsp_template/template.jsp");
			forward.setRedirect(false);
		} else if (command.equals("/MemberLoginAction2.me")) {
			action = new MemberLoginAction2();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// main
		else if (command.equals("/Main.me")) {
			forward = new ActionForward();
			forward.setPath("./main/index.jsp");
			forward.setRedirect(false);
		}

		// template main
		else if (command.equals("/template.me")) {
			forward = new ActionForward();
			forward.setPath("./zjsp_template/template.jsp");
			/* forward.setPath("./main/header.jsp"); */
			forward.setRedirect(false);

		}
		// logout
		else if (command.equals("/MemberLogout.me")) {
			action = new MemberLogoutAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}

		// zjsp_template logout
		else if (command.equals("/MemberLogout2.me")) {
			action = new MemberLogoutAction2();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// update

		} else if (command.equals("/MemberUpdate.me")) {
			action = new MemberUpdate();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MemberUpdateForm.me")) {
			forward = new ActionForward();
			forward.setPath("./mypage/update.jsp");
			forward.setRedirect(false);
		} else if (command.equals("/MemberUpdateAction.me")) {
			action = new MemberUpdateAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// delete
		} else if (command.equals("/MemberDelete.me")) {
			forward = new ActionForward();
			forward.setPath("./mypage/delete.jsp");
			forward.setRedirect(false);
		} else if (command.equals("/MemberDeleteAction.me")) {
			action = new MemberDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}

		// search
		else if (command.equals("/MemberSearchAction.me")) {
			action = new MemberSearchAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}

		else if (command.equals("/MemberSearchAction2.me")) {
			action = new MemberSearchAction2();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}

		else if (command.equals("/search.me")) {
			forward = new ActionForward();
			forward.setPath("./zjsp_template/template.jsp");
			forward.setRedirect(false);
		}

		// email check
		else if (command.equals("/MemberCheck.me")) {
			forward = new ActionForward();
			forward.setPath("./member/email_check.jsp");
			forward.setRedirect(false);
		} else if (command.equals("/MemberEmailCheckAction.me")) {
			action = new MemberEmailCheckAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// find ID
		} else if (command.equals("/find_id.me")) {
			forward = new ActionForward();
			forward.setPath("./id_pw_find/findform_id.jsp");
			forward.setRedirect(false);
		} else if (command.equals("/Id_FindAction.me")) {
			action = new Id_FindAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// find PASS
		} else if (command.equals("/find_pw.me")) {
			forward = new ActionForward();
			forward.setPath("./id_pw_find/findform_pw.jsp");
			forward.setRedirect(false);
		} else if (command.equals("/Pw_FindAction.me")) {
			action = new Pw_FindAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// pass check
		} else if (command.equals("/PassCheckForm.me")) {
			forward = new ActionForward();
			forward.setPath("./member/passwordCheck.jsp");
			forward.setRedirect(false);
		} else if (command.equals("/PassCheckAction.me")) {
			action = new PassCheckAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			} // pass Check

			// MemberList
		} else if (command.equals("/MemberList.me")) {
			forward = new ActionForward();
			forward.setPath("./member/list.jsp");
			forward.setRedirect(false);
		} else if (command.equals("/MemberListAction.me")) {
			action = new MemberListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			} // MemberList

			// DelteList

		} else if (command.equals("/DeleteListAction.me")) {
			action = new ListDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			} // DelteList

			// mileage
		} else if (command.equals("/MemberMileage.me")) {
			action = new MemberMileage();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MemberSearchMC.me")) {
			action = new MileageSearch();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MemberSearchMnav.me")) {
			action = new MileageSearchNav();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MemberQNA.me")) {
			action = new MemberQnaAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// QnA 내역확인
		else if (command.equals("/MemberQNAlist.me")) {
			action = new MemberQnaList();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MemberQNAcontent.me")) {
			action = new MemberQnaContent();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		if (forward != null) {
			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}

	}// doProcess

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("doget");
		doProcess(request, response);

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("dopost");
		doProcess(request, response);
	}

}
