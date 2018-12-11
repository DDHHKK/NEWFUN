package net.host.action;



import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.bed.db.BedBean;
import net.conv.db.ConvBean;
import net.host.action.Action;
import net.host.action.ActionForward;
import net.host.db.HostBean;
import net.host.db.HostDAO;
import net.room.db.RoomBean;



public class HostInsertAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("HostInsertAction execute()");
		
		
		HttpSession session=request.getSession();
		String email=(String)session.getAttribute("email");
		
		
		
		/*String[] convenience=request.getParameterValues("convenience");
		request.setAttribute("convenience",convenience);*/
		
		//List<BedBean> bed_type= (List)request.getAttribute("bed_type");
		
		
		//System.out.println(convenience);
		
	/*	String name =null;
		for(int i=0; i<convenience.length; i++){
			name[]= request.getParameter("i");
		System.out.println(name);
		
		}*/
		
		ServletContext context=request.getServletContext();
		String realPath=context.getRealPath("/upload");
		int maxSize=10*1024*1024;
		MultipartRequest multi=new MultipartRequest(request, realPath,maxSize,"utf-8",new DefaultFileRenamePolicy());
	
		HostBean hb=new HostBean();
		HostDAO hdao=new HostDAO();
		RoomBean rb=new RoomBean();
		ConvBean cb=new ConvBean();
		BedBean bb=new BedBean();
		
		hb.setRoom_subject(multi.getParameter("room_subject"));
		hb.setRoom_content(multi.getParameter("room_content"));
		hb.setRoom_type(multi.getParameter("room_type"));
		hb.setRestroom(Integer.parseInt(multi.getParameter("restroom")));
		hb.setPrice(Integer.parseInt(multi.getParameter("price")));
		hb.setIn_time(multi.getParameter("in_time"));
		hb.setOut_time(multi.getParameter("out_time"));
		hb.setAddress(multi.getParameter("address"));
	
		rb.setRe_room(Integer.parseInt(multi.getParameter("re_room")));
		
		
		//cb.setEssential(Integer.parseInt(multi.getParameter("essential")));
		//cb.setDisabled(Integer.parseInt(multi.getParameter("disabled")));
		
		int end_date2=Integer.parseInt(multi.getParameter("end_date"));
		
	 
		hb.setPhoto(multi.getFilesystemName("photo1")+","
		+multi.getFilesystemName("photo2")+","
		+multi.getFilesystemName("photo3")+","
		+multi.getFilesystemName("photo4")+","
		+multi.getFilesystemName("photo5"));
		 
		
		 
		int host_check = hdao.hostCheck(email);
		
		if(host_check !=1){
				hdao.HostUser(email);
			}
	
		int home_num = hdao.insertHost(hb,email,end_date2);
		
		
		//hdao.insertConv(cb,home_num);
		
		//int room_num = hdao.insertRoom(rb, home_num);
		
/*		for(int i=0; i<bed_type.size(); i++)
		{
			System.out.println(i);
			bb = bed_type.get(i);
			
			
			
		}*/

		//hdao.insertBed(bb,room_num);

		ActionForward forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./host/host_main.jsp");
		return forward;
	
	}
	

}
