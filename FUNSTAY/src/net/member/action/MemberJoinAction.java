package net.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class MemberJoinAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		MemberBean mb = new MemberBean();
		MemberDAO mdao = new MemberDAO();
		ActionForward forward = new ActionForward();
		String filePath = null;
		if(request.getRealPath("/img")!=null){
			filePath=request.getRealPath("/img");
		}
		
		int MaxSize = 30 * 1024 * 1024;
		MultipartRequest multi = new MultipartRequest(request, filePath, MaxSize, "utf-8", new DefaultFileRenamePolicy());
		
		mb.setEmail(multi.getParameter("email"));
		mb.setPass(multi.getParameter("pass"));
		mb.setName(multi.getParameter("name"));
		/*mb.setProfile_photo(multi.getParameter("profile_photo"));*/
		mb.setPhone(multi.getParameter("phone"));
		mb.setBirth(multi.getParameter("birth_yy")+"년/"+multi.getParameter("birth_mm")+"월/"+multi.getParameter("birth_dd")+"일");
		
		
		
		/*mb.setEmail(request.getParameter("email"));
		mb.setPass(request.getParameter("pass"));
		mb.setName(request.getParameter("name"));
		mb.setProfile_photo(request.getParameter("profile_photo"));
		mb.setPhone(request.getParameter("phone"));
		System.out.println(mb.getPhone());
		mb.setBirth(request.getParameter("birth_yy")+"년/"+request.getParameter("birth_mm")+"월/"+request.getParameter("birth_dd")+"일");
		mb.setMileage(Integer.parseInt(request.getParameter("mileage")));
		*/
		
	/*String birth = birth_yy +"/"+birth_mm+"/"+birth_dd;
		
		MemeberBean mb = new MemberBean();
		mb.setbirth(birth);*/
		
		
		mdao.insertMember(mb);
		
		
		forward.setPath("./MemberLogin.me");
		forward.setRedirect(true);
		
		return forward;
	}
	
}
