package net.member.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import net.member.db.MemberDAO;

public class MemberListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberListAction execute()");

		request.setCharacterEncoding("UTF-8");

		MemberDAO mdao = new MemberDAO();
		List MemberList =null;
		
		
		
		int count = mdao.getmemberCount();
		int pageSize =3;
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null)	
		{
			pageNum="1";
		}
		
		int currentPage=Integer.parseInt(pageNum);
		System.out.println(currentPage);
		int pageBlock =5;
		int startRow = (currentPage-1)*pageSize+1;
		int endRow = currentPage*pageSize;
		int pageCount = count/pageSize + (count%pageSize==0?0:1); 
		int startPage = ((currentPage-1)/pageBlock) * pageBlock+1;
		int endPage = startPage+pageBlock-1;
		if(count!=0)
		{
			MemberList = mdao.getMemberList(startRow, pageSize);
		}

		
		
		//저장 : count pageNum boardList
		// pageCount pageVlock startpage endPage
		
		request.setAttribute("count", count);
		request.setAttribute("MemberList", MemberList);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage",  endPage);
		
		
		
		
		request.setAttribute("count", count);
		
		ActionForward forward = new ActionForward();
		forward = new ActionForward();
		forward.setPath("./member/list.jsp");
		forward.setRedirect(false);
		return forward;
	}
	
}
