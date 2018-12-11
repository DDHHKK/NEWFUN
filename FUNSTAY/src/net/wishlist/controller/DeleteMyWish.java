package net.wishlist.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.wishlist.db.MyWishDAO;

public class DeleteMyWish implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("DeleteMyWish execute()");
		int wish_num = Integer.parseInt(request.getParameter("wish_num"));
		int wishlist_num = Integer.parseInt(request.getParameter("wishlist_num"));
		MyWishDAO mwdao = new MyWishDAO();
		mwdao.DeleteMyWish(wish_num);
		
		
		ActionForward af = new ActionForward();
		af.setRedirect(true);
		af.setPath("./MyWish.wi?wishlist_num="+wishlist_num);
		return af;
	}

}
