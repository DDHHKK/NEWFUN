package net.wishlist.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.host.db.HostBean;
import net.host.db.HostDAO;
import net.host.db.HostBean;
import net.host.db.HostDAO;
import net.wishlist.db.MyWishDAO;

public class AddMyWish implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("Wishlist execute()");
		int home_num = Integer.parseInt(request.getParameter("home_num"));
		int wishlist_num = Integer.parseInt(request.getParameter("wishlist_num"));
		HostDAO hdao = new HostDAO();
		HostBean hb = hdao.getHost(home_num);//home 정보 불러내기
		MyWishDAO mwdao = new MyWishDAO();
		int heart = mwdao.insertMyWish(hb, wishlist_num);
		//
		ActionForward af = new ActionForward();
		af.setRedirect(true);
		af.setPath("./MyWish.wi?wishlist_num="+wishlist_num+"&heart="+heart);
		return af;
	}

}
