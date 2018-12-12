package net.host.action;




import java.text.SimpleDateFormat;
import java.util.Date;
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
import net.member.db.MemberBean;
import net.room.db.RoomBean;



public class HostInsertAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("HostInsertAction execute()");
		
		
		HttpSession session=request.getSession();
		String email=(String)session.getAttribute("email");
		
			

		List bedlist = (List)session.getAttribute("bedlist");
		List roomlist = (List)session.getAttribute("roomlist");
	
		
	
		
		
		ServletContext context=request.getServletContext();
		String realPath=context.getRealPath("/upload");
		int maxSize=10*1024*1024;
		MultipartRequest multi=new MultipartRequest(request, realPath,maxSize,"utf-8",new DefaultFileRenamePolicy());

		
		HostBean hb=new HostBean();
		HostDAO hdao= new HostDAO();
		ConvBean cb = new ConvBean();
		BedBean bb=new BedBean();
		MemberBean mb = new MemberBean();
		
		String[] num_conv= multi.getParameterValues("num_conv");
		
		cb.setEssential(Integer.parseInt(num_conv[0]));
		cb.setWifi(Integer.parseInt(num_conv[1]));
		cb.setParking(Integer.parseInt(num_conv[2]));
		cb.setShampoo(Integer.parseInt(num_conv[3]));
		cb.setAir_conditioner(Integer.parseInt(num_conv[4]));
		cb.setHeat(Integer.parseInt(num_conv[5]));
		cb.setAnimal(Integer.parseInt(num_conv[6]));
		cb.setDisabled(Integer.parseInt(num_conv[7]));
		cb.setParty(Integer.parseInt(num_conv[8]));
		cb.setPickup(Integer.parseInt(num_conv[9]));
		cb.setElevator(Integer.parseInt(num_conv[10]));
	
		cb.setBreakfast(Integer.parseInt(num_conv[11]));
		cb.setSmoking(Integer.parseInt(num_conv[12]));
		cb.setLaundry(Integer.parseInt(num_conv[13]));
		cb.setIron(Integer.parseInt(num_conv[14]));
		cb.setDesk(Integer.parseInt(num_conv[15]));
		
		cb.setExtra_bed(Integer.parseInt(num_conv[16]));
		cb.setHair_dryer(Integer.parseInt(num_conv[17]));

		hb.setRoom_subject(multi.getParameter("room_subject"));
		hb.setRoom_content(multi.getParameter("room_content"));
		hb.setRoom_type(multi.getParameter("room_type"));
		hb.setRestroom(Integer.parseInt(multi.getParameter("restroom")));
		hb.setPrice(Integer.parseInt(multi.getParameter("price")));
		hb.setIn_time(multi.getParameter("in_time"));
		hb.setOut_time(multi.getParameter("out_time"));
		hb.setAddress(multi.getParameter("address"));
		String end_dates = multi.getParameter("end_date");

		int end_date = Integer.parseInt(end_dates);
		
		
		mb.setProfile_photo(multi.getParameter("profile_photo"));

		//cb.setEssential(Integer.parseInt(multi.getParameter("essential")));
		//cb.setDisabled(Integer.parseInt(multi.getParameter("disabled")));
		
	//	int end_date2=Integer.parseInt(multi.getParameter("end_date"));
		
	 
		hb.setPhoto(multi.getFilesystemName("photo1")+","
		+multi.getFilesystemName("photo2")+","
		+multi.getFilesystemName("photo3")+","
		+multi.getFilesystemName("photo4")+","
		+multi.getFilesystemName("photo5"));
		 
	
		 
		int host_check = hdao.hostCheck(email);
		
		if(host_check !=1){
				hdao.HostUser(email);
			}
		int home_num = hdao.insertHost(hb,email,end_date);
		
		hdao.insertConv(cb, home_num);
		
		for(int i=0; i<roomlist.size(); i++)
		{
			RoomBean rb =(RoomBean)roomlist.get(i); 
			
			int room_num =hdao.insertRoom(rb, home_num);
			
		hdao.insertBed((BedBean)bedlist.get(i),room_num);
		}
		
		
		
		
		
		

		//hdao.insertBed(bb,room_num);
		session.removeAttribute("roomlist");
		session.removeAttribute("bedlist");
		session.removeAttribute("cb");
		ActionForward forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./host/host_main.jsp");
		return forward;
	
	}
	

}
