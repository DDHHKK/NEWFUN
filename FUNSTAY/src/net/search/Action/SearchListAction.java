package net.search.Action;

import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.host.db.HostDAO;
import net.search.controller.Action;
import net.search.controller.ActionForward;
import net.search.db.SearchBean;
import net.search.db.SearchDAO;

public class SearchListAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("SearchListAction execute()");

		request.setCharacterEncoding("UTF-8");

		SearchDAO bdao = new SearchDAO();

		int count = bdao.getSearchCount();

		
		int pageSize = 10;

		
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null)
			pageNum = "1";

	
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;

	
		int endRow = currentPage * pageSize;

		List<SearchBean> SearchList = null;
		if (count != 0)
			SearchList = bdao.getSearchList(startRow, pageSize);
		
		request.setAttribute("boardList", SearchList);
		request.setAttribute("count", count);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("currentPage", currentPage);

	
		ActionForward forward = new ActionForward();
		forward.setPath("./room/search.jsp");
		forward.setRedirect(false);

		return forward;
	}
}