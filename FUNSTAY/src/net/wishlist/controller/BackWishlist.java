package net.wishlist.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BackWishlist implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("BackWishlist execute()");
		ActionForward af = new ActionForward();
		af.setRedirect(true);
		af.setPath("./Wishlist.wi");
		return af;
	}

}
