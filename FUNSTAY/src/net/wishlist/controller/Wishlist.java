package net.wishlist.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.wishlist.db.MyWishBean;
import net.wishlist.db.MyWishDAO;
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
		
		for(int i=0; i<Wishlist.size(); i++)
		{
			System.out.println("dddddd");
		WishlistBean wb = Wishlist.get(i);
		int wishlist_num = wb.getWishlist_num();
		System.out.println(wishlist_num);
		MyWishDAO mwdao = new MyWishDAO();
		List wishlist = mwdao.getMyWishlist(wishlist_num);
		String photo = null;
		if(wishlist.size()!=0)
		{
			System.out.println("dddddd");
			MyWishBean mwb = (MyWishBean)wishlist.get(0);
			 photo = mwb.getHome_photo();
			 System.out.println(photo);
			 System.out.println(wishlist_num);
			 wdao.updatePhoto(wishlist_num, photo);
		}
		
		}
		List<WishlistBean> Wishlist2 = wdao.getWishList(member_email);
		int listcount = wdao.CountWishlist(member_email);
	
		
		request.setAttribute("Wishlist", Wishlist2);/*list값 전달*/
		request.setAttribute("listcount", listcount);/*만든 list개수*/
		
		ActionForward af = new ActionForward();
		af.setRedirect(false);
		af.setPath("./myinfo/wishlist.jsp");
		return af;
	}


}
