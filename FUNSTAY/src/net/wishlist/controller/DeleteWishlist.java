package net.wishlist.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.wishlist.db.WishlistDAO;

public class DeleteWishlist implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("DeleteWishlist execute()");
		request.setCharacterEncoding("utf-8");
		int wishlist_num = Integer.parseInt(request.getParameter("wishlist_num"));
		WishlistDAO wdao = new WishlistDAO();
		HttpSession session = request.getSession();
		String member_email = (String)session.getAttribute("email");
		wdao.DeleteWishlist(wishlist_num, member_email);
		ActionForward af = new ActionForward();
		af.setRedirect(true);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('리스트가 삭제되었습니다.');");
			out.println("location.href='./Wishlist.wi'");
			out.println("</script>");
			out.close();
		
		return af;
	}

}
