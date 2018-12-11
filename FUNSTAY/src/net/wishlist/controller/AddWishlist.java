package net.wishlist.controller;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.wishlist.db.WishlistBean;
import net.wishlist.db.WishlistDAO;

public class AddWishlist implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("AddWishlist execute()");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String member_email = (String)session.getAttribute("email");
		WishlistDAO wdao = new WishlistDAO();
		int count = wdao.CountWishlist(member_email);
		ActionForward af = new ActionForward();
		af.setRedirect(true);
		if(count>=12)
		{
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('최대 항목입니다. 리스트를 제거 후 다시 시도 바랍니다.');");
				out.println("location.href='./Wishlist.wi'");
				out.println("</script>");
				out.close();
		}
		else
		{
			ServletContext context=request.getServletContext();
			String filePath=context.getRealPath("/upload");
			int maxSize=10*1024*1024;
			MultipartRequest multi = new MultipartRequest(request, filePath, maxSize, "utf-8", new DefaultFileRenamePolicy());
			
			WishlistBean wb = new WishlistBean();
			wb.setList_name(multi.getParameter("list_name"));
			wb.setMember_email(multi.getParameter("member_email"));
			wb.setList_photo(multi.getFilesystemName("list_photo"));
			wdao.addWishList(wb);
			System.out.println(wb.getList_photo());
			af.setPath("./Wishlist.wi");
			
		}
		return af;
	}

}
