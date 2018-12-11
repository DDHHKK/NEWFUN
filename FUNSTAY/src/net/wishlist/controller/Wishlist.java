package net.wishlist.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.wishlist.db.WishlistBean;
import net.wishlist.db.WishlistDAO;

public class Wishlist implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("Wishlist execute()");
		HttpSession session = request.getSession();
		String member_email = (String)session.getAttribute("email");
		WishlistDAO wdao = new WishlistDAO();
		List<WishlistBean> Wishlist = wdao.getWishList(member_email);
		int listcount = wdao.CountWishlist(member_email);

		
		request.setAttribute("Wishlist", Wishlist);/*list값 전달*/
		request.setAttribute("listcount", listcount);/*만든 list개수*/
		
		ActionForward af = new ActionForward();
		af.setRedirect(false);
		af.setPath("./myinfo/wishlist.jsp");
		return af;
	}


}
