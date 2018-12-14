package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class MemberUpdateAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		
		request.setCharacterEncoding("UTF-8");
	
		
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("email");
		
		/*String photo11=(String)request.getAttribute("photo11");*/
		/*System.out.println("하하하ㅏ"+photo11);*/
		
		ActionForward forward = new ActionForward();
		if(email==null){
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		MemberDAO mdao = new MemberDAO();
		MemberBean mb = new MemberBean();
		
		
		
		String filePath = null;
		if(request.getRealPath("/upload")!=null){
			filePath=request.getRealPath("/upload");
		}
		
	
		int MaxSize = 30 * 1024 * 1024;
		MultipartRequest multi = new MultipartRequest(request, filePath, MaxSize, "utf-8", new DefaultFileRenamePolicy());
	
		
		String profile_photo = multi.getFilesystemName("profile_photo");
		String photo11 = multi.getParameter("photo11");
		String pass = multi.getParameter("pass");
		String pass11 = multi.getParameter("pass11");
		String passcheck = multi.getParameter("pass_check");
		
		mb.setEmail(multi.getParameter("email"));
		
		mb.setName(multi.getParameter("name"));
		mb.setPhone(multi.getParameter("phone"));
		mb.setBirth(multi.getParameter("birth"));
		if(profile_photo==null)
		{
			mb.setProfile_photo(photo11);
		}
		else
		{
			mb.setProfile_photo(profile_photo);
		}
		
		if(pass==null)
		{
			mb.setPass(pass11);
			mdao.updateMember(mb);
			
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('정보가 변경되었습니다');");
			out.println("location.href='./MemberUpdate.me'");
			out.println("</script>");
			out.close();
			return null;
		}
		else if(pass11==null)
		{
		
			if(pass.equals(passcheck)){
				mb.setPass(pass);
				mdao.updateMember(mb);
				
				
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('정보가 변경되었습니다');");
				out.println("location.href='./MemberUpdate.me'");
				out.println("</script>");
				out.close();
				return null;
				
			}
			System.out.println(">>>>>>>>>");
			return null;
		}else{
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('변경할 비밀번호를 입력해주세요');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		}
	
		


/*		mb.setEmail(request.getParameter("email"));
		mb.setPass(request.getParameter("pass"));
		mb.setName(request.getParameter("name"));
		mb.setProfile_photo(request.getParameter("profile_photo"));
		mb.setPhone(request.getParameter("phone"));
		mb.setBirth(request.getParameter("birth"));
		mb.setMileage(Integer.parseInt(request.getParameter("mileage")));*/
		

			
			/*forward = new ActionForward();
			forward.setPath("./MemberUpdateForm.me");
			forward.setRedirect(true);
			return forward;*/
		/*}else if(check == 0){
			//비밀번호 틀림
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호틀림');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		}else{
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('아이디없음');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		}
		*/
	}
}
