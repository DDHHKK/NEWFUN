package net.wishlist.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.wishlist.db.MyWishBean;
import net.wishlist.db.MyWishDAO;
import net.wishlist.db.WishlistBean;
import net.wishlist.db.WishlistDAO;

public class MyWish implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("MyWish execute()");
		int wishlist_num = Integer.parseInt(request.getParameter("wishlist_num"));
		/*HomeDAO hdao = new HomeDAO();
		hdao.getHome(home);*/
		MyWishDAO mwdao = new MyWishDAO();
		List<MyWishBean> mywishlist = mwdao.getMyWishlist(wishlist_num);
		request.setAttribute("mywishlist", mywishlist);

		/* 리스트 찾아가기 */
		HttpSession session = request.getSession();
		String member_email = (String)session.getAttribute("email");
		WishlistDAO wdao = new WishlistDAO();
		List<WishlistBean> Wishlist = wdao.getWishList(member_email);
		
		request.setAttribute("Wishlist", Wishlist);
		request.setAttribute("wishlist_num", wishlist_num);
		ActionForward af = new ActionForward();
		af.setRedirect(false);
		af.setPath("./myinfo/mywish.jsp");
		return af;
	}

}
